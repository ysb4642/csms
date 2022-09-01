package com.spring.csms.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.csms.review.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertReview(ReviewDto reviewDto) throws Exception {
		sqlSession.insert("review.insertReview", reviewDto);
	}

	@Override
	public List<ReviewDto> selectReviewList(int goodsCd) throws Exception {
		return sqlSession.selectList("review.selectReviewList", goodsCd);
	}

	@Override
	public int selectReviewCnt(int goodsCd) throws Exception {
		return sqlSession.selectOne("review.selectReviewCnt", goodsCd);
	}
	
}
