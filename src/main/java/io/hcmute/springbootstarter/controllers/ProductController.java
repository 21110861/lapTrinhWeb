package io.hcmute.springbootstarter.controllers;

import java.time.LocalDate;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import io.hcmute.springbootstarter.models.Product;
import io.hcmute.springbootstarter.services.CategoryService;
import io.hcmute.springbootstarter.services.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/admin/products")
	public String showProductList(Model model) {
		List<Product> listProducts = productService.getAllProducts();
		model.addAttribute("listProducts", listProducts);
		model.addAttribute("listCategories", categoryService.getAllCategory());
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
		product.setUpdatedat(Date.valueOf(LocalDate.now()));
		productService.saveProduct(product);
		ra.addFlashAttribute("message", "The Product has been saved successfully.");
		return "redirect:/admin/products";
	}

	@PostMapping("/admin/products/add")
	public ResponseEntity<?> addNewProduct(@RequestBody Product newProduct) {
		// Kiểm tra nếu request là request lấy favicon.ico thì không xử lý
		if ("favicon.ico".equals(newProduct.getTitle())) {
			return ResponseEntity.status(HttpStatus.OK).build();
		}

		// Thực hiện logic thêm sản phẩm mới
		Date today = Date.valueOf(LocalDate.now());
		newProduct.setCreatedat(today);
		newProduct.setUpdatedat(today);
		Product addedProduct = productService.addProduct(newProduct);

		return ResponseEntity.status(HttpStatus.CREATED).body(addedProduct);
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

	@DeleteMapping("/admin/products/delete/{productId}")
	public ResponseEntity<String> deleteProduct(@PathVariable int productId) {
		try {
			// Gọi service để xóa sản phẩm dựa trên ID
			productService.deleteProduct(productId);
			return ResponseEntity.ok("Product deleted successfully");
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return ResponseEntity.status(500).body("Failed to delete product");
		}
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

	@PutMapping("/admin/products")
	public ResponseEntity<?> updateProduct(@RequestBody Product product) {
		Date today = Date.valueOf(LocalDate.now());
		Product old = productService.getProduct(product.getId());
		product.setUpdatedat(today);
		product.setCreatedat(old.getCreatedat());
		productService.updateProduct(product);
		return ResponseEntity.status(HttpStatus.OK).body("thành công");
	}

}
