<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
	$().ready(function(){
		
		getTotalPrice();
		
		$("[name='cartCd']").change(function(){
			getTotalPrice();
		});
		name="cartGoodsQty${myCart.cartCd }"
		$("[name='cartGoodsQty' + ${myCart.cartCd }]").change(function(){
			getTotalPrice();
		});
		
	});
	
	function getTotalPrice() {
		var totalPrice = 0;
		$("[name='cartCd']:checked").each(function(){
			var tempCartCd = $(this).val();
			totalPrice += Number($("#price" + tempCartCd).val()) * Number($("#cartGoodsQty" + tempCartCd).val());
		});
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
		$("#totalPrice").html(totalPrice);
	}
	
	function selectAllCart() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='cartCd']").prop("checked", true);
			getTotalPrice();
		}
		else {
			$("[name='cartCd']").prop("checked", false);
			getTotalPrice();
		}
	}
	
	function removeCart() {
		var cartCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			$("input[name='cartCd']:checked").each(function() {
				cartCdList += $(this).val() + ",";
			});
			location.href = "${contextPath}/myPage/removeCart?cartCdList=" + cartCdList;
		}
	}
	
	function modifyCartGoodsQty(cartCd){
		$.ajax({
			type : "get",
			url  : "${contextPath}/myPage/modifyCartGoodsQty",
			data : {
				"cartCd"       : cartCd,
				"cartGoodsQty" : $("#cartGoodsQty" + cartCd).val()
			},
			success:function(){
				getTotalPrice();
			}
		});
		
	}
	
	function processOrderCart() {
		var goodsCdList = "";
		var cartGoodsQtyList = "";
		var cartCdList = "";
		
		$("[name='cartCd']:checked").each(function() {
			var cartCd = $(this).val();
			var goodsCd = $("#goodsCd" + cartCd).val();
			var cartGoodsQty = $("#cartGoodsQty" + cartCd).val();
			
			goodsCdList += goodsCd + ",";
			cartGoodsQtyList += cartGoodsQty + ",";
			cartCdList += cartCd + ",";
		});
		
		if (goodsCdList == "") {
			alert("주문 목록이 없습니다.");
			return false;
		}
		
		var url = "${contextPath}/order/orderCartGoods";
	  		url += "?goodsCdList="+goodsCdList;
	   		url += "&cartGoodsQtyList="+cartGoodsQtyList;
	    	url += "&cartCdList="+cartCdList;
			
		location.href = url;
	}
</script>
</head>
<body>
	
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			장바구니
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
					<h6 class="row m-l-1 m-b-10"><input type="checkbox" id="changeAllChoice" onchange="selectAllCart()"> &nbsp;전체선택</h6>
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
                            <thead>
                                <tr class="table_head">
                                    <th width="5%"></th>
                                    <th>상품명</th>
                                    <th width="17%">상품가격</th>
                                    <th width="17%">&emsp;&emsp;&emsp;&ensp;주문수량</th>
                                    <th width="17%">&ensp;&emsp;등록일자</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myCartList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="myCart" items="${myCartList }">
		                            		 <tr>
		                            		 	<td align="center"><input type="checkbox" name="cartCd" value="${myCart.cartCd }" checked></td>
                                    			<td>
			                                        <div class="row">
			                                        	<img src="${contextPath }/thumbnails?goodsFileName=${myCart.goodsFileName }" width="100" height="100">
			                                            <h6>
			                                            	<br><br>&emsp;&emsp;&emsp;
			                                            	<a href="${contextPath }/goods/goodsDetail?goodsCd=${myCart.goodsCd}">${myCart.goodsNm }</a>
			                                            	<input type="hidden" id="goodsCd${myCart.cartCd }" value="${myCart.goodsCd }"/>
				                                          	<p>&emsp;&emsp;&emsp; ${myCart.brand } / ${myCart.point }p</p>
			                                            </h6>
			                                        </div>
			                                    </td>
			                                    <td>
			                                    	<div>
			                                    		<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myCart.price }"/></span><br>
				                                    	<fmt:formatNumber value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}"/>
														<input type="hidden" id="price${myCart.cartCd }" value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}">			                                    
			                                    	</div>
			                                    </td>
			                                    <td align="left">
			                                    	<div class="wrap-num-product flex-w m-r-20 m-b-10" onclick="modifyCartGoodsQty(${myCart.cartCd })" onchange="modifyCartGoodsQty(${myCart.cartCd })">
														<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
															<i class="fs-16 zmdi zmdi-minus"></i>
														</div>
				
														<input class="mtext-104 cl3 txt-center num-product" type="number" name="cartGoodsQty${myCart.cartCd }" id="cartGoodsQty${myCart.cartCd }" value="${myCart.cartGoodsQty }">
				
														<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
															<i class="fs-16 zmdi zmdi-plus"></i>
														</div>
													</div>
			                                    </td>
			                                    <td><h6><fmt:formatDate value="${myCart.enrollDt }" pattern="yyyy-MM-dd"/></h6></td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
					</div>
					<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<button class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" onclick="javascript:removeCart();">
								삭제
							</button>
							
							<div class="row">
								<div class="m-r-10">
									<h6>Cart Total</h6>
									<br>
									<ul>
										<li>Total <span id="totalPrice"></span></li>
									</ul>
								</div>
								<div>
									<button class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" onclick="javascript:processOrderCart()">
									주문하기
									</button>
								</div>							
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>