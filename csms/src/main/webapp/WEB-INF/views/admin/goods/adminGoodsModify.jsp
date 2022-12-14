<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script> 

<script>

	$(document).ready(function () {
		var sort = "${goodsDto.sort }";
		$("[name='sort']").val(sort);
		
		if (sort == "food") {
			$("#taste").prop("disabled", false);
			$("#expiryDateY").prop("disabled", false);
			$("#expiryDateM").prop("disabled", false);
			$("#expiryDateD").prop("disabled", false);
			$("#capacity").prop("disabled", false);
		}
		else if (sort == "snack") {
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
		
		if ("${goodsDto.expiryDate}" == "") {
			$("[name='expiryDateY']").val("choice");
			$("[name='expiryDateM']").val("choice");
			$("[name='expiryDateD']").val("choice");
		}
		else {
			var expiryDate = "${goodsDto.expiryDate }".split('-');
			$("[name='expiryDateY']").val(expiryDate[0]);
			$("[name='expiryDateM']").val(expiryDate[1]);
			$("[name='expiryDateD']").val(expiryDate[2]);			
		}
		
	});
	
	$(document).ready(function() {
		$("#sort").change(function() {
			var sort = $("#sort").val();
			
			if (sort == "food") {
				$("#taste").prop("disabled", false);
				$("#expiryDateY").prop("disabled", false);
				$("#expiryDateM").prop("disabled", false);
				$("#expiryDateD").prop("disabled", false);
				$("#capacity").prop("disabled", false);
			}
			else if (sort == "snack") {
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
			alert("?????? ???????????? ???????????????.");
			goodsFileName.focus();
			return false;
		}
		
		var goodsNm = document.form.goodsNm
		if (goodsNm.value == "") {
			alert("???????????? ???????????????.");
			goodsNm.focus();
			return false;
		}
		
		var brand = document.form.brand
		if (brand.value == "") {
			alert("??????????????? ???????????????.");
			brand.focus();
			return false;
		}
		
		var regExp = /^[0-9]*$/;
		var price = document.form.price
		if (price.value == "") {
			alert("????????? ???????????????.");
			price.focus();
			return false;
		}
		if(!regExp.test(price.value)){
			alert("???????????? ????????? ?????????????????????.");
			price.focus();
		    return false;
		}
		
		var discountRate = document.form.discountRate
		if (discountRate.value == "") {
			alert("???????????? ???????????????.");
			discountRate.focus();
			return false;
		}
		if(!regExp.test(discountRate.value)){
			alert("??????????????? ????????? ?????????????????????.");
			discountRate.focus();
		    return false;
		}
		
		var point = document.form.point
		if (point.value == "") {
			alert("?????????????????? ???????????????.");
			point.focus();
			return false;
		}
		if(!regExp.test(point.value)){
			alert("?????? ??????????????? ????????? ?????????????????????.");
			point.focus();
		    return false;
		}
		
		var sort = document.form.sort
		if (sort.value == "choice") {
			alert("????????? ???????????????.");
			sort.focus();
			return false;
		}
		
		var taste = document.form.taste
		if (taste.disabled == false && taste.value == "") {
			alert("?????? ???????????????.");
			taste.focus();
			return false;
		}
		
		var capacity = document.form.capacity
		if (capacity.disabled == false && capacity.value == "") {
			alert("????????? ???????????????.");
			capacity.focus();
			return false;
		}
		
		var stock = document.form.stock
		if (stock.value == "") {
			alert("????????? ???????????????.");
			stock.focus();
			return false;
		}
		if(!regExp.test(stock.value)){
			alert("????????? ????????? ?????????????????????.");
			stock.focus();
		    return false;
		}
		
		var deliveryPrice = document.form.deliveryPrice
		if (deliveryPrice.value == "") {
			alert("???????????? ???????????????.");
			deliveryPrice.focus();
			return false;
		}
		if(!regExp.test(deliveryPrice.value)){
			alert("???????????? ????????? ?????????????????????.");
			deliveryPrice.focus();
		    return false;
		}
		
		var explain = document.form.explain
		if (explain.value == "") {
			alert("??????????????? ???????????????.");
			explain.focus();
			return false;
		}
		
		var expiryDate
		if ($("#expiryDateY").val() == "choice" || $("#expiryDateM").val() == "choice" || $("#expiryDateD").val() == "choice") {
			expiryDate = "";
		} else {
			expiryDate = $("#expiryDateY").val() + "-" + $("#expiryDateM").val() + "-" + $("#expiryDateD").val();
		}
		$("[name='expiryDate']").val(expiryDate);
		
		return true
		
	}

</script>
</head>
<body>
	
	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			????????????
		</h2>
	</section>	

	<!-- Content page -->
	<section class="bg0 p-t-20 p-b-20">
		<div class="container">
			<form action="${contextPath }/admin/goods/adminGoodsModify" method="post" name="form" enctype="multipart/form-data" onsubmit="return formValidationCheck()">
					<input type="hidden" name="goodsCd" value="${goodsDto.goodsCd }">
					<div class="bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" align="left">
						<h4 class="m-b-7">???????????????<span style="color:red;">*</span></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="file" name="goodsFileName" value="${goodsDto.goodsFileName }" class="stext-121 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="goodsNm">?????????<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="goodsNm" name="goodsNm" value="${goodsDto.goodsNm }" class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="brand">?????????<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="brand" name="brand" value="${goodsDto.brand }"class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="price">??????<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="price" name="price" value="${goodsDto.price }" class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="discountRate">?????????<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="discountRate" name="discountRate" value="${goodsDto.discountRate }" class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<h4 class="m-t-20"><label for="point">???????????????(P)<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="point" name="point" value="${goodsDto.point }" class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<div>
	                    	<h4 class="m-t-20"><label for="sort">??????<span style="color:red;">*</span></label></h4>
	                        <select id="sort" name="sort" style="width:1000px; height:52px;" class="bor19 m-b-1" >
	                        	<option value="choice">??????</option>
	                        	<option value="food">??????</option>
	                        	<option value="snack">??????</option>
	                        	<option value="sand">??????</option>
	                        	<option value="beauty">??????/??????</option>
	                        	<option value="toy">?????????</option>
	                        	<option value="catTower">????????????/?????????</option>
	                       	</select>
	                   	</div>
						<h4 class="m-t-20"><label for="taste">???</label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="taste" name="taste" value="${goodsDto.taste }" class="stext-111 cl2 plh3 size-116 p-lr-18" disabled>
						</div>
						<div>
	                    	<h4 class="m-t-20"><label for="expiryDateY">????????????</label></h4>
	                        <select id="expiryDateY" name="expiryDateY" style="width:420px;height:52px;" class="bor19 m-b-1" disabled>
	                            <option value="choice">??????</option>
	                            <c:forEach var="i" begin="0" end="50">
	                           		<option>${2022 + i}</option>
	                           	</c:forEach>
	                        </select>
	                        <select id="expiryDateM" name="expiryDateM" style="width:420px;height:52px;" class="bor19 size-218 m-b-1" disabled>
	                            <c:forEach var="i" begin="1" end="12">
	                            	<option value="choice">??????</option>
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
	                        <select id="expiryDateD" name="expiryDateD" style="width:420px;height:52px;" class="bor19 size-218 m-b-1" disabled>
	                           	<c:forEach var="i" begin="1" end="31">
	                           		<option value="choice">??????</option>
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
	                   	<h4 class="m-t-20"><label for="capacity">??????</label></h4>
						<div class="bor19 m-b-1" style="width:1000px;">
							<input type="text" id="capacity" name="capacity" value="${goodsDto.capacity }"class="stext-111 cl2 plh3 size-116 p-lr-18" disabled>
						</div>
						<h4 class="m-t-20"><label for="stock">??????<span style="color:red;">*</span></label></h4>
	                    <div class="bor19 m-b-0" style="width:1000px;">
	                  		<input type="text" id="stock" name="stock" value="${goodsDto.stock }" class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
						<h4 class="m-t-20"><label for="deliveryPrice">?????????<span style="color:red;">*</span></label></h4>
						<div class="bor19 m-b-0" style="width:1000px;">
	                    	<input type="text" id="deliveryPrice" name="deliveryPrice" value="${goodsDto.deliveryPrice }" class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
	                    <h4 class="m-t-20"><label for="explain">????????????<span style="color:red;">*</span></label></h4>
	                    	<textarea rows="5" cols="100" id="explain" name="explain" class="stext-121 cl2 plh3 size-116 p-lr-18">${goodsDto.explain }</textarea>
	                    	<script>CKEDITOR.replace('explain');</script>
						<div class="m-t-20" align="center">
		    				<button type="submit" style="width:80%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">??????</button>
						</div>
					</div>
			</form>
		</div>
	</section>
</body>
</html>