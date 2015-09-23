package com.farmingtool.mapper;

import java.util.HashMap;

import com.farmingtool.dto.Admin;
import com.farmingtool.dto.Member;

public interface AccountMapper {
	Member 	selectMemberByIdAndPassword(HashMap<String, String> params);
	Admin 	selectAdminByIdAndPassword(HashMap<String, String> params);
	int 	selectMemberId(String id);
	int 	selectAdminId(String id);
	void	insertMember(Member member);
	void	insertAdmin(Admin admin);
}
