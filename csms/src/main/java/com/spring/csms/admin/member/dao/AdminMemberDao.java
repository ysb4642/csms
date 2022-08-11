package com.spring.csms.admin.member.dao;

import java.util.List;

import com.spring.csms.admin.member.dto.AdminDto;
import com.spring.csms.member.dto.MemberDto;

public interface AdminMemberDao {
	
	public AdminDto selectAdminLogin(AdminDto adminDto) throws Exception;
	public List<MemberDto> selectListMember() throws Exception;
}
