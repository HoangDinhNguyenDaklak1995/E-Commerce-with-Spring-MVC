package com.demo.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.slide;
import com.demo.repositories.SliderRepository;

@Transactional
@Service("SliderService")
public class SliderServiceImpl implements SliderService{
	
	@Autowired
	private SliderRepository slideRepository;
	
	@Override
	public Iterable<slide> findAllSlider() {
		return slideRepository.findAll();
	}

	@Override
	public slide save(slide slide) {
		return slideRepository.save(slide);
	}

	@Override
	public void delete(int id) {
		 slideRepository.deleteById(id);
	}

	@Override
	public slide find(int id) {
		return slideRepository.findById(id).get();
	}

	@Override
	public List<slide> findAllwithStatus(boolean status) {
		return slideRepository.findAllwithStatus(status);
	}
}
