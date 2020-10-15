package com.demo.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.models.Photo;
import com.demo.repositories.PhotoRepository;

@Transactional
@Service("PhotoService")
public class PhotoServiceImpl implements PhotoService {

	@Autowired
	private PhotoRepository photoRepository;
	
	@Override
	public Photo save(Photo photo) {
		return photoRepository.save(photo);
	}

	@Override
	public void delete(int id) {
		photoRepository.deleteById(id);
	}

	@Override
	public Photo find(int id) {
		return photoRepository.findById(id).get();
	}
}
