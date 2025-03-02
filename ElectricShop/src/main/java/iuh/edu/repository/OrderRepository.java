
package iuh.edu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import iuh.edu.entity.Order;
import iuh.edu.entity.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findByUser(User user);

    List<Order> findByUserOrderByOrdersIdDesc(User user);

    List<Order> findAllByOrderByOrdersIdDesc();

    List<Order> findByStatus(int status);

}
