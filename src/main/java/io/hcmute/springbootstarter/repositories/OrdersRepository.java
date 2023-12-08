package io.hcmute.springbootstarter.repositories;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import io.hcmute.springbootstarter.models.Orders;

public interface OrdersRepository extends CrudRepository<Orders, Integer> {
	@Modifying
	@Transactional
	@Query(value = "INSERT INTO Order_details(id, idprod, num) VALUES (:value1, :value2, :value3)", nativeQuery = true)
	void insertDetail(@Param("value1") int value1, @Param("value2") int value2, @Param("value3") int value3);

}
