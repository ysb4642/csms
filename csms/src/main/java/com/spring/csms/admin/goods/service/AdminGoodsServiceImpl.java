package com.spring.csms.admin.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.csms.admin.goods.dao.AdminGoodsDao;
import com.spring.csms.goods.dto.GoodsDto;

@Service
public class AdminGoodsServiceImpl implements AdminGoodsService {

	@Autowired
	private AdminGoodsDao adminGoodsDao;
	
	@Override
	public List<GoodsDto> getGoodsList() throws Exception {
		return adminGoodsDao.selectListGoods();
	}

	@Override
	public void addNewGoods(GoodsDto goodsDto) throws Exception {
		if (goodsDto.getExpiryDate().equals("")) {
			goodsDto.setExpiryDate(null);
		}
		adminGoodsDao.insertGoods(goodsDto);
	}

	@Override
	public void removeGoods(int goodsCd) throws Exception {
		adminGoodsDao.deleteGoods(goodsCd);
		
	}

	@Override
	public void modifyGoods(GoodsDto goodsDto) throws Exception {
		if (goodsDto.getExpiryDate().equals("")) {
			goodsDto.setExpiryDate(null);
		}
		adminGoodsDao.updateGoods(goodsDto);
		
	}

}
