package com.spring.csms.member.service;


import com.spring.csms.member.dto.MemberDto;

public interface MemberService {
	
	public String checkDuplicatedId(String memberId) throws Exception;
	public void addMember(MemberDto memberDto) throws Exception;
	public boolean login(MemberDto memberDto) throws Exception;
}
