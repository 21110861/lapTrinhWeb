package io.hcmute.springbootstarter.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
		Date today = new Date();
		newCate.setUpdatedat(today);
		newCate.setCreatedat(today);
        model.addAttribute("category", newCate);
        model.addAttribute("pageTitle", "Add New Category");
        return "category_form";
    }
	
	@GetMapping("/admin/categories/detail/{id}")
	public String getCategory(@PathVariable("id") int id,Model model,RedirectAttributes ra) {
		try {
			Category category = categoryService.getCategory(id);
			model.addAttribute("category", category);
            model.addAttribute("pageTitle", "Detail Category (ID: " + id + ")");
            return "category_detail";
		}
		catch(Exception e){
			ra.addFlashAttribute("message", e.getMessage());
            return "redirect:/admin/categories";
		}
	}
	
	@GetMapping("/admin/categories/delete/{id}")
    public String deleteCategory(@PathVariable("id") int id, RedirectAttributes ra) {
        try {
            categoryService.deleteCategory(id);
            ra.addFlashAttribute("message", "The Category ID " + id + " has been delete.");
        } catch (Exception e) {
            ra.addFlashAttribute("message", e.getMessage());
        }
        return "redirect:/admin/categories";
    }
}
