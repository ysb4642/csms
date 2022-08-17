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
			
			if (sort == "사료") {
				$("#taste").prop("disabled", false);
				$("#expiryDateY").prop("disabled", false);
				$("#expiryDateM").prop("disabled", false);
				$("#expiryDateD").prop("disabled", false);
				$("#capacity").prop("disabled", false);
			}
			else if (sort == "간식") {
				$("#taste").prop("disabled", false);
				$("#expiryDateY").prop("disabled", false);
				$("#expiryDateM").prop("disabled", false);
				$("#expiryDateD").prop("disabled", false);
				$("#capacity").prop("disabled", true);
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
	
function formValidationCheck() {
		
		var goodsFileName = document.form.goodsFileName
		if (goodsFileName.value == "") {
			alert("상품 이미지를 등록하세요.");
			goodsFileName.focus();
			return false;
		}
		
		var goodsNm = document.form.goodsNm
		if (goodsNm.value == "") {
			alert("상품명을 입력하세요.");
			goodsNm.focus();
			return false;
		}
		
		var brand = document.form.brand
		if (brand.value == "") {
			alert("브랜드명을 입력하세요.");
			brand.focus();
			return false;
		}
		
		var regExp = /^[0-9]*$/;
		var price = document.form.price
		if (price.value == "") {
			alert("가격을 입력하세요.");
			price.focus();
			return false;
		}
		if(!regExp.test(price.value)){
			alert("가격에는 숫자만 입력가능합니다.");
			price.focus();
		    return false;
		}
		
		var discountRate = document.form.discountRate
		if (discountRate.value == "") {
			alert("할인율을 입력하세요.");
			discountRate.focus();
			return false;
		}
		if(!regExp.test(discountRate.value)){
			alert("할인율에는 숫자만 입력가능합니다.");
			discountRate.focus();
		    return false;
		}
		
		var point = document.form.point
		if (point.value == "") {
			alert("적립포인트를 입력하세요.");
			point.focus();
			return false;
		}
		if(!regExp.test(point.value)){
			alert("적립 포인트에는 숫자만 입력가능합니다.");
			point.focus();
		    return false;
		}
		
		var sort = document.form.sort
		if (sort.value == "선택") {
			alert("분류를 선택하세요.");
			sort.focus();
			return false;
		}
		
		var taste = document.form.taste
		if (taste.disabled == false && taste.value == "") {
			alert("맛을 입력하세요.");
			taste.focus();
			return false;
		}
		
		var capacity = document.form.capacity
		if (capacity.disabled == false && capacity.value == "") {
			alert("중량을 입력하세요.");
			capacity.focus();
			return false;
		}
		
		var stock = document.form.stock
		if (stock.value == "선택") {
			alert("재고를 입력하세요.");
			stock.focus();
			return false;
		}
		if(!regExp.test(stock.value)){
			alert("재고는 숫자만 입력가능합니다.");
			stock.focus();
		    return false;
		}
		
		var deliveryPrice = document.form.deliveryPrice
		if (deliveryPrice.value == "선택") {
			alert("배송비를 입력하세요.");
			deliveryPrice.focus();
			return false;
		}
		
		var explain = document.form.explain
		if (explain.value == "선택") {
			alert("상품설명을 입력하세요.");
			explain.focus();
			return false;
		}
		
		var expiryDate = $("#expiryDateY").val() + "-" + $("#expiryDateM").val() + "-" + $("#expiryDateD").val();
		$("[name='expiryDate']").val(expiryDate);
		
		return true
		
	}

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
			<form action="${contextPath }/admin/goods/adminGoodsAdd" method="post" name="form" enctype="multipart/form-data" onsubmit="return formValidationCheck()">
					<div class="bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" align="left">
						<h4 class="m-b-7">상품이미지<span style="color:red;">*</span></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="file" name="goodsFileName" class="stext-121 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="goodsNm">상품명<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="goodsNm" name="goodsNm" placeholder="상품명을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="brand">브랜드<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="brand" name="brand" placeholder="브랜드를 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="price">가격<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="price" name="price" placeholder="가격을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="discountRate">할인율<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="discountRate" name="discountRate" placeholder="할인율을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="point">적립포인트(P)<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="point" name="point" placeholder="적립 포인트(P)를 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
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
						<h4 class="m-t-20"><label for="taste">맛</label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="taste" name="taste" placeholder="맛을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18" disabled>
						</div>
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
						<h4 class="m-t-20"><label for="stock">재고<span style="color:red;">*</span></label></h4>
	                    <div class="bor19 m-b-0" style="width:1000px;">
	                  		<input type="text" id="stock" name="stock" placeholder="재고를 입력하세요" class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
						<h4 class="m-t-20"><label for="deliveryPrice">배송비<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-0" style="width:1000px;">
	                    	<input type="text" id="deliveryPrice" name="deliveryPrice" placeholder="배송비를 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
	                    <h4 class="m-t-20"><label for="explain">상품설명<span style="color:red;">*</span></label></h4>
	                    	<textarea rows="5" cols="100" id="explain" name="explain" placeholder="상품설명을 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18"></textarea>
	                    	<script>CKEDITOR.replace('explain');</script>
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