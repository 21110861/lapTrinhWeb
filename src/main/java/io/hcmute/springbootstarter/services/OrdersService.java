package io.hcmute.springbootstarter.services;

import java.util.Date;

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

	public void addOrder(CheckoutRequest data) {
		Orders order = new Orders(data.getName(), data.getPhone(), data.getAddress(), data.getNote(), new Date(),
				"Đang xử lý");
		ordersRepository.save(order);
		
		for (CartItem item : data.getCartItems()) {
			
			ordersRepository.insertDetail(order.getId(),
					item.getProduct().getId(),
					item.getQuantity()
					);
		}
	}

	public void updateOrder(Orders order) {
		ordersRepository.save(order);
	}
}
