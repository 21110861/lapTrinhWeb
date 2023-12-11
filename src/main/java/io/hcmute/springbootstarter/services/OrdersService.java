package io.hcmute.springbootstarter.services;

import java.time.LocalDate;
import java.sql.Date;
import java.util.List;
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
		Orders order = new Orders(data.getName(), data.getPhone(), data.getAddress(), data.getNote(), Date.valueOf(LocalDate.now()),
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
		int id = Integer.valueOf(orderId);
		Optional<Orders> order = ordersRepository.findById(id);
		Orders neworder = order.orElse(null);
		neworder.setState("Đã thanh toán");
		ordersRepository.save(neworder);
	}
	public List<Orders> listAll() {
        return (List<Orders>) ordersRepository.findAll();
    }

    public void save(Orders order) {
        ordersRepository.save(order);
    }

    public Orders get(Integer id) throws Exception {
        Optional<Orders> result = ordersRepository.findById(id);
        if (result.isPresent()) {
            return result.get();
        }
        throw new Exception("Could not find any Orders with ID " + id);
    }

    public void delete(Integer id) throws Exception {
        Long count = ordersRepository.countById(id);
        if (count == null || count == 0) {
            throw new Exception("Could not find any Orders with ID " + id);
        }
        ordersRepository.deleteById(id);
    }
}
