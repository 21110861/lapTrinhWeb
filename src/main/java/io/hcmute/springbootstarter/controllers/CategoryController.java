package io.hcmute.springbootstarter.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import io.hcmute.springbootstarter.models.Category;
import io.hcmute.springbootstarter.services.CategoryService;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/categories")
	public String getAllCategory(Model model) {
		List<Category> listcate = categoryService.getAllCategory();
		model.addAttribute("listcategories", listcate);
		return "category";
	}

	@GetMapping("/categories/{id}")
	public String getCategory(@PathVariable int id,Model model) {
		Category cate = categoryService.getCategory(id);
		List<Category> listcate = new ArrayList<Category>();
		listcate.add(cate);
		model.addAttribute("listcategories",listcate);
		return "category";
	}

	@PostMapping("/categories")
	public void addCategory(@RequestBody Category cate) {
		Date today = new Date();
		cate.setCreatedat(today);
		cate.setUpdatedat(today);
		categoryService.addCategory(cate);
	}

	@PutMapping("/categories/{id}")
	public void updateCategory(@RequestBody Category cate, @PathVariable int id) {
		categoryService.updateCategory(id, cate);
	}

	@DeleteMapping("/categories/{id}")
	public void deleteCategory(@PathVariable int id) {
		categoryService.deleteCategory(id);
	}
}
