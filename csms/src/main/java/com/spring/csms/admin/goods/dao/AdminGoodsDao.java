package com.spring.csms.admin.goods.dao;

import java.util.List;

import com.spring.csms.goods.dto.GoodsDto;

public interface AdminGoodsDao {
	
	public List<GoodsDto> selectListGoods() throws Exception;
}
