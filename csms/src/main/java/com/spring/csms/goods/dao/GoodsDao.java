package com.spring.csms.goods.dao;

import java.util.List;
import java.util.Map;

import com.spring.csms.goods.dto.GoodsDto;

public interface GoodsDao {

	public GoodsDto selectOneGoods(int goodsCd) throws Exception;
	public List<GoodsDto> selectGoodsList(Map<String, String> goodsListMap) throws Exception;
	public List<GoodsDto> selectRelatedGoodsList(Map<String, Object> goodsMap) throws Exception;
	public List<GoodsDto> selectListSearchGoods(String searchGoods) throws Exception;

}
