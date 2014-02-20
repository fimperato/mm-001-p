package it.gestione.common.controllers;

import it.gestione.common.dto.DataTableObject;
import it.gestione.common.dto.Student;
import it.gestione.movie.entity.Shop;
import it.gestione.movie.service.StudentDataService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/kfc/brands")
public class JSONController {

	@RequestMapping(value = "{name}", method = RequestMethod.GET)
	public @ResponseBody DataTableObject getShopInJSON(@PathVariable String name) {

		Shop shop = new Shop();
		shop.setName(name);
		shop.setStaffName(new String[] { "MKY1", "MKY2" });
		
		List<Student> lisOfStudent = StudentDataService.getStudentList();
		   
		DataTableObject dataTableObject = new DataTableObject();
		dataTableObject.setAaData(lisOfStudent);
		  
		return dataTableObject;

	}

}