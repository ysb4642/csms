<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/bootstrap/js/jquery-3.6.0.min.js"></script>
<script>

	var checkMemberNm	   = true;
	var checkHp 		   = true;
	var checkEmail 		   = true;
	
	$(document).ready(function() {
		
		var dateBirth = "${memberDto.dateBirth }".split('-');
		$("[name='birthY']").val(dateBirth[0]);
		$("[name='birthM']").val(dateBirth[1]);
		$("[name='birthD']").val(dateBirth[2]);
		
		var gender = "${memberDto.gender }";
		$("[name='gender']").val(gender);
		
		var smsstsYn = "${memberDto.smsstsYn}";
		if (smsstsYn == "Y") {
			$("[name='smsstsYn']").prop('checked', true);
		}
		
		var emailstsYn = "${memberDto.emailstsYn}";
		if (emailstsYn == "Y") {
			$("[name='emailstsYn']").prop('checked', true);
		}
		
		$("#memberNm").blur(function() {
			
			var memberNm = $("#memberNm").val();
			var nonchar	 = /[^가-힣a-zA-Z0-9]/gi;
			
			if (memberNm == "") {
				$("#memberNmMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkMemberNm = false;
				return false ;
			}
			if (memberNm != "" && nonchar.test(memberNm)) {
				$("#memberNmMsg").html("<span style='color:red;'>한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</span>");
				checkMemberNm = false;
				return false ;
			}
			$("#memberNmMsg").html("<span></span>");
			checkMemberNm = true;
			return true ;			
		});
		
		$("#hp").blur(function() {
			
			var hp = $("#hp").val();
			var isValidHp = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
			
			if (hp == ""){
				$("#hpMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkHp = false;
			    return false ;
			}
			if (isValidHp.test(hp)) {
				$("#hpMsg").html("<span></span>");
				checkHp = true;
		        return true ;
		    }
			$("#hpMsg").html("<span style='color:red;'>휴대전화 번호를 확인해주세요.</span>");
			checkHp = false;
		    return false ;
			
		});
		
		$("#email").blur(function() {
			
			var email = $("#email").val();
			var isValidEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
			if (email == "") {
				$("#emailMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkEmail = false;
			    return false ;
			}
			
			if (isValidEmail.test(email)) {
				$("#emailMsg").html("<span></span>");
				checkEmail = true;
		        return true ;
			}
			$("#emailMsg").html("<span style='color:red;'>이메일을 확인해주세요.</span>");
			checkEmail = false;
		    return false ;
			
		});
		
	});
	
	function removeMember() {
		if (confirm("정말로 탈퇴하시겠습니까?")) {
			location.href = "${contextPath}/myPage/removeMember?memberId=" + $("#memberId").val();
		}
	}
	
	
	
	function formValidationCheck() {
		
		if (!checkMemberNm) {
			alert("이름을 확인하세요.");
			document.form.memberNm.focus();
			return false;
		}
		
		if (!checkHp) {
			alert("휴대전화 번호를 확인하세요.");
			document.form.hp.focus();
			return false;
		}
		
		if (!checkEmail) {
			alert("이메일을 확인하세요.");
			document.form.email.focus();
			return false;
		}
		
		var dateBirth = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
		$("[name='dateBirth']").val(dateBirth);
		
		return true
		
	}
	
</script>
</head>
<body>

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			회원정보
		</h2>
	</section>
	
	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>

	<!-- Content page -->
	<section class="bg0 p-t-20 p-b-20">
		<div class="container">
			<form action="${contextPath }/myPage/modifyInfo" method="post" name="form" onsubmit="return formValidationCheck()">
				<div class="flex-w flex-tr">
					<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
						<h5 style="margin-right: 18%;"><label for="memberId">아이디<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="memberId" name="memberId" value="${memberDto.memberId }" readonly class="stext-121 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="idMsg"></span>
						<h5 style="margin-right: 17%;" class="m-t-20"><label for="passwd">비밀번호<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="password" id="passwd" name="passwd" value="${memberDto.passwd }" readonly class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="passwordMsg"></span>
						<h5 style="margin-right: 19%;" class="m-t-20"><label for="memberNm">이름<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="memberNm" name="memberNm" value="${memberDto.memberNm }" class="stext-111 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="memberNmMsg"></span>
						<div>
	                    	<h5 style="margin-right: 17%;" class="m-t-20"><label for="birthY">생년월일</label></h5>
	                        <select id="birthY" name="birthY" style="width:93px;height:45px;" class="bor19 size-218 m-b-20">
	                            <c:forEach var="i" begin="0" end="200">
	                           		<option>${2022 - i}</option>
	                           	</c:forEach>
	                        </select>
	                        <select id="birthM" name="birthM" style="width:93px;height:45px;" class="bor19 size-218 m-b-20">
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
	                        <select id="birthD" name="birthD" style="width:93px;height:45px;" class="bor19 size-218 m-b-20" >
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
	                       	<input type="hidden" name="dateBirth"/>
	                   	</div>
	                   	<div>
	                  		<h5 style="margin-right: 19%;"><label for="gender">성별</label></h5>
	                  		<select id="gender" name="gender" class="bor19 size-218 m-b-200" style="width:297px;height:45px;">
	                  				<option value="m" selected>남자</option>
	                  						 <option value="f">여자</option>
	                  		</select>
	                    </div>
	                    <a href="javascript:removeMember();">
		                    <button type="button" style="width:80%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">탈퇴</button>
	                    </a>
					</div>
					<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
						<h5 style="margin-right: 17%;"><label for="hp">휴대전화<span style="color:red;">*</span></label></h5>
	                    <div class="bor19 size-218 m-b-0">
	                  		<input type="text" id="hp" name="hp" value = "${memberDto.hp }" class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
	                    <span id="hpMsg"></span>
	                    <label for="smsstsYn" class="row" style="margin-left: 0.2%;">
	                         CSMS에서 발송하는 SMS 소식을 수신합니다.&nbsp;
	                    	<input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y">
	                    </label>
						<h5 style="margin-right: 18%;" class="m-t-20"><label for="email">이메일<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-0">
	                    	<input type="text" id="email" name="email" value="${memberDto.email }" class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
	                    <span id="emailMsg"></span>
	                    <label for="emailstsYn" class="row" style="margin-left: 0.2%;">
		                    CSMS에서 발송하는 E-mail을 수신합니다.&nbsp;
		                <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y">
	                    </label>
						<h5 style="margin-right: 17%;" class="m-t-20"><label for="postalCode">우편번호</label></h5>
						<div class="row">
							<div class="bor19 size-218 m-b-20" style="margin-left: 3.5%;">
								<input type="text" id="postalCode" name="postalCode" value="${memberDto.postalCode }" class="stext-121 cl2 plh3 size-116 p-lr-18">
							</div>
						<input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
						</div>
						<h5 style="margin-right: 15%;"><label for="roadAddress">도로명 주소</label></h5>
						<div class="bor19 size-218 m-b-20">
							<input class="stext-121 cl2 plh3 size-116 p-lr-18" type="text" id="roadAddress" name="roadAddress" value="${memberDto.roadAddress }">
						</div>
						<span id="roadAddressMsg"></span>
						<h5 style="margin-right: 16%;" class="m-t-20"><label for="parcelAddress">지번 주소</label></h5>
						<div class="bor19 size-218 m-b-20">
							<input type="text" id="parcelAddress" name="parcelAddress" value="${memberDto.parcelAddress }" class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="parcelAddressMsg"></span>
						<h5 style="margin-right: 15%;" class="m-t-20"><label for="restAddress">나머지 주소</label></h5>
						<div class="bor19 size-218 m-b-40">
							<input type="text" id="restAddress" name="restAddress" value="${memberDto.restAddress }" class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="restAddressAddressMsg"></span>
						<div align="center">
		    				<button type="submit" style="width:80%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">수정</button>
						</div>
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