package com.spring.csms.myPage.dao;

import com.spring.csms.member.dto.MemberDto;

public interface MyPageDao {
	
	public MemberDto selectOneMyInfo(String memberId) throws Exception;
	public void updateMyInfo(MemberDto memberDto) throws Exception;
	public void deleteMember(String memberId) throws Exception;
}
