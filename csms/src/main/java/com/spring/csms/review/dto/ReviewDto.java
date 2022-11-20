package com.spring.csms.review.dto;

import java.util.Date;

public class ReviewDto {
	private int reviewCd;
	private int goodsCd;
	private String memberId;
	private int rating;
	private String content;
	private Date enrollDt;
	
	public int getReviewCd() {
		return reviewCd;
	}
	public void setReviewCd(int reviewCd) {
		this.reviewCd = reviewCd;
	}
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
}
