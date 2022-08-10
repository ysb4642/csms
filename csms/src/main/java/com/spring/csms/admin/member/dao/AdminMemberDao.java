package com.spring.csms.admin.member.dao;

import com.spring.csms.admin.member.dto.AdminDto;

public interface AdminMemberDao {
	
	public AdminDto selectAdminLogin(AdminDto adminDto) throws Exception;
}
