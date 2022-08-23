package com.spring.csms.myPage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.myPage.dto.CartDto;

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

	@Override
	public CartDto selectOneDuplicatedCart(CartDto cartDto) throws Exception {
		return sqlSession.selectOne("myPage.selectOneDuplicatedCart", cartDto);
	}

	@Override
	public void insertCart(CartDto cartDto) throws Exception {
		sqlSession.insert("myPage.insertCart", cartDto);
	}

}
