package io.hcmute.springbootstarter.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import io.hcmute.springbootstarter.models.CheckoutRequest;
import io.hcmute.springbootstarter.services.OrdersService;

@Controller
public class CartController {
	@Autowired
	OrdersService ordersService;
	@GetMapping("/giohang")
	public String showCart(HttpSession session,Model model) {
		Object a = session.getAttribute("cartItems");
		model.addAttribute("shoplist", a);
		return "shoping-cart";
	}
	
	@PostMapping("/giohang")
	public ResponseEntity<?> checkout(@RequestBody CheckoutRequest data) {
		String orderId = ordersService.addOrder(data);
		String total = Integer.toString(data.getTotal());
        return ResponseEntity.status(HttpStatus.OK).body("/api/payment/create_payment/"+orderId+"/"+ total);
    }
}
