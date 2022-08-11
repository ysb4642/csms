package com.spring.csms.admin.member.service;

import java.util.List;

import com.spring.csms.admin.member.dto.AdminDto;
import com.spring.csms.member.dto.MemberDto;

public interface AdminMemberService {
	
	public boolean adminLogin(AdminDto adminDto) throws Exception;
	public List<MemberDto> getMemberList()throws Exception;
}
