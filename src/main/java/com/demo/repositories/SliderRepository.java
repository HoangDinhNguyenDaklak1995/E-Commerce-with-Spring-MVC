package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.models.slide;

@Repository("SliderRepository")
public interface SliderRepository extends CrudRepository<slide, Integer> {

	@Query("from slide where status = :status")
	public List<slide> findAllwithStatus(@Param("status") boolean status);
}
