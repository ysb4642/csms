package com.spring.csms.myPage.service;

import com.spring.csms.member.dto.MemberDto;

public interface MyPageService {
	public MemberDto getMyInfo(String memberId) throws Exception;
	public void modifyMyInfo(MemberDto memberDto) throws Exception;
	public void removeMember(String memberId) throws Exception;
}
