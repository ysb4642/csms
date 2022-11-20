package com.spring.csms.myPage.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, Object>> selectListMyCart(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selctListMyCart", memberId);
	}

	@Override
	public void deleteCart(int[] deleteCartCdList) throws Exception {
		sqlSession.delete("myPage.deleteCart", deleteCartCdList);
	}

	@Override
	public void updateCartGoodsQty(Map<String, Object> updateMap) throws Exception {
		sqlSession.update("myPage.updateCartGoodsQty", updateMap);
	}

	@Override
	public List<Map<String, Object>> selectListMyOrder(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectListMyOrder", memberId);
	}

	@Override
	public Map<String, Object> selectOneMyOrder(Map<String, Object> orderDetailMap) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyOrder", orderDetailMap);
	}

	@Override
	public int selectCountMyCart(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectCountMyCart" , memberId);
	}

}
