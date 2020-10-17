package com.demo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.demo.models.slide;

@Repository("SliderRepository")
public interface SliderRepository extends CrudRepository<slide, Integer> {

}
