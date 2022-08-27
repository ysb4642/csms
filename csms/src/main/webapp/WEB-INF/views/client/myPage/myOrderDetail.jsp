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
			주문목록 상세
		</h2>
	</section>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-20 m-t-20">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
                            <thead>
                                <tr class="table_head">
                                    <th>상품명</th>
                                    <th width="21%">상품가격</th>
                                    <th width="21%">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;주문수량</th>
                                </tr>
                            </thead>
                            <tbody>
                           		 <tr>
                                 	<td>
                                        <div class="row">
                                        	<a href="${contextPath }/goods/goodsDetail?goodsCd=${myOrder.goodsCd}">
                                        	<img src="${contextPath }/thumbnails?goodsFileName=${myOrder.goodsFileName }" width="100" height="100">
                                        	</a>
                                            <h6>
                                            	<br><br>&emsp;&emsp;&emsp;
                                            	<a href="${contextPath }/goods/goodsDetail?goodsCd=${myOrder.goodsCd}">${myOrder.goodsNm }</a>
	                                          	<p>&emsp;&emsp;&emsp; ${myOrder.brand } / <fmt:formatNumber value="${myOrder.point }"/>p 적립</p>
                                            </h6>
                                        </div>
                                    </td>
                                    <td>
                                    	<div>
                                    		<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myOrder.price }"/></span><br>
	                                    	<fmt:formatNumber value="${myOrder.price -  myOrder.price * (myOrder.discountRate / 100)}"/>
                                    	</div>
                                    </td>
                                    <td align="center">
                                    	<div >
											<span>${myOrder.orderGoodsQty }</span>
										</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
						<div>
							
						</div>
							<div>
								<h5>Total <span><fmt:formatNumber value="${(myOrder.price - myOrder.price * myOrder.discountRate / 100) * myOrder.orderGoodsQty}"/>원</span></h5>
							</div>							
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="m-l-135"><h3>주문상세</h3></div>
	<section class="bg0 p-t-20 p-b-20">
		<div class="container">
			
				<div class="flex-w flex-tr">
					<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
						<h5 style="margin-right: 18%;">주문자 이름</h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="ordererNm" name="ordererNm" value="${myOrder.ordererNm }" disabled class="stext-121 cl2 plh3 size-116 p-lr-18">
						</div>
						<h5 style="margin-right: 17%;" class="m-t-20">주문자 연락처</h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="ordererHp" name="ordererHp" value="${myOrder.ordererHp }" disabled class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h5 style="margin-right: 13%;" class="m-t-20">받는분 이름</h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="receiverNm" name="receiverNm" value="${myOrder.receiverNm }" disabled class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h5 style="margin-right: 19%;" class="m-t-20">받는분 연락처</h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="receiverHp" name="receiverHp" value="${myOrder.receiverHp }" disabled class="stext-111 cl2 plh3 size-116 p-lr-18" >
						</div>
						<h5 style="margin-right: 19%;" class="m-t-20">결제방법</h5>
						<c:choose>
							<c:when test="${myOrder.payMethod eq 'card'}">
								<input type="text" id="payMethod" name="payMethod" value="카드결제" disabled class="stext-111 cl2 plh3 size-116 p-lr-18" >
							</c:when>
							<c:otherwise>
								<input type="text" id="payMethod" name="payMethod" value="휴대폰결제" disabled class="stext-111 cl2 plh3 size-116 p-lr-18" >
							</c:otherwise>
						</c:choose>
	                    <c:choose>
	                    	<c:when test="${myOrder.payMethod eq 'card'}">
	                    		<h5 style="margin-right: 19%;" class="m-t-20">카드회사</h5>
								<div class="bor19 size-218 m-b-1">
									<input type="text" id="cardCompanyNm" name="cardCompanyNm" value="${myOrder.cardCompanyNm }" disabled class="stext-111 cl2 plh3 size-116 p-lr-18" >
								</div>
								<h5 style="margin-right: 19%;" class="m-t-20">할부개월</h5>
								<c:choose>
									<c:when test="${myOrder.cardPayMonth == 0}">
										<div class="bor19 size-218 m-b-1">
											<input type="text" id="cardPayMonth" name="cardPayMonth" value="일시불" disabled class="stext-111 cl2 plh3 size-116 p-lr-18" >
										</div>
									</c:when>
									<c:otherwise>
										<div class="bor19 size-218 m-b-1">
											<input type="text" id="cardPayMonth" name="cardPayMonth" value="${myOrder.cardPayMonth }개월" disabled class="stext-111 cl2 plh3 size-116 p-lr-18" >
										</div>
									</c:otherwise>
								</c:choose>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<h5 style="margin-right: 19%;" class="m-t-20">결제 연락처</h5>
								<div class="bor19 size-218 m-b-1">
									<input type="text" id="paymyOrderHp" name="paymyOrderHp" value="${myOrder.ordererHp }" disabled class="stext-111 cl2 plh3 size-116 p-lr-18" >
								</div>
	                    	</c:otherwise>
	                    </c:choose>
					</div>
					<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
						<h5 style="margin-right: 19%;">배송방법</h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="deliveryMethod" name="deliveryMethod" value="${myOrder.deliveryMethod }" disabled class="stext-111 cl2 plh3 size-116 p-lr-18" >
						</div>
						<h5 style="margin-right: 17%;" class="m-t-20">배송메세지</h5>
	                    <div class="bor19 size-218 m-b-1">
	                  		<input type="text" id="deliveryMessage" name="deliveryMessage" value="${myOrder.deliveryMessage }" disabled class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
	                    <h5 style="margin-right: 19%;" class="m-t-20">배송상태</h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="deliveryStatus" name="payMethod" value="${myOrder.deliveryStatus }" disabled class="stext-111 cl2 plh3 size-116 p-lr-18" >
						</div>
						<h5 style="margin-right: 17%;" class="m-t-20">우편번호</h5>
						<div class="row">
							<div class="bor19 size-218" style="margin-left: 3.5%;">
								<input type="text" id="postalCode" name="postalCode" value="${myOrder.postalCode }" disabled class="stext-121 cl2 plh3 size-116 p-lr-18">
							</div>
						<input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%;" disabled class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
						</div>
						<h5 style="margin-right: 15%;" class="m-t-20">도로명 주소</h5>
						<div class="bor19 size-218">
							<input type="text" id="roadAddress" name="roadAddress" value="${myOrder.roadAddress }" disabled class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
						<h5 style="margin-right: 16%;" class="m-t-20">지번 주소</h5>
						<div class="bor19 size-218">
							<input type="text" id="parcelAddress" name="parcelAddress" value="${myOrder.parcelAddress }" disabled class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
						<h5 style="margin-right: 15%;" class="m-t-20">나머지 주소</h5>
						<div class="bor19 size-218">
							<input type="text" id="restAddress" name="restAddress" value="${myOrder.restAddress }" disabled class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
					</div>
				</div>
		</div>
	</section>

</body>
</html>