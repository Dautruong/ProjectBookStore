<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- Navigation-->

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="${base }/">Book Store</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="${base }/">Sách Hay</a></li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tuyển Tập</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="${base}/">Tất cả sản phẩm</a></li>
						<li><hr class="dropdown-divider" /></li>
						
						<c:forEach items="${categories }" var="category">
							<li><a class="dropdown-item" href="${base }/category/${category.seo}">${category.name }</a></li>
						</c:forEach>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#!">Sách khác</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link" href="${base}/cart/view">Dụng cụ</a></li>
				<li class="nav-item"><a class="nav-link" href="${base}/contact">liên hệ</a></li>
			</ul>
			
			<form  action="${base}/index" method="get"> 
				<input type="hidden" id="page" name="page">
				<input type="text" id="keyword" name="keyword" class="form-control btnSeach" placeholder="Search" value="${searchModel.keyword }"> 
				<button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary">Tìm kiếm</button>
				
			</form>
			
			<form class="d-flex" action="${base}/cart/view"> 
			
					<button class="btn btn-outline-dark" type="submit">
					<i class="bi-cart-fill me-1"></i> 
					<span id="iconShowTotalItemsInCart" class="badge bg-dark text-white ms-1 rounded-pill">
						${totalItems }
					</span>
					</button>
			</form>
			<div><a class="nav-link" href="${base}/login">Login</a></div>
		</div>
	</div>
</nav>


</div>

<header >
<!-- Header
	<div class="container px-4 px-lg-5 my-5">
		<div class="text-center text-white">
			<h1 class="display-4 fw-bolder">${CurrentCategory.name}</h1>
			<p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
		</div>
	</div>
	-->
	 <div class="box-container">
			<c:forEach items="${categories }" var="category">
		        <div class="box">
		            <h3>${category.name }</h3>
		            <a  href="${base }/category/${category.seo}"" class="btn">Xem thêm</a>
		        </div>
		</c:forEach>
    </div>
    
</header>