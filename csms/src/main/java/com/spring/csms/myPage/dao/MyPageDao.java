package com.spring.csms.myPage.dao;

import java.util.List;
import java.util.Map;

import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.myPage.dto.CartDto;

public interface MyPageDao {
	
	public MemberDto selectOneMyInfo(String memberId) throws Exception;
	public void updateMyInfo(MemberDto memberDto) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	public CartDto selectOneDuplicatedCart(CartDto cartDto) throws Exception;
	public void insertCart(CartDto cartDto) throws Exception;
	public List<Map<String, Object>> selectListMyCart(String memberId) throws Exception;
	public void deleteCart(int[] deleteCartCdList) throws Exception;
	public void updateCartGoodsQty(Map<String, Object> updateMap) throws Exception;
	public List<Map<String, Object>> selectListMyOrder(String memberId) throws Exception;
	public Map<String, Object> selectOneMyOrder(Map<String, Object> orderDetailMap) throws Exception;
}
