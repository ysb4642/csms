package com.spring.csms.admin.member.service;

import com.spring.csms.admin.member.dto.AdminDto;

public interface AdminMemberService {
	
	public boolean adminLogin(AdminDto adminDto) throws Exception;
}
