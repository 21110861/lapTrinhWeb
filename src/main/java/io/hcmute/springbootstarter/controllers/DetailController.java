package io.hcmute.springbootstarter.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import io.hcmute.springbootstarter.models.History;
import io.hcmute.springbootstarter.models.Product;
import io.hcmute.springbootstarter.services.ProductService;

@Controller
public class DetailController {
    @Autowired
    ProductService productService;
    Product productWantToView = null;
    List<Product> historyProducts = new ArrayList<>();
    List<Product> sameCategoryProducts = new ArrayList<>();
    @GetMapping("/detail")
    public String viewProductDetail(Model model) {
    	 model.addAttribute("listproducts", sameCategoryProducts);
         model.addAttribute("chosenProduct", productWantToView);
         model.addAttribute("listHistoryProducts", historyProducts);
        return "shop-details";
    }

    @PostMapping("/detail")
    public ResponseEntity<?> findDetailsAboutProducts(@RequestBody  History history) {
        this.productWantToView = productService.getProduct(history.latestId);
        this.sameCategoryProducts = productService.getAllActiveProductsByCategory(productWantToView.getCategory().getId(), "còn bán");
        this.historyProducts = productService.getAllProductsFromListId(history.historyList);
        return ResponseEntity.status(HttpStatus.OK).body("ổn");
    }
}

