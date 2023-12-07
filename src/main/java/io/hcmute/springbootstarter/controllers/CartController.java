package io.hcmute.springbootstarter.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import io.hcmute.springbootstarter.models.CartItem;
import io.hcmute.springbootstarter.models.CheckoutRequest;
import io.hcmute.springbootstarter.models.Product;

@Controller
public class CartController {
	
	@GetMapping("/giohang")
	public String showCart(HttpSession session,Model model) {
		Object a = session.getAttribute("cartItems");
		model.addAttribute("shoplist", a);
		return "shoping-cart";
	}
	@PostMapping("/giohang")
	public String checkout(@RequestBody CheckoutRequest data) {
		for (CartItem cartItem : data.getCartItems()) {
            Product product = cartItem.getProduct();
            int quantity = cartItem.getQuantity();
            // Thực hiện xử lý dữ liệu theo yêu cầu của bạn
            System.out.println("Product ID: " + product.getId() + ", Quantity: " + quantity);
        }
		System.out.println("ghi chú =" + data.getNote());

        return "redirect:/index";
    }
}
