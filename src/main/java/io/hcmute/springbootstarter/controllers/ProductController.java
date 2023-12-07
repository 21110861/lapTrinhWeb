package io.hcmute.springbootstarter.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import io.hcmute.springbootstarter.models.Category;
import io.hcmute.springbootstarter.models.Product;
import io.hcmute.springbootstarter.services.ProductService;

@RestController
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping("/categories/{id}/products")
//	public List<Product> getAllProduct(@PathVariable int id) {
//		return productService.getAllProducts(id);
//	}
	public String getAllProductByCategory(@PathVariable int id,Model model) {
		List<Product> listPro = productService.getAllProductsByCategory(id);
		model.addAttribute("listProducts",listPro);
		return "index";
	}
	@GetMapping("/categories/{categoryId}/products/{id}")
	public Product getProduct(@PathVariable int id) {
		return productService.getProduct(id);
	}

	@PostMapping("/categories/{categoryId}/products")
	public void addProduct(@RequestBody Product product, @PathVariable int categoryId) {
		product.setCategory(new Category(categoryId));
		Date today = new Date();
		product.setCreatedat(today);
		product.setUpdatedat(today);
		productService.addProduct(product);
	}

	@PutMapping("/categories/{categoryId}/products/{id}")
	public void updateProduct(@RequestBody Product product, @PathVariable int categoryId, @PathVariable int id) {
		product.setId(id);
		product.setCategory(new Category(categoryId));
		productService.updateProduct(product);
	}

	@DeleteMapping("/categories/{categoryId}/products/{id}")
	public void deleteProduct(@PathVariable int id) {
		productService.deleteProduct(id);
	}
}
