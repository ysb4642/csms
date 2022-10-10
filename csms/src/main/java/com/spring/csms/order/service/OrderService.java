package com.spring.csms.order.service;

import java.util.List;
import java.util.Map;

import com.spring.csms.goods.dto.GoodsDto;
import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.order.dto.OrderDto;

public interface OrderService {

	public MemberDto getOrdererDetail(String memberId) throws Exception;
	public List<GoodsDto> getGoodsListByCart(Map<String, Object> orderCartMap) throws Exception;
	public void addOrderByCart(Map<String, String> orderListMap) throws Exception;
	public GoodsDto getGoodsDetail(int goodsCd) throws Exception;
	public void addOrder(OrderDto orderDto, int point) throws Exception;

}
