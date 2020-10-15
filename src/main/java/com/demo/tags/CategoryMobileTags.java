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

public class CategoryMobileTags extends RequestContextAwareTag{

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
			jspWriter.write("<ul class=\"navmenu\">");
			List<Category> categories = categoryServices.findCategorybyStatus(true);
			if(categories != null) {
				jspWriter.write("<li>");
				jspWriter.write("<div  class=\"menutop\">");
				jspWriter.write("<div class=\"toggle\"> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span></div>");
				jspWriter.write("</div>");
				for (Category category : categories) {
					if(!category.getCategories().isEmpty()) {
						jspWriter.write("<ul style=\"display:none;\" class=\"submenu\">");
						jspWriter.write("<li>");
						jspWriter.write("<ul class=\"topnav\">");
						jspWriter.write(" <li class=\"level0 nav-1 level-top first parent\"> <a href=\"grid.html\" class=\"level-top\"> <span>"+category.getName()+ "</span> </a>");
						jspWriter.write("<ul class=\"level0\">");
						for (Category subcategories : category.getCategories()) {
						jspWriter.write("<li class=\"level1 nav-1-1 first parent\"> <a href=\"grid.html\"> <span> "+ subcategories.getName() +"</span> </a></li>");
						}
						jspWriter.write("</ul>");
						jspWriter.write("</li>");
						jspWriter.write("</ul>");
						jspWriter.write("</li>");
						jspWriter.write("</ul>");
					}
				}
				jspWriter.write("</li>");
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
