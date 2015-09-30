package com.farmingtool.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.farmingtool.dto.Admin;
import com.farmingtool.dto.RentalHistory;
import com.farmingtool.service.AdminMachineSettingService;

@Controller
@RequestMapping(value="admin")
public class AdminContorller {

	private AdminMachineSettingService adminMachineSettingService;
	
	@Autowired
	@Qualifier(value="adminMachineSettingService")
	public void setAdminMachineSettingService(AdminMachineSettingService adminMachineSettingService)
	{
		this.adminMachineSettingService = adminMachineSettingService;
	}
	
	@RequestMapping(value="rentallist.action", method=RequestMethod.GET)
	public ModelAndView rentalList(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		Admin admin = null;
		List<RentalHistory> rentalHistory = null;
		
		if(session.getAttribute("USERTYPE").equals("ADMIN"))
		{
			admin = (Admin)session.getAttribute("loginuser");
		}
		
		if(admin != null)
			rentalHistory = adminMachineSettingService.getRentalHistory(admin.getAdminLocation2());
		
		
		
		mav.addObject("historys", rentalHistory);
		mav.setViewName("admin/rentlist");
		
		return mav;
	}
	
	@RequestMapping(value="changeStatus.action", method=RequestMethod.POST)
	@ResponseBody
	public void changeStatus(int status, int historyNo)
	{
		
		adminMachineSettingService.setRentalHistoryStatus(status+1, historyNo);
	}
}
