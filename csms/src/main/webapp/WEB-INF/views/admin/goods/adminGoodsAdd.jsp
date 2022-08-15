<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script> 

<script>
	
	$(document).ready(function() {
		$("#sort").change(function() {
			var sort = $("#sort").val();
			
			if (sort == "사료" || sort == "간식") {
				$("#taste").prop("disabled", false);
				$("#expiryDateY").prop("disabled", false);
				$("#expiryDateM").prop("disabled", false);
				$("#expiryDateD").prop("disabled", false);
				$("#capacity").prop("disabled", false);
			}
			else {
				$("#taste").prop("disabled", true);
				$("#expiryDateY").prop("disabled", true);
				$("#expiryDateM").prop("disabled", true);
				$("#expiryDateD").prop("disabled", true);
				$("#capacity").prop("disabled", true);
			}
		});
	});

</script>
</head>
<body>
	
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			상품등록
		</h2>
	</section>	

	<!-- Content page -->
	<section class="bg0 p-t-20 p-b-20">
		<div class="container">
			<form action="${contextPath }/member/register" method="post" name="form" onsubmit="return formValidationCheck()">
					<div class="bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" align="left">
						<h4 class="m-b-7">상품이미지<span style="color:red;">*</span></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="file" name="goodsFileName" class="stext-121 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="goodsFileNameMsg"></span>
						<h4 class="m-t-20"><label for="goodsNm">상품명<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="goodsNm" name="goodsNm" placeholder="상품명을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="goodsNmMsg"></span>
						<h4 class="m-t-20"><label for="brand">브랜드<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="brand" name="brand" placeholder="브랜드를 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="brandMsg"></span>
						<h4 class="m-t-20"><label for="price">가격<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="price" name="price" placeholder="가격을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="priceMsg"></span>
						<h4 class="m-t-20"><label for="discountRate">할인율<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="discountRate" name="discountRate" placeholder="할인율을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="discountRateMsg"></span>
						<h4 class="m-t-20"><label for="point">적립포인트(P)<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="point" name="point" placeholder="적립 포인트(P)를 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="pointMsg"></span>
						<div>
	                    	<h4 class="m-t-20"><label for="sort">분류<span style="color:red;">*</span></label></h4>
	                        <select id="sort" name="sort" style="width:1000px; height:52px;" class="bor19 m-b-1" >
	                        	<option selected>선택</option>
	                        	<option>사료</option>
	                        	<option>간식</option>
	                        	<option>모래</option>
	                        	<option>목욕/미용</option>
	                        	<option>장난감</option>
	                        	<option>스크래쳐/캣타워</option>
	                       	</select>
	                   	</div>
	                   	<span id="sortMsg"></span>
						<h4 class="m-t-20"><label for="taste">맛</label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="taste" name="taste" placeholder="맛을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18" disabled>
						</div>
						<span id="tasteMsg"></span>
						<div>
	                    	<h4 class="m-t-20"><label for="expiryDateY">유통기한</label></h4>
	                        <select id="expiryDateY" style="width:420px;height:52px;" class="bor19 m-b-1" disabled>
	                            <c:forEach var="i" begin="0" end="50">
	                           		<option>${2022 + i}</option>
	                           	</c:forEach>
	                        </select>
	                        <select id="expiryDateM" style="width:420px;height:52px;" class="bor19 size-218 m-b-1" disabled>
	                            <c:forEach var="i" begin="1" end="12">
	                           		<c:choose>
	                           			<c:when test="${i < 10 }">
	                            			<option>0${i}</option>
	                           			</c:when>
	                           			<c:otherwise>
	                           				<option>${i}</option>
	                           			</c:otherwise>
	                           		</c:choose>
	                           	</c:forEach>
	                        </select>
	                        <select id="expiryDateD" style="width:420px;height:52px;" class="bor19 size-218 m-b-1" disabled>
	                           	<c:forEach var="i" begin="1" end="31">
	                           		<c:choose>
	                           			<c:when test="${i < 10 }">
	                           				<option>0${i}</option>
	                           			</c:when>
	                           			<c:otherwise>
	                           				<option>${i}</option>
	                           			</c:otherwise>
	                           		</c:choose>
	                           	</c:forEach>
	                       	</select>
	                       	<input type="hidden" name="expiryDate"/>
	                   	</div>
	                   	<h4 class="m-t-20"><label for="capacity">중량</label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="capacity" name="capacity" placeholder="중량을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18" disabled>
						</div>
						<span id="capacityMsg"></span>
						<h4 class="m-t-20"><label for="stock">재고<span style="color:red;">*</span></label></h4>
	                    <div class="bor19 m-b-0" style="width:1000px;">
	                  		<input type="text" id="stock" name="stock" placeholder="재고를 입력하세요" class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
	                    <span id="stockMsg"></span>
						<h4 class="m-t-20"><label for="deliveryPrice">배송비<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-0" style="width:1000px;">
	                    	<input type="text" id="deliveryPrice" name="deliveryPrice" placeholder="배송비를 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
	                    <span id="deliveryPriceMsg"></span>
	                    <h4 class="m-t-20"><label for="explain">상품설명<span style="color:red;">*</span></label></h4>
	                    	<textarea rows="5" cols="100" id="explain" name="explain" placeholder="상품설명을 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18"></textarea>
	                    	<script>CKEDITOR.replace('explain');</script>
	                    <span id="explainMsg"></span>
						<div class="m-t-20" align="center">
		    				<button type="submit" style="width:80%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">등록</button>
						</div>
					</div>
			</form>
		</div>
	</section>
	
	
	
	<!-- Map -->
	<div class="map">
		<div class="size-303" id="google_map" data-map-x="40.691446" data-map-y="-73.886787" data-pin="${contextPath }/resources/bootstrap/images/icons/pin.png" data-scrollwhell="0" data-draggable="1" data-zoom="11"></div>
	</div>
</body>
</html>