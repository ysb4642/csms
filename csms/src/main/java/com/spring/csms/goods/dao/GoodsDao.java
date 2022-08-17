package com.spring.csms.goods.dao;

import com.spring.csms.goods.dto.GoodsDto;

public interface GoodsDao {

	public GoodsDto selectOneGoods(int goodsCd) throws Exception;

}
