package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.services.SliderService;

@Controller
@RequestMapping("/admin/slider")
public class SliderAdminController {

	@Autowired
	private SliderService sliderService;

	@RequestMapping(method = RequestMethod.GET)
	public String slider(ModelMap modelMap) {
		modelMap.put("slide", sliderService.findAllSlider());
		return "admin.slider.index";
	}
}
