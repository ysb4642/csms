package com.spring.csms.admin.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.csms.goods.dto.GoodsDto;

@Repository
public class AdminGoodsDaoImpl implements AdminGoodsDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsDto> selectListGoods() throws Exception {
		return sqlSession.selectList("admin.goods.selectListGoods");
	}

	@Override
	public void insertGoods(GoodsDto goodsDto) throws Exception {
		sqlSession.insert("admin.goods.insertGoods", goodsDto);
		
	}

	@Override
	public void deleteGoods(int goodsCd) throws Exception {
		sqlSession.delete("admin.goods.deleteGoods", goodsCd);
		
	}

	@Override
	public void updateGoods(GoodsDto goodsDto) throws Exception {
		sqlSession.update("admin.goods.updateGoods", goodsDto);
		
	}
	
	
}
