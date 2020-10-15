package com.demo.tags;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.services.CategoryService;
import com.demo.services.ProductService;

public class CartTags extends RequestContextAwareTag{

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
			jspWriter.write("<div class=\"search-box\">\r\n");

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
