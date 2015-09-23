package com.farmingtool.repository;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.farmingtool.dto.Admin;
import com.farmingtool.dto.Member;
import com.farmingtool.mapper.AccountMapper;

@Repository(value="accountRepository")
public class OracleAccountRepository implements AccountRepository{

	private AccountMapper accountMapper;
	
	@Autowired
	@Qualifier(value="accountMapper")
	public void setAccountMapper(AccountMapper accountMapper)
	{
		this.accountMapper = accountMapper;
	}

	@Override
	public Member getMemberByIdAndPassword(HashMap<String, String> params) {
		return accountMapper.selectMemberByIdAndPassword(params);
	}

	@Override
	public Admin getAdminByIdAndPassword(HashMap<String, String> params) {
		return accountMapper.selectAdminByIdAndPassword(params);
	}

	@Override
	public int getMemberId(String id) {
		return accountMapper.selectMemberId(id);
	}
	
	@Override
	public int getAdminId(String id) {
		
		return accountMapper.selectAdminId(id);
	}

	@Override
	public void setMember(Member member) {
		accountMapper.insertMember(member);
	}

	@Override
	public void setAdmin(Admin admin) {
		accountMapper.insertAdmin(admin);
	}

}
