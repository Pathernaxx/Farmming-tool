package com.farmingtool.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.farmingtool.dto.Admin;
import com.farmingtool.dto.Location1;
import com.farmingtool.dto.Location2;
import com.farmingtool.dto.Member;
import com.farmingtool.service.AccountService;

@Controller
@RequestMapping(value="account")
public class AccountController {

	private AccountService accountService;
	
	@Autowired
	@Qualifier(value="accountService")
	public void setAccountService(AccountService accountService)
	{
		this.accountService = accountService;
	}
	
	@RequestMapping(value="login.action", method=RequestMethod.GET)
	public String login()
	{
		return "account/login";
	}
	
	@RequestMapping(value="login.action", method=RequestMethod.POST)
	@ResponseBody
	public String loginPost(HttpSession session, String id, String password)
	{
		String message = "SUCCESS";
		
		if(id.contains("#"))
		{
			// # 제거(ADMIN용)
			id = id.substring(1);
			
			// 예외 처리
			// ID 불일치
			if(accountService.getAdminId(id) == 0)
			{
				message = "id";
				return message;
			}
			
			Admin admin = accountService.getAdminByIdAndPassword(id, password);
			
			// PASSWORD 불일치
			if(admin == null)
			{
				message = "password";
				return message;
			}
			else
			{
				session.setAttribute("USERTYPE", "ADMIN");
				session.setAttribute("loginuser", admin);
			}
		}
		else
		{
			// 예외 처리
			// ID 불일치
			if(accountService.getMemberId(id) == 0)
			{
				message = "id";
				return message;
			}
			
			Member member = accountService.getMemberByIdAndPassword(id, password);
			
			// PASSWORD 불일치
			if(member == null)
			{
				message = "password";
				return message;
			}
			else
			{
				session.setAttribute("USERTYPE", "MEMBER");
				session.setAttribute("loginuser", member);
			}
		}
		
		return message;
	}
	
	@RequestMapping(value="registerAdmin.action", method=RequestMethod.GET)
	public ModelAndView registAdmin()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/adminRegistForm");
		
		List<Location1> locations1 = accountService.getLocation1();
		List<Location2> locations2 = accountService.getLocation2();
		
		// location1
		 mav.addObject("locations1", locations1);
		
		// location2
		 mav.addObject("locations2", locations2);
		
		return mav;
	}
	
	@RequestMapping(value="registerAdmin.action", method=RequestMethod.POST)
	public String registAdminPost(ServletRequest request)
	{
		// input 값
		// ID, PASSWORD, NAME, LOCATION1, LOCATION2, PHONE
		String adminId = 		request.getParameter("loginid");
		String adminPassword = 	request.getParameter("password1");
		String adminName = 		request.getParameter("name");
		String adminLocation1 = request.getParameter("location1");
		String adminLocation2 = request.getParameter("location2");
		String adminPhone = 
								request.getParameter("phoneNo1") + "-" + 
								request.getParameter("phoneNo2") + "-" + 
								request.getParameter("phoneNo3");
		
		Admin admin = new Admin();
		
		admin.setAdminId(adminId);
		admin.setAdminName(adminName);
		admin.setAdminPassword(adminPassword);
		admin.setAdminPhone(adminPhone);
		admin.setAdminLocation1(adminLocation1);
		admin.setAdminLocation2(adminLocation2);
		
		accountService.setAdmin(admin);
		
		return "account/login";
	}
	
	@RequestMapping(value="adminIdcheck.action", method=RequestMethod.GET)
	@ResponseBody
	public String idcheckAdmin(String id)
	{
		int result = accountService.getAdminId(id);
		
		if(result == 0)
			return "good";
		
		return "bad";
	}
	
	@RequestMapping(value="idcheck.action", method=RequestMethod.GET)
	@ResponseBody
	public String idcheck(String id)
	{
		int result = accountService.getMemberId(id);
		
		if(result == 0)
			return "good";
		
		return "bad";
	}
	
	@RequestMapping(value="registerMember.action", method=RequestMethod.GET)
	public String registerMember()
	{
		return "account/registerForm";
	}
	
	@RequestMapping(value="registerMember.action", method=RequestMethod.POST)
	public String register(ServletRequest request)
	{
		// 회원가입 처리
		String id = request.getParameter("loginid");
		String password = request.getParameter("password1");
		String name = request.getParameter("name");
		String phone = 
					request.getParameter("phoneNo1") + "-" + 
					request.getParameter("phoneNo2") + "-" + 
					request.getParameter("phoneNo3");
		String mobilePhone = 
						request.getParameter("mobilePhone1") + "-" + 
						request.getParameter("mobilePhone2") + "-" + 
						request.getParameter("mobilePhone3");
		String postcode = request.getParameter("postcode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String extraInfo = request.getParameter("extra_info").replace("(", "").replace(")", "");	// (xx동)
		
//		System.out.println(id + "/" + password + "/" + name + "/" + phone + "/" + mobilePhone +"/" +
//		postcode + "/" + address1 + "/" + address2 + "/" + extraInfo);
		String[] address = address1.split(" ");
		
		Member member = new Member();
		member.setMemberId(id);
		member.setMemberPassword(password);
		member.setMemberName(name);
		member.setMemberPhone1(phone);
		member.setMemberPhone2(mobilePhone);
		member.setMemberAddress1(address1);
		member.setMemberAddress2(address2);
		member.setMemberPostcode(postcode);
		member.setMemberExtraInfo(extraInfo);
		
		// location2 입력
		member.setLocationName2(address[1]);
		
		accountService.setMember(member);
		
		return "redirect:../home.action";
	}
	
	@RequestMapping(value="updateMember.action", method=RequestMethod.GET)
	public ModelAndView updateMember(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("loginuser");
		
		String[] phone = member.getMemberPhone1().split("-");
		String[] mobilePhone = member.getMemberPhone2().split("-");
		
		mav.addObject(member);
		mav.addObject(phone);
		mav.addObject(mobilePhone);
		
		mav.setViewName("account/memberinfo");
		return mav;
	}
	
	@RequestMapping(value="updateMember.action", method=RequestMethod.POST)
	public String updateMemberPost(ServletRequest request)
	{
		String id = request.getParameter("loginid");
		String password = request.getParameter("password1");

		String phone = 
					request.getParameter("phoneNo1") + "-" + 
					request.getParameter("phoneNo2") + "-" + 
					request.getParameter("phoneNo3");
		String mobilePhone = 
						request.getParameter("mobilePhone1") + "-" + 
						request.getParameter("mobilePhone2") + "-" + 
						request.getParameter("mobilePhone3");
	
		String postcode = request.getParameter("postcode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String extraInfo = request.getParameter("extra_info").replace("(", "").replace(")", "");	// (xx동)

		String[] address = address1.split(" ");
		
		Member member = new Member();
		member.setMemberId(id);
		member.setMemberPassword(password);
		
		member.setMemberPhone1(phone);
		member.setMemberPhone2(mobilePhone);
		member.setMemberAddress1(address1);
		member.setMemberAddress2(address2);
		member.setMemberPostcode(postcode);
		member.setMemberExtraInfo(extraInfo);
		
		// location2 입력
		member.setLocationName2(address[1]);
		
		accountService.setMemberInfo(member);
		
		return "redirect:../home.action";
	}
	
	@RequestMapping(value="logout.action", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.removeAttribute("loginuser");
		session.removeAttribute("USERTYPE");
		return "redirect:../home.action";
	}
	
	
	
}
