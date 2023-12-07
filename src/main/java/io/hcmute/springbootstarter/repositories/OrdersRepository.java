package io.hcmute.springbootstarter.repositories;

import org.springframework.data.repository.CrudRepository;

import io.hcmute.springbootstarter.models.Orders;

public interface OrdersRepository extends CrudRepository<Orders, Integer>{
	
}
