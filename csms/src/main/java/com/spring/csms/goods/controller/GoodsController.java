package com.spring.csms.goods.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.goods.dto.GoodsDto;
import com.spring.csms.goods.service.GoodsService;
import com.spring.csms.myPage.service.MyPageService;
import com.spring.csms.review.service.ReviewService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/goodsDetail", method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goodsCd") int goodsCd, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("/goods/goodsDetail");
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		GoodsDto goodsDto = goodsService.getGoodsDetail(goodsCd);
		mv.addObject("goodsDto", goodsDto);
		
		Map<String, Object> goodsMap = new HashMap<>();
		goodsMap.put("sort", goodsDto.getSort());
		goodsMap.put("goodsCd", goodsCd);
		mv.addObject("relatedGoodsList", goodsService.getRelatedGoodsList(goodsMap));
		
		mv.addObject("reviewList", reviewService.getReviewList(goodsCd));
		mv.addObject("reviewCnt", reviewService.getReviewCnt(goodsCd));
		return mv;
	}
	
	@RequestMapping(value = "/goodsList", method = RequestMethod.GET)
	public ModelAndView goodsList(@RequestParam Map<String, String> goodsListMap, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		ModelAndView mv = new ModelAndView("/goods/goodsList");

		mv.addObject("goodsList", goodsService.getGoodsList(goodsListMap));
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		return mv;
	}
	
	@RequestMapping(value="/searchGoods", method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("searchGoods") String searchGoods, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		ModelAndView mv = new ModelAndView("/goods/goodsList");
		mv.addObject("goodsList", goodsService.getSearchGoodsList(searchGoods));
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		return mv;
	}
}
