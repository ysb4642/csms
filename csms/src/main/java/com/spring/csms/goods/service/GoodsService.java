package com.spring.csms.goods.service;

import java.util.List;
import java.util.Map;

import com.spring.csms.goods.dto.GoodsDto;

public interface GoodsService {
	
	public GoodsDto getGoodsDetail(int goodsCd) throws Exception;
	public List<GoodsDto> getGoodsList(Map<String, String> goodsListMap) throws Exception;
	public List<GoodsDto> getRelatedGoodsList(Map<String, Object> goodsMap) throws Exception;
	public List<GoodsDto> getSearchGoodsList(String searchGoods) throws Exception;
}
