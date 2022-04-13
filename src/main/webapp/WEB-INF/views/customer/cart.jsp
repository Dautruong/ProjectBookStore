<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Thông tin giỏ hàng</title>

<!-- COMMON -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- CSS -->
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>

</head>

<body>

	<!-- Navigation-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">

			<!-- Shopping cart table -->
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="border-0 bg-light">
								<div class="p-2 px-3 text-uppercase">Thông tin giỏ hàng</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Giá</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Số lương</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Xóa</div>
							</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach items="${cart.cartItems }" var="ci">
							<tr>
								<th scope="row" class="border-0">
									<div class="p-2">
										<img
											 src="${base}/uploads/${ci.pictureItem }"
											alt="" width="70" class="img-fluid rounded shadow-sm">
										<div class="ml-3 d-inline-block align-middle">
											<h5 class="mb-0">
												<a href="#" class="text-dark d-inline-block align-middle">
													${ci.productName }
												</a>
											</h5>
											
										</div>
									</div>
								</th>
								<td class="border-0 align-middle">
								<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${ ci.priceUnit }" type="currency" />
									
								</td>
								
								
								<td class="border-0 align-middle">
									<div class="counter">
										  <span class="down iconShowTotalItemsInCart "  onClick='decreaseCount(event, this)'>-</span>
										  <input type="text" value="${ci.quanlity }">
										  <button class="iconShowTotalItemsInCart btn btn-primary" onclick="javascript:AddToCart('${base}',${ci.productId}, 1);">+</button>
										</div>
								
								</td>
								<td class="border-0 align-middle">
								<button type="button" class="btn btn-danger">xóa</button>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
			<!-- End -->

			<form action="${base }/cart/checkout" method="post">
			
				<div class="row py-5 p-4 bg-white rounded shadow-sm">
					<div class="col-lg-6">
						<!--  <div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Coupon
							code</div>
						<div class="p-4">
							<p class="font-italic mb-4">If you have a coupon code, please
								enter it in the box below</p>
							<div class="input-group mb-4 border rounded-pill p-2">
								<input type="text" placeholder="Apply coupon"
									aria-describedby="button-addon3" class="form-control border-0">
								<div class="input-group-append border-0">
									<button id="button-addon3" type="button"
										class="btn btn-dark px-4 rounded-pill">
										<i class="fa fa-gift mr-2"></i>Apply coupon
									</button>
								</div>
							</div>
						</div> 
						<div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Customer
							Info</div>
						<div class="p-4">
							<div class="form-group">
								<label for="customerFullName">Customer full name</label>
								<input type="tel" class="form-control" id="customerFullName" name="customerFullName" placeholder="Full name">
							</div>
							<div class="form-group">
								<label for="customerEmail">Email address</label>
								<input type="email" class="form-control" id="customerEmail" name="customerEmail" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="customerPhone">Phone</label>
								<input type="tel" class="form-control" id="customerPhone" name="customerPhone" placeholder="Phone">
							</div>
							<div class="form-group">
								<label for="customerAddress">Address</label>
								<input type="text" class="form-control" id="customerAddress" name="customerAddress" placeholder="Address">
							</div>
						</div>
						
							-->
		<form>
		  <div class="form-row">
			  <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin khách hàng</div>
			 
			  	<div class="row">
				   <div class="col">
				    
				      <input type="text" class="form-control" placeholder="First name">
				    </div>
				    <div class="col">
					    
					     <input type="text" class="form-control" placeholder="Số điện thoại">
					 </div>
				</div>
		  </div>
		  <div class="form-group">
		    <label for="inputAddress">Địa chỉ nhận hàng</label>
		    <input type="text" class="form-control" id="inputAddress" placeholder="Tỉnh/ Thành phố, Quận/Huyện, Phường/Xã, số nhà">
		  </div>
		
			</form>
				</div>
					<div class="col-lg-6">
						<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin liên hệ và hóa đơn</div>
						<div class="p-4">
							<p class="font-italic mb-4">Kiểm tra lại thông tin trước khi đặt hàng</p>
							<ul class="list-unstyled mb-4">
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Tổng đơn </strong><strong><fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${ cart.totalPrice}" type="currency" /></strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Shipping and handling</strong><strong>FREESHIP</strong></li>
								
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Thành tiền</strong>
									<h5 class="font-weight-bold"><fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${ cart.totalPrice}" type="currency" /></strong></li></h5></li>
							</ul>
							<button type="submit" class="btn btn-dark rounded-pill py-2 btn-block">Đặt hàng</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

	<!-- Footer-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</body>
</html>
