
package iuh.edu.api;

import java.time.LocalDateTime;
import java.util.List;

import iuh.edu.entity.SearchHistory;
import iuh.edu.repository.SearchHistoryRepository;
import iuh.edu.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import iuh.edu.entity.Category;
import iuh.edu.entity.Product;
import iuh.edu.repository.CategoryRepository;
import iuh.edu.repository.ProductRepository;

@CrossOrigin("*")
@RestController
@RequestMapping("api/products")
public class ProductApi {

    @Autowired
    ProductRepository repo;
    @Autowired
    SearchHistoryRepository searchRepo;
    @Autowired
    CategoryRepository cRepo;
    @Autowired
    UserRepository uRepo;
    @GetMapping
    public ResponseEntity<Page<Product>> getAll(Pageable pageable) {
        return ResponseEntity.ok(repo.findByStatusTrue(pageable));
    }
    @GetMapping("/nopage")
    public ResponseEntity<List<Product>> getAllNopage() {
        return ResponseEntity.ok(repo.findAll());
    }
    @GetMapping("bestseller")
    public ResponseEntity<List<Product>> getBestSeller() {
        return ResponseEntity.ok(repo.findByStatusTrueOrderBySoldDesc());
    }

    @GetMapping("bestseller-admin")
    public ResponseEntity<List<Product>> getBestSellerAdmin() {
        return ResponseEntity.ok(repo.findTop10ByOrderBySoldDesc());
    }

    @GetMapping("latest")
    public ResponseEntity<List<Product>> getLasted() {
        return ResponseEntity.ok(repo.findByStatusTrueOrderByEnteredDateDesc());
    }

    @GetMapping("rated")
    public ResponseEntity<List<Product>> getRated() {
        return ResponseEntity.ok(repo.findProductRated());
    }

    @GetMapping("suggest/{categoryId}/{productId}")
    public ResponseEntity<List<Product>> suggest(@PathVariable("categoryId") Long categoryId,
                                                 @PathVariable("productId") Long productId) {
        return ResponseEntity.ok(repo.findProductSuggest(categoryId, productId, categoryId, categoryId));
    }

    @GetMapping("category/{id}")
    public ResponseEntity<List<Product>> getByCategory(@PathVariable("id") Long id) {
        if (!cRepo.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        Category c = cRepo.findById(id).get();
        return ResponseEntity.ok(repo.findByCategory(c));
    }

    @GetMapping("{id}")
    public ResponseEntity<Product> getById(@PathVariable("id") Long id) {
        if (!repo.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(repo.findById(id).get());
    }

    @PostMapping
    public ResponseEntity<Product> post(@RequestBody Product product) {
        if (repo.existsById(product.getProductId())) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok(repo.save(product));
    }

    @PutMapping("{id}")
    public ResponseEntity<Product> put(@PathVariable("id") Long id, @RequestBody Product product) {
        if (!id.equals(product.getProductId())) {
            return ResponseEntity.badRequest().build();
        }
        if (!repo.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(repo.save(product));
    }

    @DeleteMapping("{product_id}")
    public ResponseEntity<Void> delete(@PathVariable("product_id") Long id) {
        if (!repo.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        Product p = repo.findById(id).get();
        p.setStatus(false);
        repo.save(p);
        return ResponseEntity.ok().build();
    }
    @PostMapping("/search/{userId}")
    public ResponseEntity<List<Product>> searchProducts(@PathVariable("userId") Long userId, @RequestBody String keyword) {

        List<Product> result = repo.findByNameContainingIgnoreCase(keyword);

        // Lưu lịch sử tìm kiếm
        uRepo.findById(userId).ifPresent(user -> {
            SearchHistory history = new SearchHistory();
            history.setKeyword(keyword);
            history.setUser(user);
            history.setSearchedAt(LocalDateTime.now());
            searchRepo.save(history);
        });

        return ResponseEntity.ok(result);
    }
}