package io.hcmute.springbootstarter.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import io.hcmute.springbootstarter.models.Category;
import io.hcmute.springbootstarter.models.Product;
import io.hcmute.springbootstarter.services.CategoryService;
import io.hcmute.springbootstarter.services.ProductService;

@Controller
public class HomeController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	
	@GetMapping("/favicon.ico")
	public void returnNoFavicon() {
	    // This method does nothing and returns void to handle favicon.ico requests
	}
	@GetMapping(value = {"/","/{categoryId}"})
	public String showProduct(@PathVariable(required = false) Integer categoryId,Model model) {
		List<Category> listcate = null;
		List<Product> listpro = null;
		
		listcate = categoryService.getAllCategory();
		if (categoryId == null) {
			listpro = productService.getAllActiveProducts();
		}
		else {
			listpro = productService.getAllActiveProductsByCategory(categoryId,"còn bán");
		}
		model.addAttribute("listcategories", listcate);
		model.addAttribute("listproducts", listpro);
		return "index";
	}}
