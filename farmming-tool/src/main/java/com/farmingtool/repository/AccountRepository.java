package com.farmingtool.repository;

import java.util.HashMap;

import com.farmingtool.dto.Admin;
import com.farmingtool.dto.Member;

public interface AccountRepository {
	Member 	getMemberByIdAndPassword(HashMap<String, String> params);
	Admin 	getAdminByIdAndPassword(HashMap<String, String> params);
	int 	getMemberId(String id);
	int		getAdminId(String id);
	void	setMember(Member member);
	void	setAdmin(Admin admin);
}
