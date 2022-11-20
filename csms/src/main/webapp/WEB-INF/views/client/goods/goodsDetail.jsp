<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>

	function processToCart(goodsCd) {
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			$.ajax({
				url : "${contextPath }/myPage/addCart",
				method : "get",
				data : {"goodsCd" : goodsCd , "cartGoodsQty" : $("#cartGoodsQty").val()},
				success : function(result) {
					
					if (result == "duple") {
						alert('이미 추가된 품목입니다.');
					}
					else {
						alert('장바구니에 추가되었습니다.');
					}
					
				}
			})
		}
	}
	
	function processToOrder(goodsCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			location.href = "${contextPath }/order/orderGoods?goodsCd="+goodsCd+"&orderGoodsQty="+$("#cartGoodsQty").val();
		}
	}
	
	function addReview() {
		var content = $("[name='content']").val();
		if (content == "") {
			alert("리뷰를 입력하세요");
			$("[name='content']").focus();
			return false;
		}
		location.href = "${contextPath }/review/addReview?rating=" + $("[name='rating']").val() + "&content="+content +"&goodsCd=" + ${goodsDto.goodsCd};
		
	}
	
	
	

</script>
</head>
<body>
	
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			상품 상세
		</h2>
	</section>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${contextPath }/" class="stext-109 cl8 hov-cl1 trans-04">
				HOME
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="${contextPath }/admin/goods/adminGoodsList" class="stext-109 cl8 hov-cl1 trans-04">
				상품리스트
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				${goodsDto.goodsNm }
			</span>
		</div>
	</div>
		

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
									<div class="wrap-pic-w pos-relative">
										<img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
									<div class="wrap-pic-w pos-relative">
										<img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
									<div class="wrap-pic-w pos-relative">
										<img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail">
							${goodsDto.goodsNm } <br>
						</h4>
						<div class="product__details__price"><fmt:formatNumber value="${goodsDto.price - (goodsDto.price * goodsDto.discountRate / 100)}" /><span><fmt:formatNumber value="${goodsDto.price }"/></span></div>
							<div class="flex-w flex-l-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-b-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input class="mtext-104 cl3 txt-center num-product" type="number" name="cartGoodsQty" id="cartGoodsQty" value="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
									<div class="row">
										<button onclick="processToCart(${goodsDto.goodsCd })" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 m-r-10">
											Add to cart
										</button>
										<button onclick="processToOrder(${goodsDto.goodsCd })" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
											Order
										</button>
									</div>
								</div>
						<div class="col-sm-10 col-md-8 col-lg-6 m-t-20">
							<ul>
								<c:if test="${goodsDto.taste ne null}">
	                                <li>
	                                    <span class="stext-102 cl3 size-205">맛 : ${goodsDto.taste }</span>
	                                </li>
								</c:if>
								<c:if test="${goodsDto.capacity ne null}">
	                                <li>
	                                    <span class="stext-102 cl3 size-205">중량 : ${goodsDto.capacity }</span>
	                                </li>
                                </c:if>
                                <li>
                                    <span class="stext-102 cl3 size-205">할인율 : ${goodsDto.discountRate }%</span>
                                </li>
                                <li>
                                    <span class="stext-102 cl3 size-205">포인트 : ${goodsDto.point }P</span>
                                </li>
                                <li>
                                    <span class="stext-102 cl3 size-205">배송비 : ${goodsDto.deliveryPrice }원</span>
                                </li>
                            </ul>
						</div>
					</div>	
						
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">Description</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">Additional information</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#reviews" role="tab">Reviews (${reviewCnt })</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">
									${goodsDto.explain }
								</p>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												브랜드
											</span>

											<span class="stext-102 cl6 size-206">
												${goodsDto.brand }
											</span>
										</li>
										<c:if test="${goodsDto.expiryDate ne null}">
											<li class="flex-w flex-t p-b-7">
												<span class="stext-102 cl3 size-205">
													유통기한
												</span>
	
												<span class="stext-102 cl6 size-206">
													${goodsDto.expiryDate } 이후
												</span>
											</li>
										</c:if>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												재고
											</span>

											<span class="stext-102 cl6 size-206">
												${goodsDto.stock }개
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												등록일
											</span>

											<span class="stext-102 cl6 size-206">
												<fmt:formatDate value="${goodsDto.enrollDt }" pattern="yyyy-MM-dd"/>
											</span>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<div class="flex-w flex-t p-b-68">
											<c:forEach var="reviewDto" items="${reviewList }">
												<div class="size-207">
													<div class="flex-w flex-sb-m p-b-1">
														<span class="mtext-107 cl2 p-r-20">
															${reviewDto.memberId }
														</span>
														
														<span class="fs-18 cl11">
															<c:forEach var="i" begin="1" end="${reviewDto.rating }">
																<i class="zmdi zmdi-star"></i>
															</c:forEach>
														</span>
													</div>
													<p class="stext-102 cl6">
														${reviewDto.content }
													</p>
												</div>
											</c:forEach>
										</div>
										
										<!-- Add review -->
											<h5 class="mtext-108 cl2 p-b-7">
												Add a review
											</h5>
											
											<c:choose>
												<c:when test="${sessionId eq null}">
														<h4>로그인을 먼저 해주세요.</h4>
													<a href="${contextPath}/member/login" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
														Login
													</a>
												</c:when>
												<c:otherwise>
														<div class="flex-w flex-m p-t-50 p-b-23">
															<span class="stext-102 cl3 m-r-16">
																Your Rating
															</span>
			
															<span class="wrap-rating fs-18 cl11 pointer">
																<i class="item-rating pointer zmdi zmdi-star-outline"></i>
																<i class="item-rating pointer zmdi zmdi-star-outline"></i>
																<i class="item-rating pointer zmdi zmdi-star-outline"></i>
																<i class="item-rating pointer zmdi zmdi-star-outline"></i>
																<i class="item-rating pointer zmdi zmdi-star-outline"></i>
																<input class="dis-none" type="number" name="rating">
															</span>
														</div>
														
														<div class="row p-b-25">
															<div class="col-12 p-b-5">
																<label class="stext-102 cl3" for="review">Your review</label>
																<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="content" name="content"></textarea>
															</div>
			
															<div class="col-sm-6 p-b-5">
																<label class="stext-102 cl3" for="email">Your Id</label>
																<input class="size-111 bor8 stext-102 cl2 p-lr-20" type="text" id="memberId" name="memberId"  value="${sessionId }" disabled>
															</div>
														</div>
														
														<button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10" onclick="javascript:addReview()">
															리뷰등록
														</button>
												</c:otherwise>
											</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>


	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">
					Related Products
				</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">
					<c:forEach var="relatedGoods" items="${relatedGoodsList }">
					
						<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-pic hov-img0">
									<a href="${contextPath }/goods/goodsDetail?goodsCd=${relatedGoods.goodsCd}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										<img src="${contextPath }/thumbnails?goodsFileName=${relatedGoods.goodsFileName}" width="270px" height="340px" alt="IMG-PRODUCT">
									</a>
	
								</div>
	
								<div class="block2-txt flex-w flex-t p-t-14">
									<div class="block2-txt-child1 flex-col-l ">
										<a href="${contextPath }/goods/goodsDetail?goodsCd=${relatedGoods.goodsCd}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
											${relatedGoods.goodsNm }
										</a>
	
										<span class="stext-105 cl3">
											<div class="product__details__price"><fmt:formatNumber value="${relatedGoods.price - (relatedGoods.price * relatedGoods.discountRate / 100)}" /><span><fmt:formatNumber value="${relatedGoods.price }"/></span></div>
										</span>
									</div>
	
									<div class="block2-txt-child2 flex-r p-t-3">
										<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
											<img class="icon-heart1 dis-block trans-04" src="${contextPath }/resources/bootstrap/images/icons/icon-heart-01.png" alt="ICON">
											<img class="icon-heart2 dis-block trans-04 ab-t-l" src="${contextPath }/resources/bootstrap/images/icons/icon-heart-02.png" alt="ICON">
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</body>
</html>