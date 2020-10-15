package com.demo.controllers.users;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.models.Item;
import com.demo.services.ProductService;

@Controller
@RequestMapping(value = {"","home"})
public class HomeControllers {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(method =  RequestMethod.GET)
	public String user(ModelMap modelMap,HttpSession session) {
		modelMap.put("isHome", true);
		modelMap.put("products", productService.latesListProduct(true, 6));
		modelMap.put("featured", productService.featuredProducts(true, 6, true));
		double total = 0;
		if(session.getAttribute("cart") != null) {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			for (Item item : cart) {
				total +=  item.getProduct().getPrice() * item.getQuantity();
			}
		}
		modelMap.put("total", total);
		return "home.index";
	}
}
