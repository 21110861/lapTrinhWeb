package io.hcmute.springbootstarter.controllers;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.hcmute.springbootstarter.models.Category;
import io.hcmute.springbootstarter.services.CategoryService;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;

	@GetMapping("admin/categories")

	public String getAllCategory(Model model) {
		List<Category> listcate = categoryService.getAllCategory();
		model.addAttribute("listcategories", listcate);
		return "categories";
	}

	@GetMapping("/admin/categories/new")
	public String showNewForm(Model model) {
		Category newCate = new Category();
		Date today = Date.valueOf(LocalDate.now());
		newCate.setUpdatedat(today);
		newCate.setCreatedat(today);
		model.addAttribute("category", newCate);
		model.addAttribute("pageTitle", "Add New Category");
		return "category_form";
	}

	@GetMapping("/admin/categories/detail/{id}")
	public String getCategory(@PathVariable("id") int id, Model model, RedirectAttributes ra) {
		try {
			Category category = categoryService.getCategory(id);
			model.addAttribute("category", category);
			model.addAttribute("pageTitle", "Detail Category (ID: " + id + ")");
			return "category_detail";
		} catch (Exception e) {
			ra.addFlashAttribute("message", e.getMessage());
			return "redirect:/admin/categories";
		}
	}

	@DeleteMapping("/admin/categories/delete/{id}")
	public ResponseEntity<String> deleteCategory(@PathVariable("id") int id) {
		try {
			// Gọi service để xóa sản phẩm dựa trên ID
			categoryService.deleteCategory(id);
			return ResponseEntity.ok("category deleted successfully");
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return ResponseEntity.status(500).body("Failed to delete category");
		}
	}

	@PostMapping("/admin/categories/add")
	public ResponseEntity<?> addNewCaterory(@RequestBody Category newCate) {
		// Kiểm tra nếu request là request lấy favicon.ico thì không xử lý
		if ("favicon.ico".equals(newCate.getName())) {
			return ResponseEntity.status(HttpStatus.OK).build();
		}

		// Thực hiện logic thêm sản phẩm mới
		Date today = Date.valueOf(LocalDate.now());
		newCate.setCreatedat(today);
		newCate.setUpdatedat(today);
		Category addedCate = categoryService.addCategory(newCate);

		return ResponseEntity.status(HttpStatus.CREATED).body(addedCate);
	}

	@PostMapping("admin/categories")
	public ResponseEntity<?> getAllCategoryName() {
		List<Category> listcate = categoryService.getAllCategory();
		return ResponseEntity.status(HttpStatus.OK).body(listcate);
	}
	@PutMapping("/admin/categories")
	public ResponseEntity<?> updateCategory(@RequestBody Category category) {
		categoryService.update(category);
		return ResponseEntity.status(HttpStatus.OK).body("thành công");
	}
}
