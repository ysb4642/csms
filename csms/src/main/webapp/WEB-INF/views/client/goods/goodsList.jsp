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

	function formValidationCheck() {
		var searchGoods = document.form.searchGoods	
		if (searchGoods.value == "") {
			alert("검색어를 입력해주세요.");
			searchGoods.focus();
			return false;
		}
	}

</script>
</head>
<body>
	
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			상품
		</h2>
	</section>
	
	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						전체상품
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".food">
						사료
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".snack">
						간식
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".sand">
						모래
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".beauty">
						목욕/미용
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".toy">
						장난감
					</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".catTower">
						캣타워/스크래쳐
					</button>
				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>
				
				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<form action="${contextPath }/goods/searchGoods" name="form" onsubmit="return formValidationCheck()">
						<div class="bor8 dis-flex p-l-15">
							<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
								<i class="zmdi zmdi-search"></i>
							</button>
	
							<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="searchGoods" placeholder="Search">
						</div>
					</form>
				</div>
			</div>
			<div class="row isotope-grid">
				<c:forEach var="goodsDto" items="${goodsList }">
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${goodsDto.sort }">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName}" width="270px" height="340px" alt="IMG-PRODUCT">
								</a>
							</div>
	
							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										${goodsDto.goodsNm }
									</a>
	
									<span class="stext-105 cl3">
										<div class="product__details__price"><fmt:formatNumber value="${goodsDto.price - (goodsDto.price * goodsDto.discountRate / 100)}" /><span><fmt:formatNumber value="${goodsDto.price }"/></span></div>
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
</body>
</html>