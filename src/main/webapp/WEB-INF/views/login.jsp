<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>

<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<style type="text/css">
body {
  background: #007bff;
  background: linear-gradient(to right, #0062E6, #33AEFF);
}

.btn-login {
  font-size: 0.9rem;
  letter-spacing: 0.05rem;
  padding: 0.75rem 1rem;
}

.btn-google {
  color: white !important;
  background-color: #ea4335;
}

.btn-facebook {
  color: white !important;
  background-color: #3b5998;
}

.register{
cursor: pointer;
}
.text-register{
color: rgba(0,0,0,.26);
}
</style>
</head>
<body>

  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Đăng nhập</h5>
            <form method="POST" action="/perform_login" class="form-signin ">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<!-- kiểm tra xem đã login thành công hay không, bằng cách kiểm tra biến login_error -->
					<c:if test="${not empty param.login_error}">
						<div class="alert alert-danger" role="alert">Mật khẩu hoặc tên đăng nhập không đúng, vui lòng kiểm tra lại!!!</div>
					</c:if>

					<div class="form-group">
						<!-- bắt buộc name phải đẻ là "username" -->
						<input type="text" name="username" class="form-control " id ="form-control"
							placeholder="Username">
					</div>

					<div class="form-group">
						<input type="password" name="password" class="form-control" id ="form-control"
							placeholder="Password">
					</div>
					
	              <div class="form-check mb-3">
	                <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
	                <label class="form-check-label" for="rememberPasswordCheck">
	                  Quên mật khẩu
	                </label>
	              </div>
	              <div class="d-grid">
	                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Đăng nhập</button>
	              </div>
             
              <hr class="my-4">
               <div class="text-register">Bạn mới biết đến Book Sort? <a class="register" href="${base}/register">Đăng ký</a></div>
            </form>
        </div>
      </div>
    </div>
  </div>

	
	<jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</body>
</html>