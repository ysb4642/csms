package com.spring.csms.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.csms.goods.dto.GoodsDto;
import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.order.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto selectOneOrderer(String memberId) throws Exception {
		return sqlSession.selectOne("order.selectOneOrderer", memberId);
	}

	@Override
	public List<GoodsDto> selectListCartGoods(int[] goodsCdList) throws Exception {
		return sqlSession.selectList("order.selectListCartGoods", goodsCdList);
	}

	@Override
	public void updateGoodsStockCntByCart(List<Map<String, Integer>> goodsMapList) throws Exception {
		sqlSession.update("order.updateGoodsStockCntByCart", goodsMapList);
	}

	@Override
	public void insertOrderByCart(List<OrderDto> orderList) throws Exception {
		sqlSession.insert("order.insertOrderByCart", orderList);
		
	}

	@Override
	public void deleteCartByOrder(int[] cartCdList) throws Exception {
		sqlSession.delete("order.deleteCartByOrder", cartCdList);
		
	}

	@Override
	public void updateMemberPointByCart(Map<String, Object> memberMap) throws Exception {
		sqlSession.update("order.updateMemberPointByCart", memberMap);
	}

	@Override
	public GoodsDto selectOneCartGoods(int goodsCd) throws Exception {
		return sqlSession.selectOne("order.selectOneCartGoods", goodsCd);
	}

	@Override
	public void updateGoodsStockCnt(Map<String, Object> orderMap) throws Exception {
		sqlSession.update("order.updateGoodsStockCnt" , orderMap);
	}

	@Override
	public void updateMemberPoint(Map<String, Object> orderMap) throws Exception {
		sqlSession.update("order.updateMemberPoint" , orderMap);
	}

	@Override
	public void insertOrder(OrderDto orderDto) throws Exception {
		sqlSession.insert("order.insertOrder" , orderDto);
	}

}
