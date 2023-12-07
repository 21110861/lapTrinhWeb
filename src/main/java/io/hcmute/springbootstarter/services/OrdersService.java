package io.hcmute.springbootstarter.services;

import io.hcmute.springbootstarter.models.Orders;
import io.hcmute.springbootstarter.repositories.OrdersRepository;

public class OrdersService {
	OrdersRepository ordersRepository;
	
	public void addOrder(Orders order) {
		ordersRepository.save(order);
	}
	public void updateOrder(Orders order) {
		ordersRepository.save(order);
	}
}
