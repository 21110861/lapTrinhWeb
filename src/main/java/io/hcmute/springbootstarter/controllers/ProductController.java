package io.hcmute.springbootstarter.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.hcmute.springbootstarter.models.Category;
import io.hcmute.springbootstarter.models.Product;
import io.hcmute.springbootstarter.services.ProductService;

@RestController
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping("/categories/{id}/products")
	public String getAllProductByCategory(@PathVariable int id, Model model) {
		List<Product> listPro = productService.getAllProductsByCategory(id);
		model.addAttribute("listProducts", listPro);
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

	@GetMapping("/admin/products")
	public String showProductList(Model model) {
		List<Product> listProducts = productService.getAllProducts();
		model.addAttribute("listProducts", listProducts);

		return "products";
	}

	@GetMapping("/admin/products/new")
	public String showNewForm(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("pageTitle", "Add New Product");
		return "product_form";
	}

	@PostMapping("/admin/products/save")
	public String saveProduct(Product product, RedirectAttributes ra) {
		product.setUpdatedat(new Date());
		productService.saveProduct(product);
		ra.addFlashAttribute("message", "The Product has been saved successfully.");
		return "redirect:/admin/products";
	}

	@GetMapping("/admin/products/edit/{id}")
	public String showEditForm(@PathVariable("id") int id, Model model, RedirectAttributes ra) {
		try {
			Product product = productService.getProduct(id);
			model.addAttribute("product", product);
			model.addAttribute("pageTitle", "Edit Product (ID: " + id + ")");

			return "product_form";
		} catch (Exception e) {
			ra.addFlashAttribute("message", e.getMessage());
			return "redirect:/admin/products";
		}
	}

	@GetMapping("/admin/products/detail/{id}")
	public String showDetailForm(@PathVariable("id") int id, Model model, RedirectAttributes ra) {
		try {
			Product product = productService.getProduct(id);
			model.addAttribute("product", product);
			model.addAttribute("pageTitle", "Detail Product (ID: " + id + ")");

			return "product_detail";
		} catch (Exception e) {
			ra.addFlashAttribute("message", e.getMessage());
			return "redirect:/admin/products";
		}
	}

	@GetMapping("/admin/products/delete/{id}")
	public String deleteProduct(@PathVariable("id") int id, RedirectAttributes ra) {
		try {
			productService.deleteProduct(id);
			ra.addFlashAttribute("message", "The Product ID " + id + " has been deleted.");
		} catch (Exception e) {
			ra.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/admin/products";
	}

	@GetMapping("/admin/products/search")
	public String searchByIdForm(Model model) {
		model.addAttribute("searchProduct", new Product()); // Sử dụng Product làm đối tượng tìm kiếm

		return "searchForm";
	}

	@PostMapping("/admin/products/search")
	public String searchById(@ModelAttribute("searchProduct") Product searchProduct, RedirectAttributes ra) {
		try {
			int id = searchProduct.getId();
			Product product = productService.getProduct(id);
			ra.addFlashAttribute("product", product);
			ra.addFlashAttribute("pageTitle", "Detail Product (ID: " + id + ")");

			return "product_detail";
		} catch (Exception e) {
			ra.addFlashAttribute("message", e.getMessage());
			return "redirect:/admin/products";
		}
	}
}
