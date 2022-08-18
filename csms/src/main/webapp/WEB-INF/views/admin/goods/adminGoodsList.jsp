<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
</head>
<body class="animsition">

	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			상품리스트
		</h2>
	</section>	
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${contextPath }/" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				상품리스트
			</span>
		</div>
	</div>
		
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
							<tr class="table_head">
								<th style="text-align: center;">코드</th>
								<th style="text-align: center;">상품 정보</th>
								<th style="text-align: center;">등록날짜</th>
								<th style="text-align: center;">수정 / 삭제</th>
							</tr>
	
							<c:choose>
								<c:when test="${empty goodsList }">
									<tr>
										<td colspan="5" style="height: 50px; text-align: center;"><h5>등록된 상품이 없습니다.</h5></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="goodsDto" items="${goodsList }" varStatus="i">
										<tr>
											<td style="height: 50px; text-align: center;"><h6>${goodsDto.goodsCd }</h6></td>
											<td>
												<div class="row">
													<a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">
														<img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="IMG" width="100" height="100" class="m-l-100">
													</a>
		                                            <div class="m-t-25 m-l-60">
			                                            <h6><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsNm }</a></h6>
			                                        	<p>${goodsDto.sort} | ${goodsDto.brand} | <fmt:formatNumber value="${goodsDto.price }"/>원</p>
		                                            </div>
		                                    	</div>
											</td>
											<td style="height: 50px; text-align: center;"><fmt:formatDate value="${goodsDto.enrollDt }" pattern="yyyy-MM-dd"/></td>
											<td style="height: 50px; text-align: center;">
												<a href="${contextPath }/admin/goods/adminGoodsModify?goodsCd=${goodsDto.goodsCd}">
													<span class="fs-18 cl5 txt-center size-211">
														<span class="lnr lnr-pencil"></span>
													</span>
												</a> &ensp;
		                                		<a href="javascript:adminGoodsRemove(${goodsDto.goodsCd });">
		                                			<span class="fs-18 cl5 txt-center size-211">
														<span class="lnr lnr-trash"></span>
													</span>
		                                		</a>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<button class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" onclick="location.href='${contextPath}/admin/goods/goodsExcelExport'">
								EXCEL
							</button>
							<button class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" onclick="location.href='${contextPath}/admin/goods/adminGoodsAdd'">
								등록
							</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>