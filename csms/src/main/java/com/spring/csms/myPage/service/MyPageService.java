package com.spring.csms.myPage.service;

import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.myPage.dto.CartDto;

public interface MyPageService {
	public MemberDto getMyInfo(String memberId) throws Exception;
	public void modifyMyInfo(MemberDto memberDto) throws Exception;
	public void removeMember(String memberId) throws Exception;
	public boolean checkDuplicatedCart(CartDto cartDto) throws Exception;
	public void addCart(CartDto cartDto) throws Exception;
}
