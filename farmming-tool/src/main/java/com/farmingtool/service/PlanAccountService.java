package com.farmingtool.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.farmingtool.commons.Util;
import com.farmingtool.dto.Admin;
import com.farmingtool.dto.Member;
import com.farmingtool.repository.AccountRepository;

@Service(value="accountService")
public class PlanAccountService implements AccountService {

	private AccountRepository accountRepository;
	
	@Autowired
	@Qualifier(value="accountRepository")
	public void setAccountRepository(AccountRepository accountRepository)
	{
		this.accountRepository = accountRepository;
	}
	
	@Override
	public Member getMemberByIdAndPassword(String id, String password) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("password", Util.getHashedString(password, "SHA-1"));
		
		Member member = accountRepository.getMemberByIdAndPassword(params);
		
		return member;
	}

	@Override
	public Admin getAdminByIdAndPassword(String id, String password) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("password", Util.getHashedString(password, "SHA-1"));
		
		Admin admin = accountRepository.getAdminByIdAndPassword(params);
		
		return admin;
	}

	@Override
	public int getMemberId(String id) {
		
		return accountRepository.getMemberId(id);
	}
	
	@Override
	public int getAdminId(String id) {
		
		return accountRepository.getAdminId(id);
	}

	@Override
	public void setMember(Member member) {
		
		String password = member.getMemberPassword();
		
		password = Util.getHashedString(password, "SHA-1");
		
		member.setMemberPassword(password);
		
		accountRepository.setMember(member);
		
	}

	@Override
	public void setAdmin(Admin admin) {

		String password = admin.getAdminPassword();
		
		password = Util.getHashedString(password, "SHA-1");
		
		admin.setAdminPassword(password);
		
		accountRepository.setAdmin(admin);
		
	}

}
