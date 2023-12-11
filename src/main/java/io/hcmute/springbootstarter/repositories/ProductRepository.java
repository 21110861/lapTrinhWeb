package io.hcmute.springbootstarter.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import io.hcmute.springbootstarter.models.Product;

public interface ProductRepository extends CrudRepository<Product, Integer>{
	public List<Product> findAllByCategoryId(int categoryId);
    public List<Product> findAllByCategoryIdAndStatus(int categoryId, String status);
    public List<Product> findAllByStatus(String status);
    public List<Product> findAllByTitleContainingIgnoreCase(String keyword);
    public List<Product> findAllByStatusOrderByTitleAsc(String status);
    public List<Product> findAllByStatusOrderByTitleDesc(String status);
 // Phương thức phân trang cho tất cả các sản phẩm
    Page<Product> findAll(Pageable pageable);

    // Phương thức phân trang cho sản phẩm theo categoryId
    Page<Product> findAllByCategoryId(int categoryId, Pageable pageable);

    // Phương thức phân trang cho sản phẩm theo categoryId và status
    Page<Product> findAllByCategoryIdAndStatus(int categoryId, String status, Pageable pageable);

    // Phương thức phân trang cho sản phẩm theo status
    Page<Product> findAllByStatus(String status, Pageable pageable);

    // Phương thức phân trang cho sản phẩm theo keyword trong tiêu đề
    Page<Product> findAllByStatusAndTitleContainingIgnoreCase(String status,String keyword, Pageable pageable);

    // Phương thức phân trang cho sản phẩm theo status và sắp xếp theo tiêu đề tăng dần
    Page<Product> findAllByStatusOrderByTitleAsc(String status, Pageable pageable);

    // Phương thức phân trang cho sản phẩm theo status và sắp xếp theo tiêu đề giảm dần
    Page<Product> findAllByStatusOrderByTitleDesc(String status, Pageable pageable);
}