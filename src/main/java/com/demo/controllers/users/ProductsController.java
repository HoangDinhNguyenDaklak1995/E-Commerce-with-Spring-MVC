package com.demo.controllers.users;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.models.Category;
import com.demo.models.Item;
import com.demo.models.Product;
import com.demo.services.CategoryService;
import com.demo.services.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductsController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "detail/{id}",method =  RequestMethod.GET)
	public String details(@PathVariable ("id") int id,ModelMap modelMap,HttpSession session) {
		Product product = productService.find(id);
		modelMap.put("product", product );
		modelMap.put("photos", product.getPhotos().stream().filter(p -> p.isStatus()).collect(Collectors.toList()));
		modelMap.put("relatestProduct", productService.categoryProducts(true, product.getCategory().getId(), product.getId(), 6));
		modelMap.put("featured", productService.featuredProducts(true, 6, true));
		double total = 0;
		if(session.getAttribute("cart") != null) {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			for (Item item : cart) {
				total +=  item.getProduct().getPrice() * item.getQuantity();
			}
		}
		modelMap.put("total", total);
		return "product.details";
	}
	
	@RequestMapping(value = "category/{id}",method =  RequestMethod.GET)
	public String category(@PathVariable ("id") int id,HttpServletRequest request,ModelMap modelMap) {
		Category category = categoryService.find(id);
		PagedListHolder pagedListHolder = new PagedListHolder(category.getProducts());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(6);
		modelMap.put("pagedListHolder", pagedListHolder );
		modelMap.put("category", category );
		return "product.category";
	}
	
	@RequestMapping(value = "list/{id}",method =  RequestMethod.GET)
	public String categoryList(@PathVariable ("id") int id,HttpServletRequest request,ModelMap modelMap,HttpSession session) {
		Category category = categoryService.find(id);
		PagedListHolder pagedListHolder = new PagedListHolder(category.getProducts());
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(6);
		modelMap.put("pagedListHolder", pagedListHolder );
		modelMap.put("category", category );
		double total = 0;
		if(session.getAttribute("cart") != null) {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			for (Item item : cart) {
				total +=  item.getProduct().getPrice() * item.getQuantity();
			}
		}
		modelMap.put("total", total);
		return "product.category_list";
	}
	
	@RequestMapping(value = "search",method =  RequestMethod.POST)
	public String search(@RequestParam("keyword") String keyword,@RequestParam("category") int category
			,HttpServletRequest request, ModelMap modelMap,HttpSession session) {
		PagedListHolder pagedListHolder = null;
		if(category == -1) {
			pagedListHolder = new PagedListHolder(productService.searchAll(true, keyword));
		}else {
			pagedListHolder = new PagedListHolder(productService.searchbyCategories(true, keyword, category));
		}
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(9);
		modelMap.put("pagedListHolder", pagedListHolder );
		modelMap.put("keyword", keyword );
		double total = 0;
		if(session.getAttribute("cart") != null) {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			for (Item item : cart) {
				total +=  item.getProduct().getPrice() * item.getQuantity();
			}
		}
		modelMap.put("total", total);
		return "product.search";
	}
}
