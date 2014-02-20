package it.gestione.common.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/inserimento")
public class InserimentoController {

	@RequestMapping(method = RequestMethod.GET)
	public String printPageName(ModelMap model) {

		model.addAttribute("message", "di inserimento");
		return "inserimento";

	}
	
//	public ModelAndView handleRequest(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
// 
//		String aMessage = "test 01";
//		String dest = "inserimento";
// 
//		ModelAndView modelAndView = new ModelAndView("hello_world");
//		modelAndView.addObject("message", aMessage);
//		
//		modelAndView.setViewName(dest);
// 
//		return modelAndView;
//	}
	
}