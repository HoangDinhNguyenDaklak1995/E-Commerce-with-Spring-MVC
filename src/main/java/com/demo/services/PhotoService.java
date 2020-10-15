package com.demo.services;

import com.demo.models.Photo;

public interface PhotoService {
	
	public Photo save (Photo photo);
	
	public void delete (int id);
	
	public Photo find (int id);
}
