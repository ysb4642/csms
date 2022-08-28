<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			contact Detail
		</h2>
	</section>
	
	<section class="bg0 p-t-50 p-b-50">
		<div class="container">
			<div align="center">
					<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							contact Detail
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input type="text" value="${contactDto.email }" disabled class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">
							<img class="how-pos4 pointer-none" src="${contextPath }/resources/bootstrap/images/icons/icon-email.png" alt="ICON">
						</div>
						
						<div class="bor8 m-b-20 how-pos4-parent">
							<input type="text" value="${contactDto.subject }" disabled class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">
							<img class="how-pos4 pointer-none" src="${contextPath }/resources/bootstrap/images/icons/icon-email.png" alt="ICON">
						</div>

						<div class="bor8 m-b-30">
							<textarea disabled class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25">${contactDto.content }</textarea>
						</div>

					</div>
			</div>
		</div>
	</section>
	
</body>
</html>