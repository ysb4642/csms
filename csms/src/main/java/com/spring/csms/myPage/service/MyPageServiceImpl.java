package com.spring.csms.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.myPage.dao.MyPageDao;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	
	@Override
	public MemberDto getMyInfo(String memberId) throws Exception {
		return myPageDao.selectOneMyInfo(memberId);
	}

}
