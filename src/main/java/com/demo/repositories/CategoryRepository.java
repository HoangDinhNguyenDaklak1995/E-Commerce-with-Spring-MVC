package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.Category;

@Repository("categoryRepository")
public interface CategoryRepository extends CrudRepository<Category, Integer> {

	@Query("from Category c where c.category = 0 or c.category = null ")
	public List<Category> findParentCategories();
	
	@Query("from Category where category= null and status = :status")
	public List<Category> findCategorybyStatus(@Param("status") boolean status);
}
