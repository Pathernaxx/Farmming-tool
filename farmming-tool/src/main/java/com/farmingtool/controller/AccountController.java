package com.farmingtool.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmingtool.dto.Admin;
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
		
		if(id.contains("ADMIN_"))
		{
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
		// member.setLocation2();
		
		accountService.setMember(member);
		
		return "home";
	}
}
