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
	
	
}