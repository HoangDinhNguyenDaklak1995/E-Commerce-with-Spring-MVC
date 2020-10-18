package com.demo.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.services.SliderService;

public class sliderTag extends RequestContextAwareTag{

	private static final long serialVersionUID = 5919380581149628277L;
	
	@Autowired
	private SliderService slideService;
	
	@Override
	public void doFinally() {
		JspWriter jspWriter = pageContext.getOut();
		try {
			HttpServletRequest httpServletRequest = (HttpServletRequest) pageContext.getRequest();
			httpServletRequest.setAttribute("slides", slideService.findAllwithStatus(true));
			String jspPage = "components/slider_tags.jsp";
			httpServletRequest.getRequestDispatcher(jspPage);
			pageContext.include(jspPage);
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

		if(slideService == null) {
			WebApplicationContext applicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
			autowireCapableBeanFactory.autowireBean(this);
		}
		return SKIP_BODY;
	}
}
