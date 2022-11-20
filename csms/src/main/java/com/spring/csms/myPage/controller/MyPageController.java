package com.spring.csms.myPage.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.member.dto.MemberDto;
import com.spring.csms.myPage.dto.CartDto;
import com.spring.csms.myPage.service.MyPageService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public ModelAndView myInfo(@RequestParam("memberId") String memberId) throws Exception  {
		
		ModelAndView mv = new ModelAndView("/myPage/myInfo");
		
		mv.addObject("memberDto", myPageService.getMyInfo(memberId));
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		return mv;
				
	}
	
	@RequestMapping(value = "/modifyInfo", method = RequestMethod.POST)
	public ResponseEntity<Object> modifyInfo(MemberDto memberDto, HttpServletRequest request) throws Exception {
		
		myPageService.modifyMyInfo(memberDto);
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
			   jsScript += " alert('수정되었습니다.');";
			   jsScript += " location.href='" + request.getContextPath() + "/myPage/myInfo?memberId=" + memberDto.getMemberId() +  "';";
			   jsScript += " </script>";
			   
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/removeMember", method = RequestMethod.GET)
	public ResponseEntity<Object> removeMember(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		if (((String)session.getAttribute("role")).equals("client")) {
			session.invalidate();
		}
		
		myPageService.removeMember(request.getParameter("memberId"));
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
			   jsScript += "alert('탈퇴되었습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/';";
			   jsScript += "</script>";
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	public ResponseEntity<Object> addCart(@RequestParam("goodsCd") int goodsCd, @RequestParam("cartGoodsQty") int cartGoodsQty, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		CartDto cartDto = new CartDto();
		cartDto.setMemberId((String)session.getAttribute("memberId"));
		cartDto.setGoodsCd(goodsCd);
		cartDto.setCartGoodsQty(cartGoodsQty);
		
		String result = "duple";
		if (!myPageService.checkDuplicatedCart(cartDto)) {
			myPageService.addCart(cartDto);
			result = "notDuple";
		}
		
		return new ResponseEntity<Object>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/myCartList", method = RequestMethod.GET)
	public ModelAndView myCartList(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("/cart/myCartList");
		
		String memberId = (String)session.getAttribute("memberId");
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		return mv;
	}
	
	@RequestMapping(value = "/removeCart", method = RequestMethod.GET)
	public ResponseEntity<Object> removeCart(@RequestParam("cartCdList") String cartCdList) throws Exception {
		
		String[] temp = cartCdList.split(",");
		int[] deleteCartCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			deleteCartCdList[i] = Integer.parseInt(temp[i]);
		}
		myPageService.removeCart(deleteCartCdList);
		
		String jsScript = "<script>";
			   jsScript += "alert('장바구니 품목이 삭제되었습니다.');";
			   jsScript += "location.href = 'myCartList';";
			   jsScript += "</script>";
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value = "/modifyCartGoodsQty", method = RequestMethod.GET)
	public ResponseEntity<Object> modifyCartGoodsQty(@RequestParam Map<String, Object> updateMap) throws Exception {
		myPageService.modifyCartGoodsQty(updateMap);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/myOrderList", method = RequestMethod.GET)
	public ModelAndView myOrderList(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		ModelAndView mv = new ModelAndView("/myPage/myOrderList");
		
		mv.addObject("myOrderList", myPageService.getMyOrderList(memberId));
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		return mv;
	}
	
	@RequestMapping(value = "/myOrderDetail", method = RequestMethod.GET)
	public ModelAndView myOrderDetail(@RequestParam Map<String, Object> orderDetailMap, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		ModelAndView mv = new ModelAndView("/myPage/myOrderDetail");
		
		mv.addObject("myOrder", myPageService.getMyOrderDetail(orderDetailMap));
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		return mv;
		
	}
}
