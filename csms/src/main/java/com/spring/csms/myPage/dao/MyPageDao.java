package com.spring.csms.myPage.dao;

import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.myPage.dto.CartDto;

public interface MyPageDao {
	
	public MemberDto selectOneMyInfo(String memberId) throws Exception;
	public void updateMyInfo(MemberDto memberDto) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	public CartDto selectOneDuplicatedCart(CartDto cartDto) throws Exception;
	public void insertCart(CartDto cartDto) throws Exception;
}
