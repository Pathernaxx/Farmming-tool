package com.farmingtool.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.farmingtool.dto.FarmMachine;
import com.farmingtool.service.FarmMachineService;


@Controller
@RequestMapping(value="dictionary")
public class DictionaryController {
	
	
	private FarmMachineService farmMachineService;
	@Autowired
	@Qualifier("farmMachineService")
	public void setFarmMachineService(FarmMachineService farmMachineService) {
		this.farmMachineService = farmMachineService;
	}
	
	
	@RequestMapping(value="view.action", method= RequestMethod.GET)
	public ModelAndView DictionaryApp(){
		
		ModelAndView mav = new ModelAndView();
		List<FarmMachine> farmMachineList = farmMachineService.getFarmMachineList();
		
		/*for(FarmMachine fmList :  farmMachineList){
			System.out.println(fmList.getFmNo());
		}*/
		
		mav.addObject("farmMachineList", farmMachineList);
		mav.setViewName("dictionary/cover");

		return mav;
	}

	@RequestMapping(value="showdetail.action", method= RequestMethod.GET)
	public ModelAndView DictionaryDetail(String fmno){
		ModelAndView mav = new ModelAndView();
		FarmMachine farmMachineDetail = farmMachineService.getFarmMachineDetail(fmno);
		mav.addObject("farmMachineDetail", farmMachineDetail);
		mav.setViewName("dictionary/coverdetail");
		return mav;
	}
	
}
