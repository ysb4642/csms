package com.spring.csms.admin.goods.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.admin.goods.service.AdminGoodsService;
import com.spring.csms.goods.dto.GoodsDto;

@Controller
@RequestMapping("/admin/goods")
public class AdminGoodsController {
	
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	private static final String CURR_IMAGE_REPO_PATH = "//Users//ysb//file_repo";
	private static final String SEPERATOR = "//";	// mac
	
//	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
//	private static final String SEPERATOR = "\\";	// window

//	private static final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat8/file_repo";
//	private static final String SEPERATOR = "/";		// linux
	
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
	
	@RequestMapping(value = "/adminGoodsAdd", method = RequestMethod.POST)
	public ResponseEntity<Object> adminGoodsAdd(MultipartHttpServletRequest multipartRequest)throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		GoodsDto goodsDto = new GoodsDto();
		goodsDto.setGoodsNm(multipartRequest.getParameter("goodsNm"));
		goodsDto.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
		goodsDto.setTaste(multipartRequest.getParameter("taste"));
		goodsDto.setExpiryDate(multipartRequest.getParameter("expiryDate"));
		goodsDto.setCapacity(multipartRequest.getParameter("capacity"));
		goodsDto.setDiscountRate(Integer.parseInt(multipartRequest.getParameter("discountRate")));
		goodsDto.setStock(Integer.parseInt(multipartRequest.getParameter("stock")));
		goodsDto.setBrand(multipartRequest.getParameter("brand"));
		goodsDto.setSort(multipartRequest.getParameter("sort"));
		goodsDto.setPoint(Integer.parseInt(multipartRequest.getParameter("point")));
		goodsDto.setDeliveryPrice(Integer.parseInt(multipartRequest.getParameter("deliveryPrice")));
		goodsDto.setExplain(multipartRequest.getParameter("explain"));
		
		Iterator<String> file = multipartRequest.getFileNames();
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(CURR_IMAGE_REPO_PATH + SEPERATOR + uploadFileName);	
				uploadFile.transferTo(f); 
				goodsDto.setGoodsFileName(uploadFileName);
			}
		}
		
		adminGoodsService.addNewGoods(goodsDto);
		
		String jsScript= "<script>";
			   jsScript += "alert('상품을 등록하였습니다.');";
			   jsScript += "location.href='adminGoodsList';";
			   jsScript += "</script>";
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
	
	
	
}
























