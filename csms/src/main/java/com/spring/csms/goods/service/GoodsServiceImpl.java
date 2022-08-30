package com.spring.csms.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.csms.goods.dao.GoodsDao;
import com.spring.csms.goods.dto.GoodsDto;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private GoodsDao goodsDao;
	@Override
	public GoodsDto getGoodsDetail(int goodsCd) throws Exception {
		return goodsDao.selectOneGoods(goodsCd);
	}
	@Override
	public List<GoodsDto> getGoodsList(Map<String, String> goodsListMap) throws Exception {
		return goodsDao.selectGoodsList(goodsListMap);
	}
	@Override
	public List<GoodsDto> getRelatedGoodsList(Map<String, Object> goodsMap) throws Exception {
		return goodsDao.selectRelatedGoodsList(goodsMap);
	}
	@Override
	public List<GoodsDto> getSearchGoodsList(String searchGoods) throws Exception {
		return goodsDao.selectListSearchGoods(searchGoods);
	}

}
