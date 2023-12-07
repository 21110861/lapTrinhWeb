package io.hcmute.springbootstarter.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import io.hcmute.springbootstarter.models.CartItem;
import io.hcmute.springbootstarter.models.CheckoutRequest;

@Controller
public class CartController {
	
	@GetMapping("/giohang")
	public String showCart(HttpSession session,Model model) {
		Object a = session.getAttribute("cartItems");
		model.addAttribute("shoplist", a);
		return "shoping-cart";
	}
	@PostMapping("/giohang")
	public String checkout(@RequestBody CheckoutRequest checkoutRequest) {
        
		//checkoutRequest.addOrder();


        return "Checkout successful!";
    }
}
