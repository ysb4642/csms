package com.spring.csms.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.myPage.dao.MyPageDao;
import com.spring.csms.myPage.dto.CartDto;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	
	@Override
	public MemberDto getMyInfo(String memberId) throws Exception {
		return myPageDao.selectOneMyInfo(memberId);
	}

	@Override
	public void modifyMyInfo(MemberDto memberDto) throws Exception {
		if (memberDto.getSmsstsYn() == null) memberDto.setSmsstsYn("N"); 
		if (memberDto.getEmailstsYn() == null) memberDto.setEmailstsYn("N");
		myPageDao.updateMyInfo(memberDto);
		
	}

	@Override
	public void removeMember(String memberId) throws Exception {
		myPageDao.deleteMember(memberId);
	}

	@Override
	public boolean checkDuplicatedCart(CartDto cartDto) throws Exception {
		if (myPageDao.selectOneDuplicatedCart(cartDto) == null) {
			return false;
		} else {
			return true;
		}
		
	}

	@Override
	public void addCart(CartDto cartDto) throws Exception {
		myPageDao.insertCart(cartDto);
		
	}

}
