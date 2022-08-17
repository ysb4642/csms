package com.spring.csms.goods.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.csms.goods.dto.GoodsDto;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public GoodsDto selectOneGoods(int goodsCd) throws Exception {
		return sqlSession.selectOne("goods.selectOneGoods", goodsCd);
	}

}
