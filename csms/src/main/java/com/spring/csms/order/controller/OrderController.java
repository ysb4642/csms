package com.spring.csms.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.goods.dto.GoodsDto;
import com.spring.csms.myPage.service.MyPageService;
import com.spring.csms.order.dto.OrderDto;
import com.spring.csms.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value = "/orderCartGoods", method = RequestMethod.GET)
	public ModelAndView orderCartGoods(@RequestParam("goodsCdList") String goodsCds,
									@RequestParam("cartGoodsQtyList") String cartGoodsQtyList,
									@RequestParam("cartCdList") String cartCdList,
									HttpServletRequest request) throws Exception {
		
		String[] temp = goodsCds.split(",");
		int[] goodsCdList = new int[temp.length];
		for (int i = 0; i < goodsCdList.length; i++) {
			goodsCdList[i] = Integer.parseInt(temp[i]);
		}
		
		ModelAndView mv = new ModelAndView("/order/orderCartGoods");
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		Map<String, Object> orderCartMap = new HashMap<String, Object>();
		orderCartMap.put("goodsCdList", goodsCdList);
		orderCartMap.put("memberId", memberId);
		
		List<GoodsDto> goodsList = orderService.getGoodsListByCart(orderCartMap);
		
		mv.addObject("orderer", orderService.getOrdererDetail(memberId));
		mv.addObject("goodsList", goodsList);
		mv.addObject("orderGoodsQtyList", cartGoodsQtyList);
		mv.addObject("goodsCdList", goodsCds);
		mv.addObject("cartCdList", cartCdList);
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		return mv;
		
	}
	
	@RequestMapping(value = "/orderCartGoods", method = RequestMethod.POST)
	public ResponseEntity<Object> orderCartGoods(@RequestParam Map<String, String> orderListMap, HttpServletRequest request) throws Exception {
		
		orderService.addOrderByCart(orderListMap);
		
		String jsScript = "<script>";
			   jsScript += "alert('????????? ?????????????????????.');";
			   jsScript += "location.href='" + request.getContextPath() + "/myPage/myOrderList'";
			   jsScript +="</script>";
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/orderGoods", method = RequestMethod.GET)
	public ModelAndView orderGoods(@RequestParam("goodsCd") int goodsCd, @RequestParam("orderGoodsQty") int orderGoodsQty, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/order/orderGoods");
		
		HttpSession session = request.getSession();
		
		String memberId = (String)session.getAttribute("memberId");
		
		mv.addObject("orderer", orderService.getOrdererDetail(memberId));
		mv.addObject("goodsDto", orderService.getGoodsDetail(goodsCd));
		mv.addObject("orderGoodsQty", orderGoodsQty);
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		return mv;
	}
	
	@RequestMapping(value = "/orderGoods", method = RequestMethod.POST)
	public ResponseEntity<Object> orderGoods(OrderDto orderDto, @RequestParam("point") int point,  HttpServletRequest request) throws Exception{
		
		orderService.addOrder(orderDto , point);
		
		String jsScript = "<script>";
			   jsScript += "alert('????????? ?????????????????????.');";
			   jsScript += "location.href='" + request.getContextPath() + "/myPage/myOrderList'";
			   jsScript += "</script>";
		
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
	
}
