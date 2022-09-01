package com.spring.csms.review.dao;

import java.util.List;

import com.spring.csms.review.dto.ReviewDto;

public interface ReviewDao {

	public void insertReview(ReviewDto reviewDto) throws Exception;
	public List<ReviewDto> selectReviewList(int goodsCd) throws Exception;
	public int selectReviewCnt(int goodsCd) throws Exception;

}
