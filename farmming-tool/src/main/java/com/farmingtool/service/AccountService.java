package com.farmingtool.service;

import java.util.List;

import com.farmingtool.dto.Admin;
import com.farmingtool.dto.Location1;
import com.farmingtool.dto.Location2;
import com.farmingtool.dto.Member;

public interface AccountService {
	Member 		getMemberByIdAndPassword(String id, String password);
	Admin 		getAdminByIdAndPassword(String id, String password);
	List<Member>		getMemberList();
	List<Admin>			getAdminList();
	List<Location1> 	getLocation1();
	List<Location2> 	getLocation2();
	int 		getMemberId(String id);
	int			getAdminId(String id);
	void		setMember(Member member);
	void		setAdmin(Admin admin);
	void		setMemberInfo(Member member);
	void		setAdminInfo(Admin admin);
	void		setAdminLocationInfo(String adminId, String location1, String location2);
}
