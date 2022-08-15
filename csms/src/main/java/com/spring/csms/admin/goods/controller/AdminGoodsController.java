package com.spring.csms.admin.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.admin.goods.service.AdminGoodsService;

@Controller
@RequestMapping("/admin/goods")
public class AdminGoodsController {
	
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@RequestMapping(value = "/adminGoodsList", method = RequestMethod.GET)
	public ModelAndView adminGoodsList() throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/goods/adminGoodsList");
		
		mv.addObject("goodsList", adminGoodsService.getGoodsList());
		
		return mv;
	}
	
	@RequestMapping(value = "/adminGoodsAdd", method = RequestMethod.GET)
	public String adminGoodsAdd() {
		return "/admin/goods/adminGoodsAdd";
	}
	
	
	
}
