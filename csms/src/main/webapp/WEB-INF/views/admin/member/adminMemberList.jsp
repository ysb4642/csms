<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			회원관리
		</h2>
	</section>	

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Shoping Cart
			</span>
		</div>
	</div>
		

	<!-- MemberList -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">회원 아이디</th>
									<th style="text-align: center;">회원 이름</th>
									<th style="text-align: center;">포인트</th>
									<th style="text-align: center;">가입일자</th>
								</tr>
								<c:choose>
									<c:when test="${empty memberList }">
										<tr>
											<td colspan="5" style="height: 50px; text-align: center;"><h5>가입된 회원이 없습니다.</h5></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="memberDto" items="${memberList }" varStatus="i">
											<tr>
												<td style="height: 50px; text-align: center;"><h6>${i.count }</h6></td>
												<td style="height: 50px; text-align: center;">
													<h6><a href="#<%-- ${contextPath }/myPage/myInfo?memberId=${memberDto.memberId} --%>">${memberDto.memberId }</a></h6>												
												</td>
												<td style="height: 50px; text-align: center;"><strong>${memberDto.memberNm }</strong></td>
												<td style="height: 50px; text-align: center;"><fmt:formatNumber value="${memberDto.point }"/>P</td>
												<td style="height: 50px; text-align: center;"><fmt:formatDate value="${memberDto.joinDt }" pattern="yyyy-MM-dd"/></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>