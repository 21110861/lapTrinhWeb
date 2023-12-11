package io.hcmute.springbootstarter.controllers;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import io.hcmute.springbootstarter.models.Product;
import io.hcmute.springbootstarter.models.SortRequest;
import io.hcmute.springbootstarter.services.ProductService;

@Controller
public class ShopController {

	@Autowired
	private ProductService productService;
	SortRequest last = new SortRequest();

	@GetMapping("/shop")
	public String getAllProduct(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
		Page<Product> productPage = productService.getProducts(page, pageSize);
		model.addAttribute("listProducts", productPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPages", productPage.getTotalPages());
		model.addAttribute("maxium", productService.getAllActiveProducts().size());
		return "shop";
	}

	@PostMapping("/shop/filter")
	@ResponseBody
	public List<Product> filterProduct(@RequestParam(value = "keyword") int cateid,
			@RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {
		List<Product> filteredProducts = productService.filterActiveProductByCategoryId(cateid, page, pageSize)
				.getContent();
		return filteredProducts;
	}

	@PostMapping("/shop/sort")
	@ResponseBody
	public List<Product> sortProduct(@RequestBody SortRequest sortData) {
		for(int i = 0; i < sortData.listProduct.size(); ++i)
			System.out.println("giá trước="+ sortData.listProduct.get(i));
		if (!last.lastTypeSort.equals(sortData.lastTypeSort)) {
			last.lastTypeSort = sortData.lastTypeSort;
			last = sorting(sortData);
		}
		int start = sortData.page * 10;
		int end = Math.min((start + 10), sortData.listProduct.size());
		
		return last.listProduct.subList(start, end);

	}

	private SortRequest sorting(SortRequest last) {
		switch (last.lastTypeSort) {
		case "1":
			// Sắp xếp A-Z theo tiêu đề
			Collections.sort(last.listProduct, Comparator.comparing(Product::getTitle, String.CASE_INSENSITIVE_ORDER));
			break;
		case "2":
			// Sắp xếp Z-A theo tiêu đề
			Collections.sort(last.listProduct, Comparator.comparing(Product::getTitle, String.CASE_INSENSITIVE_ORDER).reversed());
			break;
		case "3":
			// Sắp xếp theo giá tăng dần
			Collections.sort(last.listProduct, Comparator.comparingDouble(Product::getPrice));
			break;
		default:
			// Mặc định: sắp xếp theo id tăng dần
			Collections.sort(last.listProduct, Comparator.comparingLong(Product::getId));
			break;
		}
		return last;

	}

	@PostMapping("/shop/search")
	@ResponseBody
	public List<Product> searchByName(@RequestParam(value = "keyword") String keyword,
			@RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "pageSize", defaultValue = "10") int pageSize) {

		List<Product> searchResults = productService.searchActiveProductByTitle(keyword, page, pageSize).getContent();

		return searchResults;
	}

	@PostMapping("/shop/load-more")
	@ResponseBody
	public List<Product> loadMoreProducts(@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {

		List<Product> temp = productService.getProducts(page, pageSize).getContent();
		return temp;
	}

}
