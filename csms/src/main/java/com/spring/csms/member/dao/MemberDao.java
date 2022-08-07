package com.spring.csms.member.dao;

import com.spring.csms.member.dto.MemberDto;

public interface MemberDao {
	
	public String selectDuplicatedId(String memberId) throws Exception; 
	public void insertMember(MemberDto memberDto) throws Exception;
}
