<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
	function formValidationCheck() {
		var email = $("[name='email']").val();
		var content = $("[name='content']").val();
		var subject = $("[name='subject']").val();
		
		if (email == "") {
			alert("이메일을 입력해주세요.");
			document.form.email.focus();
			return false;
		}
		if (subject == "") {
			alert("제목을 입력해주세요.");
			document.form.subject.focus();
			return false;
		}
		if (content == "") {
			alert("내용을 입력해주세요.");
			document.form.content.focus();
			return false;
		}
	}

</script>
<title>Insert title here</title>
</head>
<body>
	
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			contact
		</h2>
	</section>
	
	<section class="bg0 p-t-104 p-b-50">
		<div class="container">
			<div class="flex-w flex-tr">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
					<form action="${contextPath }/contact" method="post" name="form" onsubmit="return formValidationCheck()">
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							Send Us A Message
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input type="text" name="email" placeholder="이메일을 입력하세요." class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">
							<img class="how-pos4 pointer-none" src="${contextPath }/resources/bootstrap/images/icons/icon-email.png" alt="ICON">
						</div>
						
						<div class="bor8 m-b-20 how-pos4-parent">
							<input type="text" name="subject" placeholder="제목을 입력하세요." class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">
							<img class="how-pos4 pointer-none" src="${contextPath }/resources/bootstrap/images/icons/icon-email.png" alt="ICON">
						</div>

						<div class="bor8 m-b-30">
							<textarea name="content" placeholder="무엇을 도와드릴까요?" class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25"></textarea>
						</div>

						<button type="submit" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							등록하기
						</button>
					</form>
				</div>

				<div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
					<div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-map-marker"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Address
							</span>

							<p class="stext-115 cl6 size-213 p-t-18">
								서울특별시 강남구 강남대로94길 13, 삼경빌딩 1층~5층
							</p>
						</div>
					</div>

					<div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-phone-handset"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Lets Talk
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								02-588-9991
							</p>
						</div>
					</div>

					<div class="flex-w w-full">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-envelope"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Sale Support
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								ysb4642@gmail.com
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
		<!-- 지도 -->
	<div id="daumRoughmapContainer1600749162322" class="mymap root_daum_roughmap root_daum_roughmap_landing os_mac" align="center" style="z-index: 2; width: 450px;">
	
		<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
		<script charset="UTF-8" src="http://t1.daumcdn.net/kakaomapweb/place/jscss/roughmap/b88f2e2f/roughmapLander.js"></script>
		<script charset="UTF-8" src="http://t1.daumcdn.net/kakaomapweb/place/jscss/roughmap/b88f2e2f/roughmapLander.js"></script>
		<!-- 3. 실행 스크립트 -->
		<script charset="UTF-8">
			new daum.roughmap.Lander({
				"timestamp" : "1600749162322",
				"key" : "226ga",
				"mapWidth" : "1440",
				"mapHeight" : "390"
			}).render();
		</script>
	</div>

</body>
</html>