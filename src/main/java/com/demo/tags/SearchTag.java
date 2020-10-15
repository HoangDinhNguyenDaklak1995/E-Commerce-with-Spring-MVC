package com.demo.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.models.Category;
import com.demo.services.CategoryService;
import com.demo.services.ProductService;

public class SearchTag extends RequestContextAwareTag{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5919380581149628277L;

	@Autowired
	private CategoryService categoryServices;
	
	@Autowired
	private ProductService productService;
	
	@Override
	public void doFinally() {
		JspWriter jspWriter = pageContext.getOut();
		try {
			HttpServletRequest request = (HttpServletRequest) (pageContext.getRequest());
			String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword"): "";
			List<Category> categories = categoryServices.findCategorybyStatus(true);
			jspWriter.write("<div class=\"search-box\">\r\n");
			jspWriter.write( "<form action= \'"+pageContext.getServletContext().getContextPath()+"/product/search\' method=\"POST\" id=\"search_mini_form\">\r\n");
			jspWriter.write( "<input type=\"text\" placeholder=\"Search entire store here...\" value=\""+keyword+"\" maxlength=\"70\" name=\"keyword\" id=\"search\">\r\n");
			jspWriter.write( "<button type=\"submit\"  class=\"btn btn-default  search-btn-bg\"> <span class=\"glyphicon glyphicon-search\"></span>&nbsp;</button>\r\n");
			jspWriter.write("<select class=\"selectpicker\" name=\"category\">\r\n");
			jspWriter.write("<option value='-1'>All </option>");
				if(categories != null) {
					for (Category category : categories) {
						jspWriter.write("<optgroup label='"+category.getName()+"'>");
						if(!category.getCategories().isEmpty()) {
							for (Category subCategory : category.getCategories()) {
								jspWriter.write("<option class='suclasss' value='"+subCategory.getId()+"'>");
								jspWriter.write(subCategory.getName());
								jspWriter.write("</option>");
							}
						}
						jspWriter.write("</optgroup>");
					}
				}
			jspWriter.write( "</select>\r\n");
			jspWriter.write( "	</form>	\r\n");
			jspWriter.write( "</div>");
			
		} catch (Exception e) {
			try {
				jspWriter.write(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	@Override
	protected int doStartTagInternal() throws Exception {
		if(productService == null || categoryServices == null) {
			WebApplicationContext applicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}
}
