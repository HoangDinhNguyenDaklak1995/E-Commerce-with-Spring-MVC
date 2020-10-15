package com.demo.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.models.Category;
import com.demo.services.CategoryService;

public class CategoryTags extends RequestContextAwareTag{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5919380581149628277L;
	@Autowired
	private CategoryService categoryServices;
	
	@Override
	protected int doStartTagInternal() throws Exception {
		if(categoryServices == null) {
			WebApplicationContext applicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}
	
	@Override
	public void doFinally() {
		JspWriter jspWriter = pageContext.getOut();
		try {
			jspWriter.write("<ul id=\"nav\" class=\"hidden-xs\">");
			List<Category> categories = categoryServices.findCategorybyStatus(true);
			if(categories != null) {
				for (Category category : categories) {
					jspWriter.write("<li class=\"level0 nav-5 level-top\"> <a href=\"#\" class=\"level-top\"> <span>"+category.getName()+"</span> </a>");
					if(!category.getCategories().isEmpty()) {
						jspWriter.write("<div style=\"display: none; left: 0px;\" class=\"level0-wrapper dropdown-6col\">");
						jspWriter.write(" <div class=\"level0-wrapper2\">");
						jspWriter.write("<div class=\"nav-block nav-block-center\">");
						jspWriter.write("<ul class=\"level0\">");
						jspWriter.write("<li class=\"level1 nav-6-1 first parent item\"> <a href=\"#\"> <span> "+category.getName()+" </span> </a>");
						jspWriter.write("<ul class=\"level1\">");
						for (Category subcategories : category.getCategories()) {
							jspWriter.write(" <li class=\"level2 nav-6-1-1 first\"> <a href='"+pageContext.getServletContext().getContextPath()+"/product/category/"+ subcategories.getId()+"'> <span> "+ subcategories.getName() +" </span> </a> </li>");
						}
						jspWriter.write("</ul>");
						jspWriter.write("</li>");
						jspWriter.write("</ul>");
						jspWriter.write("</div>");
						jspWriter.write("</div>");
						jspWriter.write("</div>");
					}
					jspWriter.write("</li>");
				}
			}
			jspWriter.write("</ul>");
		} catch (Exception e) {
			try {
				jspWriter.write(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
}
