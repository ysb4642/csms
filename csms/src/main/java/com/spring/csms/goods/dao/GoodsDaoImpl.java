package com.spring.csms.goods.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<GoodsDto> selectGoodsList(Map<String, String> goodsListMap) throws Exception {
		return sqlSession.selectList("goods.selectListGoods", goodsListMap);
	}

}
