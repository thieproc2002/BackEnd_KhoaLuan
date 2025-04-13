package iuh.edu.service;

import iuh.edu.entity.Product;
import iuh.edu.entity.SearchHistory;
import iuh.edu.repository.OrderDetailRepository;
import iuh.edu.repository.ProductRepository;
import iuh.edu.repository.SearchHistoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RecommendationService {
    private final SearchHistoryRepository searchHistoryRepo;
    private final ProductRepository productRepo;

    public List<Product> recommendProducts(Long userId) {
        // Lấy lịch sử từ khóa
        List<SearchHistory> history = searchHistoryRepo.findTop5ByUser_UserIdOrderBySearchedAtDesc(userId);

        // Tìm sản phẩm liên quan đến từ khóa
        Set<Product> recommended = new HashSet<>();
        for (SearchHistory h : history) {
            List<Product> matches = productRepo.findByNameContainingIgnoreCase(h.getKeyword());
            recommended.addAll(matches);
        }


        return recommended.stream()
                .limit(20)
                .collect(Collectors.toList());

    }
}
