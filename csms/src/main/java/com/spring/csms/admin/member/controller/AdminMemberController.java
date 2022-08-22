package com.spring.csms.admin.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import com.spring.csms.admin.member.dto.AdminDto;
import com.spring.csms.admin.member.service.AdminMemberService;
import com.spring.csms.member.dto.MemberDto;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	public ModelAndView adminLogin() throws Exception {
		return new ModelAndView("/admin/member/adminLogin");
	}
	
	@RequestMapping(value="/adminLogin", method=RequestMethod.POST)
	public ResponseEntity<Object> adminLogin(AdminDto adminDto, HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		if (adminMemberService.adminLogin(adminDto)) {
			HttpSession session = request.getSession();
			session.setAttribute("adminId", adminDto.getAdminId());
			session.setAttribute("role", "admin");
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
	
	@RequestMapping(value="/adminMemberList", method=RequestMethod.GET)
	public ModelAndView adminMemberList() throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/member/adminMemberList");
		mv.addObject("memberList", adminMemberService.getMemberList());
		return mv;
	}
	
	@RequestMapping(value = "/memberExcelExport", method = RequestMethod.GET)
	public void memberExcelExport(HttpServletResponse response, @RequestParam Map<String, String> dateMap) throws Exception {
		
		SimpleDateFormat joinSdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		String makeFileTime = fileSdf.format(new Date());
		String makeFileName = makeFileTime + "_memberList.xls";
		
	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("회원리스트");
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
	    cell.setCellValue("회원아이디");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("회원이름");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("휴대폰번호");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("성별");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("포인트");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("가입일자");
	    
		for (MemberDto memberDto :  adminMemberService.getMemberList()) {
			row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDto.getMemberId());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDto.getMemberNm());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDto.getHp());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDto.getGender());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(memberDto.getPoint());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(joinSdf.format(memberDto.getJoinDt()));

		} 

	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename="+makeFileName);

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	}

}











