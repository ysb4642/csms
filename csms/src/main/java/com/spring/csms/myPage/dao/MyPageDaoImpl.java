package com.spring.csms.myPage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.csms.member.dto.MemberDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto selectOneMyInfo(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyInfo", memberId);
	}

	@Override
	public void updateMyInfo(MemberDto memberDto) throws Exception {
		sqlSession.update("myPage.updateMyInfo", memberDto);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteMember", memberId);
	}

}
