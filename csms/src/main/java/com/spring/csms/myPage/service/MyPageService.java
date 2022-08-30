package com.spring.csms.myPage.service;

import java.util.List;
import java.util.Map;

import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.myPage.dto.CartDto;

public interface MyPageService {
	public MemberDto getMyInfo(String memberId) throws Exception;
	public void modifyMyInfo(MemberDto memberDto) throws Exception;
	public void removeMember(String memberId) throws Exception;
	public boolean checkDuplicatedCart(CartDto cartDto) throws Exception;
	public void addCart(CartDto cartDto) throws Exception;
	public void removeCart(int[] deleteCartCdList) throws Exception;
	public void modifyCartGoodsQty(Map<String, Object> updateMap) throws Exception;
	public List<Map<String, Object>> getMyOrderList(String memberId) throws Exception;
	public Map<String,Object> getMyOrderDetail(Map<String, Object> orderDetailMap) throws Exception;
	public List<Map<String, Object>> getMyCartList(String memberId) throws Exception;
	public int countCartList(String memberId) throws Exception;
}
