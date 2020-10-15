package com.demo.controllers.users;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Invoice;
import com.demo.models.InvoiceDetails;
import com.demo.models.InvoiceDetailsId;
import com.demo.models.Item;
import com.demo.services.AccountService;
import com.demo.services.InvoiceDetailService;
import com.demo.services.InvoiceService;
import com.demo.services.ProductService;

@Controller
@RequestMapping(value = "/cart")
public class CartController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private InvoiceService invoiceService;
	
	@Autowired
	private InvoiceDetailService invoiceDetailService;
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value = "index",method =  RequestMethod.GET)
	public String index (ModelMap modelMap, HttpSession session) {
		int countItems = 0;
		double total = 0;
		if(session.getAttribute("cart") != null) {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			countItems = cart.size();
			for (Item item : cart) {
				total +=  item.getProduct().getPrice() * item.getQuantity();
			}
		}
		modelMap.put("countItems", countItems);
		modelMap.put("total", total);
		return "cart.index";
	}
	
	@RequestMapping(value = "buy/{id}",method =  RequestMethod.GET)
	public String buy (@PathVariable ("id") int id, HttpSession session, ModelMap modelMap) {
		if(session.getAttribute("cart")== null) {
			List<Item> items = new ArrayList<Item>();
			items.add(new Item(productService.find(id),1));
			session.setAttribute("cart", items);
		}else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = exist(id, cart);
			if(index == -1) {
				cart.add(new Item(productService.find(id),1));
			}else {
				int newQuantity = cart.get(index).getQuantity() +1;
				cart.get(index).setQuantity(newQuantity);
			}
			session.setAttribute("cart", cart);
		}
		
		return "redirect:/cart/index";
	}
	
	@RequestMapping(value = "remove/{index}",method =  RequestMethod.GET)
	public String cartRemove (@PathVariable ("index") int index, HttpSession session, ModelMap modelMap) {
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/cart/index";
	}
	
	@RequestMapping(value = "update",method =  RequestMethod.POST)
	public String update (@RequestParam ("quantities") int[] quantities, HttpSession session, ModelMap modelMap) {
		if(session.getAttribute("cart") != null) {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			for (int i = 0; i < cart.size(); i++) {
				cart.get(i).setQuantity(quantities[i]);
			}
			session.setAttribute("cart", cart);
		}
		return "redirect:/cart/index";
	}
	
	@RequestMapping(value = "thanks",method =  RequestMethod.GET)
	public String thnks ( ModelMap modelMap) {
		return "cart.thanks";
	}
	
	@RequestMapping(value = "checkout",method =  RequestMethod.GET)
	public String checkout ( HttpSession session, Authentication authentication) {
		if(authentication == null) {
			return "redirect:/customer-panel";
		}else {
			if(session.getAttribute("cart") != null) {
				Invoice invoice = new Invoice();
				invoice.setAccount(accountService.findByUsername(authentication.getName()));
				invoice.setCreated(new Date());
				invoice.setName("New Invoice");
				invoice.setStatus("Pending");
				invoice = invoiceService.Save(invoice);
				List<Item> cart = (List<Item>) session.getAttribute("cart");
				for (Item item : cart) {
					InvoiceDetails details = new InvoiceDetails();
					details.setId(new InvoiceDetailsId(invoice.getId(),item.getProduct().getId()));
					details.setPrice(item.getProduct().getPrice());
					details.setQuantity(item.getQuantity());
					invoiceDetailService.Save(details);
				}
				session.removeAttribute("cart");
			}
			return "redirect:/cart/thanks";
		}
	}

	private int exist(int id, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if(cart.get(i).getProduct().getId() == id) {
				return i;
			}
		}
		return -1;
	}
}
