<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>${product.title }</title>

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

	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0" src="${base}/uploads/${product.avatar}" alt="..." />
				</div>
				<div class="col-md-6" modelAttribute="product">
					<div class="small mb-1">${product.categories.name}</div>
					<h1 class="display-5 fw-bolder">${product.title }</h1>
					<div class="fs-5 mb-5">
						<span class="text-decoration-line-through">
							<fmt:setLocale value="vi_VN"/>
							<fmt:formatNumber value="${product.priceSale}" type="currency"/></span>
						
						<span>
							<fmt:setLocale value="vi_VN"/>
							<fmt:formatNumber value="${product.price}" type="currency"/>
						</span>
					</div>
					<p class="lead">${product.details}</p>
					<div class="d-flex">
						<input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
						<button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="javascript:AddToCart('${base}',${product.id}, 1);">
							<i class="bi-cart-fill me-1" ></i> Thêm giỏ hàng
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Related items section-->
	<section class="py-5 bg-light">
	<form class="form-inline"  action="${base}/details/{seo}"method="get">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">Related products</h2>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<c:forEach items="${productsData.data}" var="product">
						<div class="col mb-5">
							<div class="card h-100">
								<!-- Sale badge-->
								<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
								<!-- Product image-->
								<img class="card-img-top"src="${base}/uploads/${product.avatar}"   alt="..." />
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">${product.title }</h5>
										<!-- Product reviews-->
										<div
											class="d-flex justify-content-center small text-warning mb-2">
											<div class="bi-star-fill"></div>
											<div class="bi-star-fill"></div>
											<div class="bi-star-fill"></div>
											<div class="bi-star-fill"></div>
											<div class="bi-star-fill"></div>
										</div>
										<!-- Product price-->
										<span class="text-decoration-line-through">
											<fmt:setLocale value="vi_VN"/>
											<fmt:formatNumber value="${product.priceSale}" type="currency"/>
										</span>
										
										<span>
											<fmt:setLocale value="vi_VN"/>
											<fmt:formatNumber value="${product.price}" type="currency"/>
										</span>
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
						
				
			</div>
		</div>
		</form>
	</section>
	<!-- Footer-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>

</body>
</html>
