package com.demo.controllers.admin;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("admin-panel")
public class LoginController {

	@RequestMapping(value = {"","index"},method =  RequestMethod.GET)
	public String admin() {
		return "redirect:/admin-panel/login";
	}
	
	@RequestMapping(value = "login",method =  RequestMethod.GET)
	public String process(@RequestParam(value = "error",required = false) String error,
			@RequestParam(value = "logout",required = false) String logout,ModelMap modelMap) {
		
		modelMap.put("msg", "Login Successfully");
		if(error != null) {
			modelMap.put("msg", "Invalid username or password");
		}
		if(logout != null) {
			modelMap.put("msg", "Logout Successfully");
		}
		return "admin.login.index";
	}
	
	@RequestMapping(value = "logout",method =  RequestMethod.GET)
	public String logout(ModelMap modelMap) {
		modelMap.put("msg", "Logout successfully");
		return "redirect:/admin-panel/login?logout";
	}
	
	@RequestMapping(value = "accessDenied",method =  RequestMethod.GET)
	public String accessDenined(Authentication authentication,ModelMap modelMap) {
		if(authentication != null) {
			modelMap.put("msg", "Hi " + authentication.getName() + " you do not have permission");
		}else {
			modelMap.put("msg", "You do not have permission to access this page!");
		}
		return "admin.login.accessDenied";
	}
	
	@RequestMapping(value = "welcome",method =  RequestMethod.GET)
	public String welcome() {
		return "redirect:/admin/dardboard";
	}
}
