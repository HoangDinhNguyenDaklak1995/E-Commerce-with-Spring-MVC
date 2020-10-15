package com.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/dardboard")
public class dashboardController {
	
	@RequestMapping(method =  RequestMethod.GET)
	public String admin() {
		return "admin.index";
	}
}
