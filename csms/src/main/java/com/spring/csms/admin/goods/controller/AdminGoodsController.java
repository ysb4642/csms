package com.spring.csms.admin.goods.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.admin.goods.service.AdminGoodsService;
import com.spring.csms.goods.dto.GoodsDto;
import com.spring.csms.goods.service.GoodsService;

@Controller
@RequestMapping("/admin/goods")
public class AdminGoodsController {
	
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@Autowired
	private GoodsService goodsService;
	
	private static final String CURR_IMAGE_REPO_PATH = "/Users/ysb/file_repo";
	private static final String SEPERATOR = "/";	// mac
	
//	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
//	private static final String SEPERATOR = "\\";	// window

//	private static final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo";
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
	
	@RequestMapping(value="/goodsExcelExport" , method=RequestMethod.GET)
	public void goodsExcelExport(HttpServletResponse response , @RequestParam Map<String, String> dateMap) throws Exception {
		  
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		SimpleDateFormat dateSdf = new SimpleDateFormat("yyyy-MM-dd");
		String makeFileTime = fileSdf.format(new Date());
		String makeFileName = makeFileTime + "_goodsList.xls";
		
	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("상품리스트");
	    Row row = null;
	    Cell cell = null;

	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();
	    // 가는 경계선
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 노란색 배경
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    // 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품번호");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품이름");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("브랜드");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품가격");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("중량");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("유통기한");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("등록일자");

		for (GoodsDto goodsDto :  adminGoodsService.getGoodsList()) {
			row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(goodsDto.getGoodsCd());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(goodsDto.getGoodsNm());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(goodsDto.getBrand());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(goodsDto.getPrice());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(goodsDto.getCapacity());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(goodsDto.getExpiryDate());
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dateSdf.format(goodsDto.getEnrollDt()));
		} 

	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=" + makeFileName);

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
		
	}
	
	@RequestMapping(value = "/adminGoodsModify", method = RequestMethod.GET)
	public ModelAndView modifyGoods(@RequestParam("goodsCd") int goodsCd)throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/goods/adminGoodsModify");
		mv.addObject("goodsDto", goodsService.getGoodsDetail(goodsCd));
		
		return mv;
		
	}
	
	@RequestMapping(value="/adminGoodsModify" , method=RequestMethod.POST)
	public ResponseEntity<Object> adminGoodsModify(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		
		GoodsDto goodsDto = new GoodsDto();
		goodsDto.setGoodsCd(Integer.parseInt(multipartRequest.getParameter("goodsCd")));
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
			
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(CURR_IMAGE_REPO_PATH + SEPERATOR + uploadFileName);	
				uploadFile.transferTo(f); 
				goodsDto.setGoodsFileName(uploadFileName);
				
				new File(CURR_IMAGE_REPO_PATH + SEPERATOR + goodsService.getGoodsDetail(Integer.parseInt(multipartRequest.getParameter("goodsCd"))).getGoodsFileName()).delete();
				
			}
		}
		
		adminGoodsService.modifyGoods(goodsDto);
		
		String jsScript= "<script>";
			   jsScript += " alert('상품정보를 수정하였습니다.');";
			   jsScript +=" location.href='adminGoodsList';";
			   jsScript +="</script>";
			   
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
	
	@RequestMapping(value = "adminGoodsRemove", method=RequestMethod.GET)
	public ResponseEntity<Object> adminGoodsRemove(@RequestParam("goodsCd") int goodsCd) throws Exception {
		
		new File(CURR_IMAGE_REPO_PATH + SEPERATOR + goodsService.getGoodsDetail(goodsCd).getGoodsFileName()).delete();
		adminGoodsService.removeGoods(goodsCd);
		
		String jsScript= "<script>";
			   jsScript += " alert('등록된 상품을 삭제하였습니다.');";
			   jsScript +=" location.href='adminGoodsList';";
			   jsScript +="</script>";
		
	   HttpHeaders httpHeaders = new HttpHeaders();
	   httpHeaders.add("Content-Type", "text/html; charset=utf-8");
	   
	   return new ResponseEntity<Object>(jsScript, httpHeaders, HttpStatus.OK);
	}
	
	
}
