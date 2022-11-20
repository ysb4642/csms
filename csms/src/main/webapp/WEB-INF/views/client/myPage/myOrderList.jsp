<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			주문목록
		</h2>
	</section>
	
	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-50 m-t-20">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
                            <thead>
                                <tr class="table_head">
                                    <th>상품명</th>
                                    <th>상품가격</th>
                                    <th>주문날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myOrderList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="myOrder" items="${myOrderList }">
		                            		 <tr>
                                    			<td>
			                                        <div class="row">
			                                        	<a href="${contextPath }/myPage/myOrderDetail?orderCd=${myOrder.orderCd}&memberId=${myOrder.memberId}">
			                                        		<img src="${contextPath }/thumbnails?goodsFileName=${myOrder.goodsFileName }" width="100" height="100">
			                                        	</a>
			                                            <h6>
			                                            	<br><br>&emsp;&emsp;&emsp;
			                                            	<a href="${contextPath }/myPage/myOrderDetail?orderCd=${myOrder.orderCd}&memberId=${myOrder.memberId}">${myOrder.goodsNm }</a>
				                                          	<p>&emsp;&emsp;&emsp; ${myOrder.orderGoodsQty } 개</p>
			                                            </h6>
			                                        </div>
			                                    </td>
			                                    <td>
			                                    	<div>
			                                    		<fmt:formatNumber value="${myOrder.price }"/>원
			                                    	</div>
			                                    </td>
			                                    <td>
			                        				<div>
			                        					<fmt:formatDate value="${myOrder.payOrderTime }" pattern="yyyy-MM-dd"/>
			                        				</div>
			                                    </td>
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