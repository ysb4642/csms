package com.spring.csms.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.csms.review.dao.ReviewDao;
import com.spring.csms.review.dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void addReview(ReviewDto reviewDto) throws Exception {
		reviewDao.insertReview(reviewDto);
	}

	@Override
	public List<ReviewDto> getReviewList(int goodsCd) throws Exception {
		return reviewDao.selectReviewList(goodsCd);
	}

	@Override
	public int getReviewCnt(int goodsCd) throws Exception {
		return reviewDao.selectReviewCnt(goodsCd);
	}

}
