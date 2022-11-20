<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/bootstrap/js/jquery-3.6.0.min.js"></script>
<script>

	var checkMemberId 	   = false;
	var checkPasswd 	   = false
	var checkConfirmPasswd = false;
	var checkMemberNm	   = false;
	var checkHp 		   = false;
	var checkEmail 		   = false;
	
	$(document).ready(function() {
		
		$("#memberId").blur(function(){
			
			var memberId = $("#memberId").val();
			
			if (memberId == "") {
				$("#idMsg").html("<span style='color:red;'>필수정보 입니다.</span>");
				checkMemberId = false;
				return false ;
			}
			
			var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	        if (!isID.test(memberId)) {
	        	$("#idMsg").html("<span style='color:red;'>5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</span>");
	        	checkMemberId = false;
	            return false ;
	        }
			
			$.ajax({
				type : "get",
				url  : "${contextPath}/member/checkDuplicatedId?memberId=" + memberId,
				success : function(data) {
					if (data == "notDuplicated") {
						$("#idMsg").html("<span style='color:blue;'>사용가능한 아이디입니다.</span>");
						checkMemberId = true;
						return true ;
					} else {
						$("#idMsg").html("<span style='color:red;'>이미 사용중인 아이디입니다.</span>");
						checkMemberId = false;
						return false ;
					}
				}
			});
			
		})
		
		$("#passwd").blur(function() {
			
			var passwd = $("#passwd").val();
			
			if (passwd == "") {
				$("#passwordMsg").html("<span style='color:red;'>비밀번호를 입력해주세요.</span>");
				checkPasswd = false;
	            return false ;
	        }
	        if (!isValidPasswd(passwd)) {
	        	$("#passwordMsg").html("<span style='color:red;'>8~16자 영문 대 소문자, 숫자, 특수문자를 포함하세요.</span>");
	        	checkPasswd = false;
	            return false ;
	        }
	        
	        $("#passwordMsg").html("<span></span>");
	        checkPasswd = true;
	        $("#confirmPasswd").focus();
	        return true ;
		})
		
		$("#confirmPasswd").blur(function() {
			
			var passwd		  = $("#passwd").val();
			var confirmPasswd = $("#confirmPasswd").val();
			
			if (confirmPasswd == "") {
				$("#confirmPasswdMsg").html("<span style='color:red;'>비밀번호를 입력해주세요.</span>");
				checkConfirmPasswd = false;
	            return false ;
			}
			
			if (passwd != confirmPasswd) {
				$("#confirmPasswdMsg").html("<span style='color:red;'>비밀번호가 일치하지 않습니다.</span>");
				checkConfirmPasswd = false;
	            return false ;
			} else {
				$("#confirmPasswdMsg").html("<span style='color:blue;'>일치합니다.</span>");
				checkConfirmPasswd = true;
				return true ;
			}
			
		})
		
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
		})
		
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
			
		})
		
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
			
		})
		
	});
	
	function isValidPasswd(str) {
		var pattern1 = /[0-9]/; // 숫자
		var pattern2 = /[a-zA-Z]/; // 문자
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		if(!pattern1.test(str) || !pattern2.test(str) || !pattern3.test(str) || str.length < 8 || str.length > 16) {
			return false;
		} else {
			return true;
		}
	}
	
	function checkSpace(passwd) {
        if (passwd.search(/\s/) != -1) {
            return true;
        }
        return false;
    }
	
	function formValidationCheck() {
		
		if (!checkMemberId) {
			alert("아이디를 확인하세요.");
			document.form.memberId.focus();
			return false;
		}
		
		if (!checkPasswd) {
			alert("비밀번호를 확인하세요.");
			document.form.passwd.focus();
			return false;
		}
		
		if (!checkConfirmPasswd) {
			alert("비밀번호를 확인하세요.");
			document.form.passwd.focus();
			return false;
		}
		
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
			회원가입
		</h2>
	</section>	

	<!-- Content page -->
	<section class="bg0 p-t-20 p-b-20">
		<div class="container">
			<form action="${contextPath }/member/register" method="post" name="form" onsubmit="return formValidationCheck()">
				<div class="flex-w flex-tr">
					<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
						<h5 style="margin-right: 18%;"><label for="memberId">아이디<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="idMsg"></span>
						<h5 style="margin-right: 17%;" class="m-t-20"><label for="passwd">비밀번호<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="passwordMsg"></span>
						<h5 style="margin-right: 13%;" class="m-t-20"><label for="confirmPasswd">비밀번호 재확인<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="password" id="confirmPasswd" name="confirmPasswd" placeholder="비밀번호를 확인하세요." class="stext-111 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="confirmPasswdMsg"></span>
						<h5 style="margin-right: 19%;" class="m-t-20"><label for="memberNm">이름<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-1">
							<input type="text" id="memberNm" name="memberNm" placeholder="이름을 입력하세요." class="stext-111 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="memberNmMsg"></span>
						<div>
	                    	<h5 style="margin-right: 17%;" class="m-t-20"><label for="birthY">생년월일</label></h5>
	                        <select id="birthY" style="width:93px;height:45px;" class="bor19 size-218 m-b-20">
	                            <c:forEach var="i" begin="0" end="200">
	                           		<option>${2022 - i}</option>
	                           	</c:forEach>
	                        </select>
	                        <select id="birthM" style="width:93px;height:45px;" class="bor19 size-218 m-b-20">
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
	                        <select id="birthD" style="width:93px;height:45px;" class="bor19 size-218 m-b-20" >
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
	                  		<h5 style="margin-right: 19%;" class="m-t-20"><label for="gender">성별</label></h5>
	                  		<select id="gender" name="gender" class="bor19 size-218 m-b-20" style="width:297px;height:45px;">
	                  				<option value="m" selected>남자</option>
	                  						 <option value="f">여자</option>
	                  		</select>
	                    </div>
					</div>
					<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
						<h5 style="margin-right: 17%;"><label for="hp">휴대전화<span style="color:red;">*</span></label></h5>
	                    <div class="bor19 size-218 m-b-0">
	                  		<input type="text" id="hp" name="hp" placeholder="-를 포함해서 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
	                    <span id="hpMsg"></span>
	                    <label for="smsstsYn" class="row" style="margin-left: 0.2%;">
	                         CSMS에서 발송하는 SMS 소식을 수신합니다.&nbsp;
	                    	<input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y">
	                    </label>
						<h5 style="margin-right: 18%;" class="m-t-20"><label for="email">이메일<span style="color:red;">*</span></label></h5>
						<div class="bor19 size-218 m-b-0">
	                    	<input type="text" id="email" name="email" placeholder="이메일을 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18">
	                    </div>
	                    <span id="emailMsg"></span>
	                    <label for="emailstsYn" class="row" style="margin-left: 0.2%;">
		                    CSMS에서 발송하는 E-mail을 수신합니다.&nbsp;
		                <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y">
	                    </label>
						<h5 style="margin-right: 17%;" class="m-t-20"><label for="postalCode">우편번호</label></h5>
						<div class="row">
							<div class="bor19 size-218 m-b-20" style="margin-left: 3.5%;">
								<input type="text" id="postalCode" name="postalCode" class="stext-121 cl2 plh3 size-116 p-lr-18">
							</div>
						<input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
						</div>
						<h5 style="margin-right: 15%;"><label for="roadAddress">도로명 주소</label></h5>
						<div class="bor19 size-218 m-b-20">
							<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명 주소를 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18">
						</div>
						<span id="roadAddressMsg"></span>
						<h5 style="margin-right: 16%;" class="m-t-20"><label for="parcelAddress">지번 주소</label></h5>
						<div class="bor19 size-218 m-b-20">
							<input type="text" id="parcelAddress" name="parcelAddress" placeholder="지번 주소를 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="parcelAddressMsg"></span>
						<h5 style="margin-right: 15%;" class="m-t-20"><label for="restAddress">나머지 주소</label></h5>
						<div class="bor19 size-218 m-b-40">
							<input type="text" id="restAddress" name="restAddress" placeholder="나머지 주소를 입력하세요." class="stext-121 cl2 plh3 size-116 p-lr-18" >
						</div>
						<span id="restAddressAddressMsg"></span>
						<div align="center">
		    				<button type="submit" style="width:80%;" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">가입</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
</html>