<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>

function formValidationCheck() {
	
	var adminId = document.form.adminId;
	if (adminId.value == "") {
		$("#adminIdMsg").html("<span style='color:red;'>아이디를 입력하세요.</span>");
		document.form.adminId.focus();
		return false;
	}
	$("#adminIdMsg").html("<span></span>");
	
	var passwd = document.form.passwd;
	if (passwd.value == "") {
		$("#passwordMsg").html("<span style='color:red;'>비밀번호를 입력하세요.</span>");
		document.form.passwd.focus();
		return false;
	}
	$("#passwordMsg").html("<span></span>");
	
	return true
	
}

</script>
</head>
<body>
	
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			관리자 로그인
		</h2>
	</section>
	
	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div align="center">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
					<form action="${contextPath }/admin/member/adminLogin" method="post" name="form" onsubmit="return formValidationCheck()">
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							관리자 로그인
						</h4>
						<div class="m-b-20">
							<div class="bor8 m-b-1 how-pos4-parent">
								<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" id="adminId" name="adminId" placeholder="아이디">
								<img class="how-pos4 pointer-none" src="${contextPath }/resources/bootstrap/images/icons/icon-email.png" alt="ICON">
							</div>
							<div align="left">
								<span id="adminIdMsg"></span>
							</div>
						</div>
						<div class="m-b-20">
							<div class="bor8 m-b-1 how-pos4-parent">
								<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="password" id="passwd" name="passwd" placeholder="비밀번호">
								<img class="how-pos4 pointer-none" src="${contextPath }/resources/bootstrap/images/icons/icon-email.png" alt="ICON">
							</div>
							<div align="left">
								<span id="passwordMsg"></span>
							</div>
						</div>
						<div align="center">
		    				<button type="submit" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>	
</body>
</html>