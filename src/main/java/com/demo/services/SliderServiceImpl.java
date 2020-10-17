package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.slide;
import com.demo.repositories.SliderRepository;

@Service("SliderService")
public class SliderServiceImpl implements SliderService{
	
	@Autowired
	private SliderRepository slideRepository;
	
	@Override
	public Iterable<slide> findAllSlider() {
		return slideRepository.findAll();
	}

}
