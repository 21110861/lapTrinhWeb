package io.hcmute.springbootstarter.repositories;

import org.springframework.data.repository.CrudRepository;

import io.hcmute.springbootstarter.models.Category;

public interface CategoryRepository extends CrudRepository<Category, Integer>{

}
