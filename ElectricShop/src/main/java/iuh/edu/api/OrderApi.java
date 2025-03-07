
package iuh.edu.api;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import iuh.edu.entity.Cart;
import iuh.edu.entity.CartDetail;
import iuh.edu.entity.Order;
import iuh.edu.entity.OrderDetail;
import iuh.edu.entity.Product;
import iuh.edu.repository.CartDetailRepository;
import iuh.edu.repository.CartRepository;
import iuh.edu.repository.OrderDetailRepository;
import iuh.edu.repository.OrderRepository;
import iuh.edu.repository.ProductRepository;
import iuh.edu.repository.UserRepository;
import iuh.edu.utils.SendMailUtil;

@CrossOrigin("*")
@RestController
@RequestMapping("api/orders")
public class OrderApi {

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    CartDetailRepository cartDetailRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    SendMailUtil senMail;

    @GetMapping
    public ResponseEntity<Page<Order>> findAll(Pageable pageable) {
        return ResponseEntity.ok(orderRepository.findAllByOrderByOrdersIdDesc(pageable));
    }

    @GetMapping("{id}")
    public ResponseEntity<Order> getById(@PathVariable("id") Long id) {
        if (!orderRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(orderRepository.findById(id).get());
    }

    @GetMapping("/user/{email}")
    public ResponseEntity<List<Order>> getByUser(@PathVariable("email") String email) {
        if (!userRepository.existsByEmail(email)) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity
                .ok(orderRepository.findByUserOrderByOrdersIdDesc(userRepository.findByEmail(email).get()));
    }

    @PostMapping("/{email}")
    public ResponseEntity<Order> checkout(@PathVariable("email") String email, @RequestBody Cart cart) {
        if (!userRepository.existsByEmail(email)) {
            return ResponseEntity.notFound().build();
        }
        if (!cartRepository.existsById(cart.getCartId())) {
            return ResponseEntity.notFound().build();
        }
        List<CartDetail> items = cartDetailRepository.findByCart(cart);
        Double amount = 0.0;
        for (CartDetail i : items) {
            amount += i.getPrice();
        }
        Order order = orderRepository.save(new Order(0L, new Date(), amount, cart.getAddress(), cart.getPhone(), 0,
                userRepository.findByEmail(email).get()));
        for (CartDetail i : items) {
            OrderDetail orderDetail = new OrderDetail(0L, i.getQuantity(), i.getPrice(), i.getProduct(), order);
            orderDetailRepository.save(orderDetail);
        }
//		cartDetailRepository.deleteByCart(cart);
        for (CartDetail i : items) {
            cartDetailRepository.delete(i);
        }
        senMail.sendMailOrder(order);
        return ResponseEntity.ok(order);
    }

    @GetMapping("cancel/{orderId}")
    public ResponseEntity<Void> cancel(@PathVariable("orderId") Long id) {
        if (!orderRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        Order order = orderRepository.findById(id).get();
        order.setStatus(3);
        orderRepository.save(order);
        senMail.sendMailOrderCancel(order);
        return ResponseEntity.ok().build();
    }

    @GetMapping("deliver/{orderId}")
    public ResponseEntity<Void> deliver(@PathVariable("orderId") Long id) {
        if (!orderRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        Order order = orderRepository.findById(id).get();
        order.setStatus(1);
        orderRepository.save(order);
        senMail.sendMailOrderDeliver(order);
        return ResponseEntity.ok().build();
    }

    @GetMapping("success/{orderId}")
    public ResponseEntity<Void> success(@PathVariable("orderId") Long id) {
        if (!orderRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        Order order = orderRepository.findById(id).get();
        order.setStatus(2);
        orderRepository.save(order);
        senMail.sendMailOrderSuccess(order);
        updateProduct(order);
        return ResponseEntity.ok().build();
    }

    public void updateProduct(Order order) {
        List<OrderDetail> listOrderDetail = orderDetailRepository.findByOrder(order);
        for (OrderDetail orderDetail : listOrderDetail) {
            Product product = productRepository.findById(orderDetail.getProduct().getProductId()).get();
            if (product != null) {
                product.setQuantity(product.getQuantity() - orderDetail.getQuantity());
                product.setSold(product.getSold() + orderDetail.getQuantity());
                productRepository.save(product);
            }
        }
    }

}
