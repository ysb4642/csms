package com.spring.csms.member.controller;


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
import com.spring.csms.member.service.MemberService;
import com.spring.csms.myPage.service.MyPageService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/login" , method = RequestMethod.GET)
	public ModelAndView login() throws Exception {
		return new ModelAndView("/member/login");
	}
	
	@RequestMapping(value="/login" , method = RequestMethod.POST)
	public ResponseEntity<Object> login(MemberDto memberDto, HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		if (memberService.login(memberDto)) {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberDto.getMemberId());
			session.setAttribute("role", "client");
			session.setMaxInactiveInterval(60 * 30);
			
			jsScript  = "<script>";
			jsScript += " alert('로그인 되었습니다.');";
			jsScript += " location.href='" + request.getContextPath() + "/';";
			jsScript += " </script>";
			
		}
		else {
			jsScript  = "<script>";
			jsScript += " alert('아이디와 비밀번호를 확인하세요.');";
			jsScript += " history.go(-1);";
			jsScript += " </script>";
		}
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value="/register" , method = RequestMethod.GET)
	public ModelAndView register() throws Exception {
		return new ModelAndView("/member/register");
	}
	
	@RequestMapping(value="/register" , method = RequestMethod.POST)
	public ResponseEntity<Object> register(MemberDto memberDto, HttpServletRequest request) throws Exception {
		
		memberService.addMember(memberDto);
		
		String jsScript = "<script>";
			   jsScript += "alert('회원가입 되었습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/';";
			   jsScript += "</script>";
			  
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/checkDuplicatedId", method = RequestMethod.GET)
	public ResponseEntity<Object> checkDuplicatedId(@RequestParam("memberId") String memberId) throws Exception {
		return new ResponseEntity<Object>(memberService.checkDuplicatedId(memberId), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ResponseEntity<Object> logout(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript = "<script>";
		   	   jsScript += "alert('로그아웃 되었습니다.');";
		   	   jsScript += "location.href='" + request.getContextPath() + "/';";
		   	   jsScript += "</script>";
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK); 
	}
}
