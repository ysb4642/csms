package com.spring.csms.admin.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.csms.admin.member.dao.AdminMemberDao;
import com.spring.csms.admin.member.dto.AdminDto;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDao adminMemberDao;
	
	@Override
	public boolean adminLogin(AdminDto adminDto) throws Exception {
		
		if (adminMemberDao.selectAdminLogin(adminDto) != null) {
			return true;
		}
		return false;
	}

}
