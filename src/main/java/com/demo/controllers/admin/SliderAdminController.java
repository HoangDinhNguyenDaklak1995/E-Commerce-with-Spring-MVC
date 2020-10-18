package com.demo.controllers.admin;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.models.slide;
import com.demo.services.SliderService;

@Controller
@RequestMapping("/admin/slider")
public class SliderAdminController implements ServletContextAware {

	private ServletContext servletContext;
	
	@Autowired
	private SliderService sliderService;

	@RequestMapping(method = RequestMethod.GET)
	public String slider(ModelMap modelMap) {
		modelMap.put("slide", sliderService.findAllSlider());
		return "admin.slider.index";
	}
	
	@RequestMapping(value = "add",method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.put("slides", new slide());
		return "admin.slider.add";
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public String add(ModelMap modelMap,@ModelAttribute("slide") slide slide, @RequestParam(value = "file") MultipartFile file) {
		slide.setName(uploadFiles(file));
		slide.setStatus(true);
		sliderService.save(slide);
		return "redirect:/admin/slider";
	}
	
	@RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		sliderService.delete(id);
		return "redirect:/admin/slider";
	}
	
	@RequestMapping(value = "edit/{id}",method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("slide", sliderService.find(id));
		return "admin.slider.edit";
	}

	@RequestMapping(value = "edit",method = RequestMethod.POST)
	public String edit(ModelMap modelMap,@ModelAttribute("slide") slide slide, @RequestParam(value = "file") MultipartFile file) {
		slide currentslider = sliderService.find(slide.getId());
		if(file != null && !file.getOriginalFilename().isEmpty() ) {
			currentslider.setName(uploadFiles(file));
		}
		currentslider.setDescription(slide.getDescription());
		currentslider.setStatus(slide.isStatus());
		sliderService.save(currentslider);
		return "redirect:/admin/slider";
	}
	
	private String uploadFiles(MultipartFile multipartFile) {
		try {
			byte[] bs = multipartFile.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/" + multipartFile.getOriginalFilename()));
			Files.write(path, bs);
			return multipartFile.getOriginalFilename();
		} catch (Exception e) {
			return "No image" + e.getMessage();
		}
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
