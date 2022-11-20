<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	var checkOrdererNm 	   = true;
	var checkOrdererHp 	   = true;
	var checkReceiverNm    = true;
	var checkReceiverHp    = true;
	var checkPayHp		   = true;	
	var checkPostalCode    = true;
	var checkRoadAddress   = true;
	var checkParcelAddress = true;
	var checkRestAddress   = true;
	var checkPayMethod	   = false;
	
	$().ready(function name() {

		$("#ordererNm").blur(function() {
			
			var ordererNm = $("#ordererNm").val();
			var nonchar	 = /[^가-힣a-zA-Z0-9]/gi;
			
			if (ordererNm == "") {
				$("#ordererNmMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkOrdererNm = false;
				return false ;
			}
			if (ordererNm != "" && nonchar.test(ordererNm)) {
				$("#ordererNmMsg").html("<span style='color:red;'>한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</span>");
				checkOrdererNm = false;
				return false ;
			}
			$("#ordererNmMsg").html("<span></span>");
			checkOrdererNm = true;
			return true ;			
		});
		
		$("#ordererHp").blur(function() {
			
			var ordererHp = $("#ordererHp").val();
			var isValidHp = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
			
			if (ordererHp == ""){
				$("#ordererHpMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkOrdererHp = false;
			    return false ;
			}
			if (isValidHp.test(ordererHp)) {
				$("#ordererHpMsg").html("<span></span>");
				checkOrdererHp = true;
		        return true ;
		    }
			$("#ordererHpMsg").html("<span style='color:red;'>휴대전화 번호를 확인해주세요.('-'를 포함해서 입력하세요.)</span>");
			checkOrdererHp = false;
		    return false ;
			
		});
		
		$("#receiverNm").blur(function() {
			
			var receiverNm = $("#receiverNm").val();
			var nonchar	 = /[^가-힣a-zA-Z0-9]/gi;
			
			if (receiverNm == "") {
				$("#receiverNmMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkReceiverNm = false;
				return false ;
			}
			if (receiverNm != "" && nonchar.test(receiverNm)) {
				$("#receiverNmMsg").html("<span style='color:red;'>한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</span>");
				checkReceiverNm = false;
				return false ;
			}
			$("#receiverNmMsg").html("<span></span>");
			checkReceiverNm = true;
			return true ;			
		});
		
		$("#receiverHp").blur(function() {
			
			var receiverHp = $("#receiverHp").val();
			var isValidHp = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
			
			if (receiverHp == ""){
				$("#receiverHpMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkReceiverHp = false;
			    return false ;
			}
			if (isValidHp.test(receiverHp)) {
				$("#receiverHpMsg").html("<span></span>");
				checkReceiverHp = true;
		        return true ;
		    }
			$("#receiverHpMsg").html("<span style='color:red;'>휴대전화 번호를 확인해주세요.('-'를 포함해서 입력하세요.)</span>");
			checkReceiverHp = false;
		    return false ;
			
		});
		
		$("#postalCode").blur(function() {
			
			var postalCode = $("#postalCode").val();
			
			if (postalCode == "") {
				$("#postalCodeMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkPostalCode = false;
				return false ;
			}
			$("#postalCodeMsg").html("<span></span>");
			checkPostalCode = true;
			return true ;			
		});
		
		$("#roadAddress").blur(function() {
			
			var roadAddress = $("#roadAddress").val();
			
			if (roadAddress == "") {
				$("#roadAddressMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkRoadAddress = false;
				return false ;
			}
			$("#roadAddressMsg").html("<span></span>");
			checkRoadAddress = true;
			return true ;			
		});
		
		$("#parcelAddress").blur(function() {
			
			var parcelAddress = $("#parcelAddress").val();
			
			if (parcelAddress == "") {
				$("#parcelAddressMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkParcelAddress = false;
				return false ;
			}
			$("#parcelAddressMsg").html("<span></span>");
			checkParcelAddress = true;
			return true ;			
		});
		
		$("#restAddress").blur(function() {
			
			var restAddress = $("#restAddress").val();
			
			if (restAddress == "") {
				$("#restAddressAddressMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkRestAddress = false;
				return false ;
			}
			$("#restAddressAddressMsg").html("<span></span>");
			checkRestAddress = true;
			return true ;			
		});
		
		$("#payHp").blur(function() {
			
			var payHp = $("#payHp").val();
			var isValidHp = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
			
			if (payHp == "") {
				$("#payHpMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkPayHp = false;
			    return false ;
			}
			if (isValidHp.test(payHp)) {
				$("#payHpMsg").html("<span></span>");
				checkPayHp = true;
		        return true ;
		    }
			$("#payHpMsg").html("<span style='color:red;'>휴대전화 번호를 확인해주세요.('-'를 포함해서 입력하세요.)</span>");
			checkPayHp = false;
		    return false ;
			
		});
		
		var payMethod = $("[name='payMethod']").val();
		
		if (payMethod == 'choice') {
			$("#cardPayMonth,#cardCompanyNm").hide();
			$("#payOrdererHp").hide();
			checkPayMethod = false;
		}
		
		$("#payMethod").change(function () {
			var payMethod = $("[name='payMethod']").val();
			
			if (payMethod == 'choice') {
				$("#cardPayMonth,#cardCompanyNm").hide();
				$("#payOrdererHp").hide();	
				checkPayMethod = false;
			}
			else if (payMethod == 'card') {
				$("#cardPayMonth,#cardCompanyNm").show();
				$("#payOrdererHp").hide();
				checkPayMethod = true;
			}
			else if (payMethod == 'phone'){
				$("#cardPayMonth,#cardCompanyNm").hide();
				$("#payOrdererHp").show();
				checkPayMethod = true;
			}
		});
		
		var orderGoodsQtyList = "${orderGoodsQtyList}".split(",");
		
		var viewPaymentAmt = 0;
		var paymentAmtList = 0;
		var totalDeliveryPrice = 0;
		var totalPoint = 0;
		
		for (var i = 0; i < orderGoodsQtyList.length - 1; i++) {
			
			$("#qty"+i).text(orderGoodsQtyList[i] + "개");
			$("#orderGoodsQty"+i).val(orderGoodsQtyList[i]);
			
			var price = Number($("#price"+i).val());
			var discountRate = Number($("#discountRate"+i).val());
			var orderGoodsQty = Number($("#orderGoodsQty"+i).val());
			var deliveryPrice =  Number($("#deliveryPrice"+i).val());
			
			viewPaymentAmt += (price - parseInt(price * (discountRate / 100))) * orderGoodsQty;
			
			paymentAmtList += (price - parseInt(price * (discountRate / 100))) * orderGoodsQty;
			paymentAmtList += ",";
			
			totalDeliveryPrice += deliveryPrice;
			totalPoint += Number($("#point"+i).val() * Number($("#orderGoodsQty"+i).val()));
		}
		
		if (totalDeliveryPrice > 2500) {
			totalDeliveryPrice = 2500
		}
		if (viewPaymentAmt >= 30000) {
			totalDeliveryPrice = 0;
		}
		viewPaymentAmt += totalDeliveryPrice;
		
		$("#totalDeliveryPrice").html(totalDeliveryPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
		$("#totalPoint").html(totalPoint.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "P 적립");
		$("#viewPaymentAmt").html(viewPaymentAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
		$("[name='paymentAmtList']").val(paymentAmtList);
		$("[name='totalPoint']").val(totalPoint);
		
	});
	
	
	function formValidationCheck() {
		
		if (!checkOrdererNm) {
			alert("주문자 이름을 확인하세요.");
			document.form.ordererNm.focus();
			return false;
		}
		if (!checkOrdererHp) {
			alert("주문자 연락처를 확인하세요.");
			document.form.ordererHp.focus();
			return false;
		}
		if (!checkReceiverNm) {
			alert("받는분 이름을 확인하세요.");
			document.form.receiverNm.focus();
			return false;
		}
		if (!checkReceiverHp) {
			alert("받는분 연락처를 확인하세요.");
			document.form.receiverHp.focus();
			return false;
		}
		if (!checkPayMethod) {
			alert("결제방법을 확인하세요.");
			document.form.payMethod.focus();
			return false;
		}
		if (!checkPayHp) {
			alert("결제 휴대폰 번호를 확인하세요.");
			document.form.payOrdererHp.focus();
			return false;
		}
		if (!checkPostalCode) {
			alert("우편번호를 확인하세요.");
			document.form.postalCode.focus();
			return false;
		}
		if (!checkRoadAddress) {
			alert("도로명주소를 확인하세요.");
			document.form.roadAddress.focus();
			return false;
		}
		if (!checkParcelAddress) {
			alert("지번주소를 확인하세요.");
			document.form.parcelAddress.focus();
			return false;
		}
		if (!checkRestAddress) {
			alert("나머지주소를 확인하세요.");
			document.form.restAddress.focus();
			return false;
		}
		
	}
</script>
</head>
<body>
	
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			장바구니 주문
		</h2>
	</section>
	
<form action="${contextPath }/order/orderCartGoods" method="post" name="form" onsubmit="return formValidationCheck()">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-20 m-t-20">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
                            <thead>
                                <tr class="table_head">
                                    <th width="5%"></th>
                                    <th>상품명</th>
                                    <th width="21%">상품가격</th>
                                    <th width="21%">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;주문수량</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:set var="point" value="0"/>
                            	<c:forEach var="goodsDto" items="${goodsList }" varStatus="i">
                            		<c:set var="point" value="${point + goodsDto.point }"/>
                            		 <tr>
                            		 	<td align="center">${i.index + 1 } &nbsp;</td>
                                  			<td>
	                                        <div class="row">
	                                        	<img src="${contextPath }/thumbnails?goodsFileName=${goodsDto.goodsFileName }" width="100" height="100">
	                                            <h6>
	                                            	<br><br>&emsp;&emsp;&emsp;
	                                            	<a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDto.goodsCd}">${goodsDto.goodsNm }</a>
		                                          	<p>&emsp;&emsp;&emsp; ${goodsDto.brand } / <fmt:formatNumber value="${goodsDto.point }"/>p 적립</p>
	                                            </h6>
	                                        </div>
	                                    </td>
	                                    <td>
	                                    	<div>
	                                    		<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${goodsDto.price }"/></span><br>
		                                    	<fmt:formatNumber value="${goodsDto.price -  goodsDto.price * (goodsDto.discountRate / 100)}"/>
	                                    	</div>
	                                    </td>
	                                    <td align="center">
	                                    	<div >
												<span id="qty${i.index }"></span>
											</div>
	                                    </td>
	                                </tr>
	                                	<input type="hidden" id="price${i.index }" value="${goodsDto.price}" />
                                    	<input type="hidden" id="discountRate${i.index }" value="${goodsDto.discountRate}" />
                                      	<input type="hidden" id="orderGoodsQty${i.index }"/>
                                      	<input type="hidden" id="deliveryPrice${i.index }" value="${goodsDto.deliveryPrice}" />
                                      	<input type="hidden" id="point${i.index }" value="${goodsDto.point}" />
                            	</c:forEach>
                            </tbody>
                        </table>
					</div>
					<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
						<input type="hidden" name="goodsCdList" value="${goodsCdList }">
              			<input type="hidden" name="orderGoodsQtyList" value="${orderGoodsQtyList}">		
       					<input type="hidden" name="cartCdList" value="${cartCdList}">		
       					<input type="hidden" name="memberId" value="${orderer.memberId}">
       					<input type="hidden" name="paymentAmtList">
       					<input type="hidden" name="totalPoint" value="${totalPoint }">
						<div>
							배송비 <span id="totalDeliveryPrice"></span><br>
	                        포인트 <span id="totalPoint"></span><br>
						</div>
							<div>
								<h5>Total <span id="viewPaymentAmt"></span></h5>
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
						<h5 style="margin-right: 18%;"><label for="ordererNm">주문자 이름<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="ordererNm" name="ordererNm" value="${orderer.memberNm }" class="stext-121 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="ordererNmMsg"></span>
						<h5 style="margin-right: 17%;" class="m-t-20"><label for="ordererHp">주문자 연락처<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="ordererHp" name="ordererHp" value="${orderer.hp }" class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="ordererHpMsg"></span>
						<h5 style="margin-right: 13%;" class="m-t-20"><label for="receiverNm">받는분 이름<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="receiverNm" name="receiverNm" value="${orderer.memberNm }" class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="receiverNmMsg"></span>
						<h5 style="margin-right: 19%;" class="m-t-20"><label for="receiverHp">받는분 연락처<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="receiverHp" name="receiverHp" value="${orderer.hp }" class="stext-111 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="receiverHpMsg"></span>
						<div>
	                    	<h5 style="margin-right: 17%;" class="m-t-20">배송방법<span style="color:red;">*</span></h5>
	                    	<div class="row" >
	                    		&emsp;
		                        <input type="radio" name="deliveryMethod" value="일반택배" checked> 일반택배 &emsp; 
								<input type="radio" name="deliveryMethod" value="편의점택배"> 편의점택배 &emsp;
								<input type="radio" name="deliveryMethod" value="해외배송"> 해외배송 &emsp;
	                    	</div>
	                   	</div>
	                   	<div>
	                  		<h5 style="margin-right: 19%;" class="m-t-20"><label for="payMethod">결제방법<span style="color:red;">*</span></label></h5>
	                  		<select id="payMethod" name="payMethod" class="bor19 size-218 m-b-20" style="width:297px;height:45px;">
	                  				<option value="choice">선택</option>
	                  				<option value="card">카드결제</option>
               						<option value="phone">휴대폰결제</option>
	                  		</select>
	                    </div>
	                   	<div id="cardCompanyNm">
	                  		<h5 style="margin-right: 19%;">카드회사<span style="color:red;">*</span></h5>
	                  		<select name="cardCompanyNm" class="bor19 size-218 m-b-20" style="width:297px;height:45px;">
	                  				<option value="삼성">삼성</option>
									<option value="하나SK">하나SK</option>
									<option value="현대">현대</option>
									<option value="KB">KB</option>
									<option value="신한">신한</option>
									<option value="롯데">롯데</option>
									<option value="BC">BC</option>
									<option value="시티">시티</option>
									<option value="NH농협">NH농협</option>
	                  		</select>
	                    </div>
	                   	<div id="cardPayMonth" >
	                  		<h5 style="margin-right: 19%;">할부개월<span style="color:red;">*</span></h5>
	                  		<select name="cardPayMonth" class="bor19 size-218 m-b-20" style="width:297px;height:45px;">
	                  				<option value="0">일시불</option>                                    
									<option value="2">2개월</option>                                    
									<option value="3">3개월</option>                                    
									<option value="4">4개월</option>                                    
									<option value="5">5개월</option>                                    
									<option value="6">6개월</option> 
	                  		</select>
	                    </div>
	                    <div id="payOrdererHp">
	                   		<h5 style="margin-right: 19%;">결제 휴대폰 번호<span style="color:red;">*</span></h5>
							<div class="bor19 size-218 m-b-1">
								<input type="text" name="payOrdererHp" id="payHp" value="${orderer.hp }" class="stext-111 cl2 plh3 size-116 p-lr-18" >
							</div>
							<span id="payHpMsg"></span>
	                    </div>
					</div>
					<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
						<h5 style="margin-right: 17%;"><label for="deliveryMessage">배송메세지</label></h5>
	                    <div class="bor19 size-218 m-b-0">
	                  		<input type="text" id="deliveryMessage" name="deliveryMessage" placeholder="배송메세지를 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
						<h5 style="margin-right: 17%;" class="m-t-20"><label for="postalCode">우편번호<span style="color:red;">*</span></label></h5>
						<div class="row">
							<div class="bor19 size-218" style="margin-left: 3.5%;">
								<input type="text" id="postalCode" name="postalCode" value="${orderer.postalCode }" class="stext-121 cl2 plh3 size-116 p-lr-18">
							</div>
						<input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
						</div>
						<span id="postalCodeMsg"></span>
						<h5 style="margin-right: 15%;" class="m-t-20"><label for="roadAddress">도로명 주소<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218">
							<input type="text" id="roadAddress" name="roadAddress" value="${orderer.roadAddress }" class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="roadAddressMsg"></span>
						<h5 style="margin-right: 16%;" class="m-t-20"><label for="parcelAddress">지번 주소<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218">
							<input type="text" id="parcelAddress" name="parcelAddress" value="${orderer.parcelAddress }" class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="parcelAddressMsg"></span>
						<h5 style="margin-right: 15%;" class="m-t-20"><label for="restAddress">나머지 주소<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218">
							<input type="text" id="restAddress" name="restAddress" value="${orderer.restAddress }" class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="restAddressAddressMsg"></span>
						<div align="center" class="m-t-40">
		    				<button type="submit" style="width:80%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">주문</button>
						</div>
					</div>
				</div>
		</div>
	</section>
</form>
</body>
</html>