package com.demo.services;

import java.util.List;

import com.demo.models.slide;

public interface SliderService {

	public Iterable<slide> findAllSlider();
	
	public slide save(slide slide);
	
	public void delete (int id);
	
	public slide find(int id);
	
	public List<slide> findAllwithStatus(boolean status);
}
