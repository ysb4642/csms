package com.spring.csms.admin.goods.service;

import java.util.List;

import com.spring.csms.goods.dto.GoodsDto;

public interface AdminGoodsService {
	
	public List<GoodsDto> getGoodsList() throws Exception;
}
