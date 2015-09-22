package com.farmingtool.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.farmingtool.dto.Admin;
import com.farmingtool.dto.Location1;
import com.farmingtool.dto.Location2;
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
	public List<Member> getMemberList() {
		// TODO Auto-generated method stub
		return accountMapper.selectMemberList();
	}

	@Override
	public List<Admin> getAdminList() {
		// TODO Auto-generated method stub
		return accountMapper.selectAdminList();
	}

	@Override
	public void setMemberInfo(Member member) {
		// TODO Auto-generated method stub
		accountMapper.updateMember(member);
	}

	@Override
	public void setAdminInfo(Admin admin) {
		// TODO Auto-generated method stub
		accountMapper.updateAdmin(admin);
	}

	@Override
	public void setAdminLocationInfo(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		accountMapper.updateAdminLocation(params);
	}

	@Override
	public List<Location1> getLocation1() {
		
		return accountMapper.selectLocation1();
	}

	@Override
	public List<Location2> getLocation2() {
		
		return accountMapper.selectLocation2();
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
