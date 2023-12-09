package io.hcmute.springbootstarter.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import io.hcmute.springbootstarter.models.Product;
import io.hcmute.springbootstarter.services.ProductService;
@Controller
public class DetailController {
	@Autowired
	ProductService productService;
	
	@GetMapping("/detail/{cateid}/{proid}")
	public String findDetailsAboutProducts(@PathVariable int cateid,@PathVariable int proid, Model model) {
		List<Product> products = productService.getAllActiveProductsByCategory(cateid, "còn bán");
		model.addAttribute("products", products);
		
		return "shop-details";
		
	}
}
