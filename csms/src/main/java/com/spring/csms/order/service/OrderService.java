package com.spring.csms.order.service;

import java.util.List;
import java.util.Map;

import com.spring.csms.goods.dto.GoodsDto;
import com.spring.csms.member.dto.MemberDto;

public interface OrderService {

	public MemberDto getOrdererDetail(String memberId) throws Exception;
	public List<GoodsDto> getGoodsListByCart(int[] goodsCdList) throws Exception;
	public void addOrderByCart(Map<String, String> orderListMap) throws Exception;

}
