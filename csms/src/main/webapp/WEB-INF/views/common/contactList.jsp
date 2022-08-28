<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
	function selectAllContact() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='contactCd']").prop("checked", true);
		}
		else {
			$("[name='contactCd']").prop("checked", false);
		}
	}
	
	function removeContact() {
		var contactCdList = "";
		
		if (confirm("정말로 삭제하시겠습니까?")) {
			$("[name='contactCd']:checked").each(function() {
				contactCdList += $(this).val() + ",";
			});
			
			if (contactCdList == "") {
				alert("삭제할 내역이 없습니다.");
				return;
			}
			
			location.href = "${contextPath}/removeContact?contactCdList="+contactCdList;
		}
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('${contextPath }/resources/bootstrap/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Contact List
		</h2>
	</section>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-50 m-t-20">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<h6 class="row m-l-1 m-b-10"><input type="checkbox" id="changeAllChoice" onchange="selectAllContact()"> &nbsp;전체선택</h6>
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
                            <thead>
                                <tr class="table_head">
                                    <th width="5%"></th>
                                    <th width="45%">제목</th>
                                    <th width="25%">작성자 메일</th>
                                    <th width="25%">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty contactList}">
                            			<tr align="center">
                            				<td colspan="4"><h5>조회된 문의가 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="contactDto" items="${contactList }">
		                            		 <tr height="60px">
		                            		 	<td align="center"><input type="checkbox" name="contactCd" value="${contactDto.contactCd }"></td>
                                    			<td>
	                                            	<a href="${contextPath }/contactDetail?contactCd=${contactDto.contactCd}">${contactDto.subject }</a>
			                                    </td>
			                                    <td>
			                                    	${contactDto.email }
			                                    </td>
			                                    <td>
			                                    	<fmt:formatDate value="${contactDto.regDt }" pattern="yyyy-MM-dd"/>
			                                    </td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
					</div>
					<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div></div>
							<div>
								<button class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10" onclick="javascript:removeContact()">
									삭제
								</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>