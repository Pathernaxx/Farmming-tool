package com.farmingtool.mapper;

import java.util.HashMap;
import java.util.List;

import com.farmingtool.dto.Admin;
import com.farmingtool.dto.Location1;
import com.farmingtool.dto.Location2;
import com.farmingtool.dto.Member;

public interface AccountMapper {
	Member 		selectMemberByIdAndPassword(HashMap<String, String> params);
	Admin 		selectAdminByIdAndPassword(HashMap<String, String> params);
	List<Member> 		selectMemberList();
	List<Admin> 		selectAdminList();
	List<Location1> 	selectLocation1();
	List<Location2> 	selectLocation2();
	int 		selectMemberId(String id);
	int 		selectAdminId(String id);
	void		insertMember(Member member);
	void		insertAdmin(Admin admin);
	void		updateMember(Member member);
	void		updateAdmin(Admin admin);
	void		updateAdminLocation(HashMap<String, String> params);
}
