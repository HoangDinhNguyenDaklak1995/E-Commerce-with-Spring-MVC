package com.demo.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class tilesConfigurations extends WebMvcConfigurerAdapter {
	
	@Bean
	public UrlBasedViewResolver urlBasedViewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(TilesView.class);
		return viewResolver;
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] {
				"/WEB-INF/tiles/tiles_user.xml",
				"/WEB-INF/tiles/tiles_admin.xml",
				"/WEB-INF/tiles/tiles_admin_category.xml",
				"/WEB-INF/tiles/tiles_admin_product.xml",
				"/WEB-INF/tiles/tiles_admin_customer.xml",
				"/WEB-INF/tiles/tiles_admin_invoices.xml",
				"/WEB-INF/tiles/tiles_admin_slider.xml",
				"/WEB-INF/tiles/tiles_admin_product_photo.xml",
				"/WEB-INF/tiles/tiles_product.xml",
				"/WEB-INF/tiles/tiles_cart.xml",
				"/WEB-INF/tiles/tiles_customer.xml"
		});
		return configurer;
	}
	
}
