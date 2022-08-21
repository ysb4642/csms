package com.spring.csms.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		return mv;
				
	}
}
