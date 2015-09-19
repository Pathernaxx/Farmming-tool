package com.farmingtool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="rental")
public class RentalController {

	@RequestMapping(value="rentalmain.action", method=RequestMethod.GET)
	public String rentalView() {
		return "rental/rentalmain";
	}
	
	@RequestMapping(value="rentalCheck.action", method=RequestMethod.GET)
	public String rentalCheck() {
		return "rental/rentalcheck";
	}
	
	@RequestMapping(value="calendarTest.action", method=RequestMethod.GET)
	public String calendarTest() {
		return "rental/calendartest";
	}
	
	@RequestMapping(value="moveToCheckRental.action", method=RequestMethod.POST)
	public String moveToCheckRental() {
		
		System.out.println("hello");
		
		String a="";
		
		return a;
	}

	
}
