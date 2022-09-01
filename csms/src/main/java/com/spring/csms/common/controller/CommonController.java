package com.spring.csms.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.common.dto.ContactDto;
import com.spring.csms.common.service.CommonService;
import com.spring.csms.goods.service.GoodsService;
import com.spring.csms.myPage.service.MyPageService;

import net.coobird.thumbnailator.Thumbnails;


@Controller
public class CommonController {
	
//	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
//	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value = "/",  method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		ModelAndView mv = new ModelAndView("/index");
		
		Map<String, String> goodsListMap = new HashedMap<>();
		goodsListMap.put("sort", "all");
		
		mv.addObject("goodsList", goodsService.getGoodsList(goodsListMap));
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		return mv;
	}
	
	
	private static final String CURR_IMAGE_REPO_PATH = "/Users/ysb/file_repo";
	private static final String SEPERATOR = "/";	// mac
	
//	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
//	private static final String SEPERATOR = "\\";	// window

//	private static final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo";
//	private static final String SEPERATOR = "/";		// linux
	
	@RequestMapping(value = "/thumbnails", method = RequestMethod.GET)
	public void thumbnails(@RequestParam("goodsFileName") String goodsFileName, HttpServletResponse response) throws IOException {
			
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + SEPERATOR + goodsFileName;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView contact(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		ModelAndView mv = new ModelAndView("/contact");
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		
		
		return mv;
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	public ResponseEntity<Object> contact(ContactDto contactDto, HttpServletRequest request) throws Exception {
		
		commonService.addNewContact(contactDto);
		
		String jsScript  = "<script>";
			   jsScript += "alert('contact가 등록 되었습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/';";
			   jsScript += "</script>";
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/contactList" , method=RequestMethod.GET)
	public ModelAndView contactList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		
		ModelAndView mv = new ModelAndView("/contactList");
		mv.addObject("contactList", commonService.getContactList());
		mv.addObject("myCartList", myPageService.getMyCartList(memberId));
		mv.addObject("countCartList", myPageService.countCartList(memberId));
		return mv;
	}
	
	@RequestMapping(value="/contactDetail" , method=RequestMethod.GET)
	public ModelAndView contactDetail(@RequestParam("contactCd") int contactCd) throws Exception{
		
		ModelAndView mv = new ModelAndView("/contactDetail");
		mv.addObject("contactDto", commonService.getContactDetail(contactCd));
		
		return mv;
	}
	
	@RequestMapping(value="/removeContact", method=RequestMethod.GET)
	public ResponseEntity<Object> removeContact(@RequestParam("contactCdList") String contactCdList) throws Exception {
		
		String[] temp = contactCdList.split(",");
		int[] deleteContactCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			deleteContactCdList[i] = Integer.parseInt(temp[i]);
		}
		
		commonService.removeContact(deleteContactCdList);
		
		String jsScript = "<script>";
			   jsScript += "alert('contact 정보를 삭제하였습니다.'); ";
			   jsScript += "location.href='contactList';";
			   jsScript += "</script>";
			   
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
		
	}
}


















