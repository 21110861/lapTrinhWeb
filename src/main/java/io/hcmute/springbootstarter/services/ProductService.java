package io.hcmute.springbootstarter.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.hcmute.springbootstarter.models.Product;
import io.hcmute.springbootstarter.repositories.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public List<Product> getAllProducts() {
		List<Product> product = new ArrayList<>();
		productRepository.findAll().forEach(product::add);
		return product;
	}
	
	public List<Product> getAllProductsByCategory(int id) {
		List<Product> product1 = new ArrayList<>();
		productRepository.findAllByCategoryId(id).forEach(product1::add);
		return product1;
	}
	public List<Product> getAllActiveProducts() {
		List<Product> product = new ArrayList<>();
		productRepository.findAllByStatus("còn bán").forEach(product::add);
		return product;
	}
	public List<Product> getAllActiveProductsByCategory(int id,String status) {
		List<Product> product1 = new ArrayList<>();
		productRepository.findAllByCategoryIdAndStatus(id,status).forEach(product1::add);
		return product1;
	}
	public Product getProduct(int id) {
		return productRepository.findById(id).orElse(null);

	}

	public void addProduct(Product product) {
		productRepository.save(product);

	}

	public void updateProduct(Product product) {
		productRepository.save(product);
	}

	public void deleteProduct(int id) {
		productRepository.deleteById(id);
	}
	 public void saveProduct(Product product) {
	        productRepository.save(product);
	    }

	public List<Product> getAllProductsFromListId(List<Integer> historyList) {
		List<Product> list = new ArrayList<>();
		for(Integer item : historyList) {
			Product temp = productRepository.findById(item).orElse(null);
			if(temp != null) {
				list.add(temp);
			}
		}
		return list;
	}
}
