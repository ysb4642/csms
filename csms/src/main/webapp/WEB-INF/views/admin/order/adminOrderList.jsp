<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			관리자 주문 관리
		</h2>
	</section>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-50 m-t-20">
				<div align="right">
					<button type="button" style="width:10%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer" onclick="location.href='${contextPath}/admin/order/orderExcelExport'">
						EXCEL
					</button>
				</div>
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<h6 class="row m-l-1 m-b-10"><input type="checkbox" id="changeAllChoice" onchange="selectAllCart()"> &nbsp;전체선택</h6>
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
                            <thead>
                                <tr class="table_head">
                                    <th width="70%">주문정보</th>
                                    <th width="10%">주문자</th>
                                    <th width="10%">주문날짜</th>
                                    <th width="10%">배송상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty orderList}">
                            			<tr align="center">
                            				<td colspan="4"><h5>주문내역이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="order" items="${orderList }">
		                            		 <tr>
                                    			<td>
			                                        <div class="row">
			                                        	<a href="${contextPath }/myPage/myOrderDetail?orderCd=${order.orderCd}&memberId=${order.memberId}">
			                                        		<img src="${contextPath }/thumbnails?goodsFileName=${order.goodsFileName }" width="100" height="100">
			                                        	</a>
			                                            <h6>
			                                            	<br><br>&emsp;&emsp;&emsp;
			                                            	<a href="${contextPath }/myPage/myOrderDetail?orderCd=${order.orderCd}&memberId=${order.memberId}">${order.goodsNm }</a><br>
				                                          	&emsp;&emsp;&emsp; ${order.brand }<br>
		                                            		&emsp;&emsp;&emsp; 상품가격 : <fmt:formatNumber value="${order.price }"/> 원 / 주문수량 : ${order.orderGoodsQty }개
			                                            </h6>
			                                        </div>
			                                    </td>
			                                    <td><h6><strong>${order.memberId }</strong></h6></td>
			                                    <td><h6><fmt:formatDate value="${order.payOrderTime }" pattern="yyyy-MM-dd"/></h6></td>
			                                    <td><h6>${order.deliveryStatus }</h6></td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>