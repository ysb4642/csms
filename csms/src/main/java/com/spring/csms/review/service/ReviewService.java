package com.spring.csms.review.service;

import java.util.List;

import com.spring.csms.review.dto.ReviewDto;

public interface ReviewService {

	public void addReview(ReviewDto reviewDto) throws Exception;
	public List<ReviewDto> getReviewList(int goodsCd) throws Exception;
	public int getReviewCnt(int goodsCd) throws Exception;

}
