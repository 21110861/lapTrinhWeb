package io.hcmute.springbootstarter.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import io.hcmute.springbootstarter.models.Product;

public interface ProductRepository extends CrudRepository<Product, Integer>{
	public List<Product> findAllByCategoryId(int categoryId);
    public List<Product> findAllByCategoryIdAndStatus(int categoryId, String status);
    public List<Product> findAllByStatus(String status);
}
