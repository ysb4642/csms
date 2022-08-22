package com.spring.csms.goods.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.goods.dto.GoodsDto;
import com.spring.csms.goods.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value = "/goodsDetail", method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goodsCd") int goodsCd) throws Exception {
		
		ModelAndView mv = new ModelAndView("/goods/goodsDetail");
		
		GoodsDto goodsDto = goodsService.getGoodsDetail(goodsCd);
		
		mv.addObject("goodsDto", goodsDto);
		
		return mv;
	}
	
	@RequestMapping(value = "/goodsList", method = RequestMethod.GET)
	public ModelAndView goodsList(@RequestParam Map<String, String> goodsListMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/goods/goodsList");
		mv.addObject("goodsList", goodsService.getGoodsList(goodsListMap));
		
		return mv;
	}
}
