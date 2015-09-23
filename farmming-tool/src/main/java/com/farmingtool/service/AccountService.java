package com.farmingtool.service;

import com.farmingtool.dto.Admin;
import com.farmingtool.dto.Member;

public interface AccountService {
	Member 	getMemberByIdAndPassword(String id, String password);
	Admin 	getAdminByIdAndPassword(String id, String password);
	int 	getMemberId(String id);
	int		getAdminId(String id);
	void	setMember(Member member);
	void	setAdmin(Admin admin);
}
