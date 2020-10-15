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

public class CategoryBottomTags extends RequestContextAwareTag{

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
			jspWriter.write("<div class=\"toggle toggle-white\">");
			List<Category> categories = categoryServices.findCategorybyStatus(true);
			if(categories != null) {
				for (Category category : categories) {
					jspWriter.write(" <h4 class=\"trigger\" style=\"margin: 10px 0; margin-bottom: 12px;\"><a href=\"#\">"+category.getName()+"</a></h4>");
					if(!category.getCategories().isEmpty()) {
						jspWriter.write("<div style=\"display: none;\" class=\"toggle_container tabcontent\">");
						jspWriter.write("<div class=\"std\">");
						for (Category subcategories : category.getCategories()) {
							jspWriter.write(" <p><a href='"+pageContext.getServletContext().getContextPath()+"/product/category/"+ subcategories.getId()+"'>"+ subcategories.getName() +" </a></p>");
						}
						jspWriter.write("</div>");
						jspWriter.write("</div>");
					}
					jspWriter.write("</h4>");
				}
			}
			jspWriter.write("</div>");
		} catch (Exception e) {
			try {
				jspWriter.write(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
}
