<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<aside class="wrap-sidebar js-sidebar">
		<div class="s-full js-hide-sidebar"></div>

		<div class="sidebar flex-col-l p-t-22 p-b-25">
			<div class="flex-r w-full p-b-30 p-r-27">
				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-sidebar">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="sidebar-content flex-w w-full p-lr-65 js-pscroll">
				<ul class="sidebar-link w-full">
					<li class="p-b-13">
						<a href="${contextPath }/" class="stext-102 cl2 hov-cl1 trans-04">
							Home
						</a>
					</li>

					<li class="p-b-13">
						<a href="${contextPath }/myPage/myCartList" class="stext-102 cl2 hov-cl1 trans-04">
							My Cart
						</a>
					</li>

					<li class="p-b-13">
						<a href="${contextPath }/myPage/myOrderList" class="stext-102 cl2 hov-cl1 trans-04">
							My Order
						</a>
					</li>

					<li class="p-b-13">
						<a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}" class="stext-102 cl2 hov-cl1 trans-04">
							My Info
						</a>
					</li>

					<li class="p-b-13">
						<a href="${contextPath}/contact" class="stext-102 cl2 hov-cl1 trans-04">
							Contact
						</a>
					</li>

				</ul>
				<div class="sidebar-gallery w-full p-tb-30">
					<span class="mtext-101 cl5">
						@ bonny cat
					</span>
				</div>
				<div class="sidebar-gallery w-full">
					<span class="mtext-101 cl5">
						About Us
					</span>
					<p class="stext-108 cl6 p-t-27">
						'bonny cat'은 반려동물 용품 업계의 전문가들이 모여 탄생한 오직 고양이와 집사님들만을 위한 고양이용품 전문 쇼핑몰입니다.
						‘bonny cat’은 업계 시장의 성장과 함께한 전문가들인 만큼 집사님들과 고양이들에게 필요한 것과 또 부족한것이 무엇인지 잘 알고 있다고 자부합니다.
						앞으로도 계속해서 좋은 물건과 좋은 가격으로 고객 여러분들께 보답하도록 노력하겠습니다. 
					</p>
				</div>
			</div>
		</div>
	</aside>
</body>
</html>