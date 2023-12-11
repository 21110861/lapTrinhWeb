package io.hcmute.springbootstarter.services;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.hcmute.springbootstarter.models.Category;
import io.hcmute.springbootstarter.repositories.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;
	public List<Category> getAllCategory(){
		List<Category> categories = new ArrayList<>();
		categoryRepository.findAll()
		.forEach(categories::add);
		return categories;
	}
	public void updateCategory(int id, Category cate) {
		categoryRepository.save(cate);
		
	}
	public Category addCategory(Category cate) {
		Category newcate = categoryRepository.save(cate);
		return newcate;
		
	}
	public Category getCategory(int id) {
		return categoryRepository.findById(id).orElse(null);
	}
	public void deleteCategory(int id) {
		categoryRepository.deleteById(id);
		
	}
	public void update(Category category) {
		Optional<Category> old =categoryRepository.findById(category.getId());
		if(old.isPresent()) {
			category.setCreatedat(old.get().getCreatedat());
			Date today = Date.valueOf(LocalDate.now());
			category.setUpdatedat(today);
			categoryRepository.save(category);
		}
		
	}
}
