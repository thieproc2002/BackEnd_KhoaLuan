package iuh.edu.repository;

import iuh.edu.entity.SearchHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SearchHistoryRepository extends JpaRepository<SearchHistory, Long> {
    List<SearchHistory> findTop5ByUser_UserIdOrderBySearchedAtDesc(Long userId);
}
