<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
	$().ready(function () {
		var total = 0;
		var countCartList = ${countCartList};
		
		for (var i = 0; i < countCartList; i++) {
			
			var headerPrice = Number($("#headerPrice"+i).val());
			var cartGoodsQty = Number($("#cartGoodsQty"+i).val());
			
			total += headerPrice * cartGoodsQty;
			
		}
		$("#total").html(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
	})

</script>
<title>Insert title here</title>
</head>
<body>

<header class="header-v3">
		<!-- Header desktop -->
		<div class="container-menu-desktop trans-03">
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop p-l-45">
					
					<!-- Logo desktop -->		
					<%-- <a href="#" >
						<span style="color:white" font-size="10pt">bonny cat</span>
						<img src="${contextPath }/resources/bootstrap/images/icons/logo-02.png" alt="IMG-LOGO">
					</a> --%>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="${contextPath }/">Home</a>
							</li>

							<li>
								<a href="${contextPath }/goods/goodsList?sort=all">Shop</a>
							</li>
							<c:choose>
								<c:when test="${sessionScope.role eq 'admin' }">
									<li>
										<a href="#">Management</a>
										<ul class="sub-menu">
											<li><a href="${contextPath }/admin/goods/adminGoodsList">Goods Management</a></li>
											<li><a href="${contextPath }/admin/member/adminMemberList">User Management</a></li>
											<li><a href="${contextPath }/admin/order/adminOrderList">Order Management</a></li>
											<li><a href="${contextPath }/contactList">Contact Management</a></li>
										</ul>
									</li>
									<li>
										<a href="${contextPath }/member/logout">logout</a>
									</li>
									
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${sessionScope.memberId eq null }">
											<li>
												<a href="${contextPath }/member/login">Login</a>
											</li>
				
											<li>
												<a href="${contextPath }/member/register">Register</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
												<a href="#">My Pages</a>
												<ul class="sub-menu">
													<li><a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}"><span class="lnr lnr-pencil" ></span>&emsp;My Info</a></li>
													<li><a href="${contextPath }/myPage/myCartList"><span class="lnr lnr-cart"></span>&emsp;My Cart</a></li>
													<li><a href="${contextPath }/myPage/myOrderList"><span class="lnr lnr-bubble"></span>&emsp;My Order</a></li>
												</ul>
											</li>
											<li>
												<a href="${contextPath }/member/logout">logout</a>
											</li>
										</c:otherwise>
									</c:choose>
									<li>
										<a href="${contextPath}/contact">Contact</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>	

								
					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m h-full">							
						<div class="flex-c-m h-full p-r-25 bor6">
							<c:choose>
								<c:when test="${sessionScope.role == 'client'}">
		                        	<div class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" data-notify="${countCartList }">
										<i class="zmdi zmdi-shopping-cart"></i>
									</div>
                               	</c:when>
                               	<c:otherwise>
                               		<div class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" data-notify="0">
										<i class="zmdi zmdi-shopping-cart"></i>
									</div>
                               	</c:otherwise>
							</c:choose>
						</div>
							
						<div class="flex-c-m h-full p-lr-19">
							<div class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 js-show-sidebar">
								<i class="zmdi zmdi-menu"></i>
							</div>
						</div>
					</div>
				</nav>
			</div>	
		</div>
		
		<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<c:if test="${sessionScope.memberId eq null}">
						<li>
							<c:choose>
								<c:when test="${sessionScope.role eq 'admin'}">
									<div>
										<h6>관리자 페이지입니다.</h6>
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<a href="${contextPath}/member/login" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
											<h6>로그인을 먼저 진행해주세요.</h6>
										</a>
									</div>
									<div align="center">
										<a href="${contextPath}/member/login" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
											Login
										</a>
									</div>
								</c:otherwise>
							</c:choose>
						</li>
					</c:if>
				
					<c:forEach var="myCart" items="${myCartList }" varStatus="i">
						<li class="header-cart-item flex-w flex-t m-b-12">
							<div class="header-cart-item-img">
								<a href="${contextPath }/goods/goodsDetail?goodsCd=${myCart.goodsCd}">
									<img src="${contextPath }/thumbnails?goodsFileName=${myCart.goodsFileName }" width="60" height="80" alt="IMG">
								</a>
							</div>
	
							<div class="header-cart-item-txt p-t-8">
								<a href="${contextPath }/goods/goodsDetail?goodsCd=${myCart.goodsCd}" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
									${myCart.goodsNm }
								</a>
	
								<span class="header-cart-item-info">
									${myCart.cartGoodsQty } x
									<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myCart.price }"/></span>
				                    <fmt:formatNumber value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}"/>원
				                    <input type="hidden" id="headerPrice${i.index }" value="${myCart.price -  myCart.price * (myCart.discountRate / 100)}">
				                    <input type="hidden" id="headerDiscountRate${i.index }" value="${myCart.discountRate}" />
				                    <input type="hidden" id="cartGoodsQty${i.index }" value="${myCart.cartGoodsQty}" />
								</span>
							</div>
						</li>
					
					</c:forEach>

				</ul>
				<c:if test="${sessionScope.memberId ne null}">
					<div class="w-full">
						<div class="header-cart-total w-full p-tb-40">
							Total: <span id="total"></span>
						</div>
	
						<div class="header-cart-buttons flex-w w-full">
							<a href="${contextPath }/myPage/myCartList" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
								View Cart
							</a>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="${contextPath }/resources/bootstrap/images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m h-full m-r-15">
				<div class="flex-c-m h-full p-r-5">
					<div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" data-notify="2">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>
				</div>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="main-menu-m">
				<li>
					<a href="index.html">Home</a>
					<ul class="sub-menu-m">
						<li><a href="index.html">Homepage 1</a></li>
						<li><a href="home-02.html">Homepage 2</a></li>
						<li><a href="home-03.html">Homepage 3</a></li>
					</ul>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="product.html">Shop</a>
				</li>

				<li>
					<a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
				</li>

				<li>
					<a href="blog.html">Login</a>
				</li>

				<li>
					<a href="about.html">Register</a>
				</li>

				<li>
					<a href="contact.html">Contact</a>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<button class="flex-c-m btn-hide-modal-search trans-04">
				<i class="zmdi zmdi-close"></i>
			</button>

			<form class="container-search-header">
				<div class="wrap-search-header">
					<input class="plh0" type="text" name="search" placeholder="Search...">

					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
				</div>
			</form>
		</div>
	</header>
</body>
</html>