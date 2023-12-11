package io.hcmute.springbootstarter.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import io.hcmute.springbootstarter.models.Product;
import io.hcmute.springbootstarter.repositories.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	int typeSort = 0;

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

	public Long tableSize() {
		return productRepository.count();
	}

	public List<Product> getAllActiveProducts() {
		List<Product> product = new ArrayList<>();
		productRepository.findAllByStatus("còn bán").forEach(product::add);
		return product;
	}

	public List<Product> getAllActiveProductsByCategory(int id, String status) {
		List<Product> product1 = new ArrayList<>();
		productRepository.findAllByCategoryIdAndStatus(id, status).forEach(product1::add);
		return product1;
	}

	public Page<Product> getAllActiveProductSorted(List<Product> unsortedList, int type, int page, int pageSize) {
		PageRequest pageable = PageRequest.of(page, pageSize);
		if (typeSort != type) {
			typeSort = type;
			switch (type) {
			case 1:
				// Sắp xếp theo product.title từ A - Z
				Collections.sort(unsortedList, (p1, p2) -> p1.getTitle().compareToIgnoreCase(p2.getTitle()));
				break;
			case 2:
				// Sắp xếp theo product.title từ Z - A
				Collections.sort(unsortedList, (p1, p2) -> p2.getTitle().compareToIgnoreCase(p1.getTitle()));
				break;
			case 3:
				// Sắp xếp theo product.price từ bé đến lớn
				Collections.sort(unsortedList, (p1, p2) -> Integer.compare(p1.getPrice(), p2.getPrice()));
				break;
			default:
				// Mặc định: sắp xếp theo id (type == 0)
				Collections.sort(unsortedList, (p1, p2) -> Integer.compare(p1.getId(), p2.getId()));
				break;
			}
		}
		int start = (int) pageable.getOffset();
		int end = Math.min((start + pageable.getPageSize()), unsortedList.size());
		List<Product> sublist = unsortedList.subList(start, end);
		return new PageImpl<>(sublist, pageable, unsortedList.size());
	}

	public List<Product> searchByTitle(String keyWord) {
		return productRepository.findAllByTitleContainingIgnoreCase(keyWord);
	}

	public Page<Product> getProducts(int page, int pageSize) {
		PageRequest pageRequest = PageRequest.of(page, pageSize);
		return productRepository.findAllByStatus("còn bán", pageRequest);
	}

	public Page<Product> searchActiveProductByTitle(String keyWord, int page, int pageSize) {
		PageRequest pageRequest = PageRequest.of(page, pageSize);
		return productRepository.findAllByStatusAndTitleContainingIgnoreCase("còn bán", keyWord, pageRequest);
	}

	public Page<Product> filterActiveProductByCategoryId(int cateid, int page, int pageSize) {
		PageRequest pageRequest = PageRequest.of(page, pageSize);
		return productRepository.findAllByCategoryIdAndStatus(cateid, "còn bán", pageRequest);
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
		for (Integer item : historyList) {
			Product temp = productRepository.findById(item).orElse(null);
			if (temp != null) {
				list.add(temp);
			}
		}
		return list;
	}
}
