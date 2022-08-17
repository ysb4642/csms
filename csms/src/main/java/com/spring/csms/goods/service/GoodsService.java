package com.spring.csms.goods.service;

import com.spring.csms.goods.dto.GoodsDto;

public interface GoodsService {
	
	public GoodsDto getGoodsDetail(int goodsCd) throws Exception;
}
