package io.hcmute.springbootstarter.services;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.hcmute.springbootstarter.models.CartItem;
import io.hcmute.springbootstarter.models.CheckoutRequest;
import io.hcmute.springbootstarter.models.Orders;
import io.hcmute.springbootstarter.repositories.OrdersRepository;

@Service
public class OrdersService {
	@Autowired
	OrdersRepository ordersRepository;

	public void addOrder(Orders order) {
		ordersRepository.save(order);
	}

	public String addOrder(CheckoutRequest data) {
		Orders order = new Orders(data.getName(), data.getPhone(), data.getAddress(), data.getNote(), new Date(),
				"Đang xử lý");
		ordersRepository.save(order);
		
		for (CartItem item : data.getCartItems()) {
			
			ordersRepository.insertDetail(order.getId(),
					item.getProduct().getId(),
					item.getQuantity()
					);
		}
		return Integer.toString(order.getId());
	}

	public void updateOrder(Orders order) {
		ordersRepository.save(order);
	}

	public void findAndUpdate(String orderId) {
		System.out.println("string id="+orderId);
		int id = Integer.valueOf(orderId);
		System.out.println("id="+id);
		Optional<Orders> order = ordersRepository.findById(id);
		Orders neworder = order.orElse(null);
		neworder.setState("Đã thanh toán");
		ordersRepository.save(neworder);
	}
}
