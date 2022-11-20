<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
<head>
	<title><tiles:insertAttribute name="title" /></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${contextPath }/resources/bootstrap/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/css/util.css">
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/bootstrap/css/main.css">
<!--===============================================================================================-->
	<script src="${contextPath}/resources/bootstrap/js/jquery-3.6.0.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		
		            var fullRoadAddr = data.roadAddress; 
		            var extraRoadAddr = ''; 
		
		            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		            if (data.buildingName !== '' && data.apartment === 'Y'){
		               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            if (extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }
		            if (fullRoadAddr !== ''){
		                fullRoadAddr += extraRoadAddr;
		            }
		
		            document.getElementById('postalCode').value = data.zonecode; //5자리 새우편번호 사용
		            document.getElementById('roadAddress').value = fullRoadAddr;
		            document.getElementById('parcelAddress').value = data.jibunAddress;
		          
		        }
		    }).open();
		}
	</script>
</head>
<body class="animsition">
	
	<!-- Header -->
	
	<tiles:insertAttribute name="header" />
	

	<!-- Sidebar -->
	
	<tiles:insertAttribute name="aside" />

	<!-- Cart -->
	
	<tiles:insertAttribute name="body" />


	<!-- Footer -->
	
	<tiles:insertAttribute name="footer" />

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="${contextPath }/resources/bootstrap/images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3" data-thumb="${contextPath }/resources/bootstrap/images/product-detail-01.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="${contextPath }/resources/bootstrap/images/product-detail-01.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${contextPath }/resources/bootstrap/images/product-detail-01.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="${contextPath }/resources/bootstrap/images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="${contextPath }/resources/bootstrap/images/product-detail-02.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${contextPath }/resources/bootstrap/images/product-detail-02.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="${contextPath }/resources/bootstrap/images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="${contextPath }/resources/bootstrap/images/product-detail-03.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${contextPath }/resources/bootstrap/images/product-detail-03.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!--===============================================================================================-->	
	<script src="${contextPath }/resources/bootstrap/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/bootstrap/js/popper.js"></script>
	<script src="${contextPath }/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/daterangepicker/moment.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/slick/slick.min.js"></script>
	<script src="${contextPath }/resources/bootstrap/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "좋아요!", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "좋아요!", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	</script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="${contextPath }/resources/bootstrap/js/main.js"></script>

</body>
</html>