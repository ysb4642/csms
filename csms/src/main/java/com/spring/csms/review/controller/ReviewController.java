package com.spring.csms.review.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.csms.review.dto.ReviewDto;
import com.spring.csms.review.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/addReview", method = RequestMethod.GET)
	public ResponseEntity<Object> addReview(@RequestParam("rating") int rating, @RequestParam("content") String content,
											@RequestParam("goodsCd") int goodsCd, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setGoodsCd(goodsCd);
		reviewDto.setMemberId(memberId);
		reviewDto.setRating(rating);
		reviewDto.setContent(content);
		
		reviewService.addReview(reviewDto);
		
		String jsScript = "";
		
		jsScript  = "<script>";
		jsScript += " alert('리뷰를 등록하였습니다.');";
		jsScript += " history.go(-1);";
		jsScript += " </script>";
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
}
