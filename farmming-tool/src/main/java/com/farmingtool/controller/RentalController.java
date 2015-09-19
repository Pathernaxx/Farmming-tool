package com.farmingtool.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="rentalMachine.action", method=RequestMethod.GET)
	@ResponseBody
	public String rentalMachine(HttpServletRequest request) {
		
		/* 예약처리는 여기서 페이지 이동은 jsp ajax에서 */
		
		String dummy = request.getParameter("dummy");
		//System.out.println(dummy);
		String result = "aaa";
		
		return result;
	}
	
	@RequestMapping(value="moveToCheckRental.action", method=RequestMethod.GET)
	public String moveToCheckRental() {
		return "rental/rentalcheckpage";
	}

	
}
