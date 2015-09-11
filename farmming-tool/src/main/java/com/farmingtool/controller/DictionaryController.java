package com.farmingtool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="dictionary")
public class DictionaryController {
	
	
	@RequestMapping(value="view.action", method= RequestMethod.GET)
	public String DictionaryApp(){
		return "dictionary/view";
	}
	
}
