package com.spring.csms.goods.service;

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

}
