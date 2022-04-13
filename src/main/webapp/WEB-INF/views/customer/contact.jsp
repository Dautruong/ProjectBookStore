<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<!-- directive SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    </head>
    <body>
        <!-- Navigation-->
        <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>     
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
               <!--Section: Contact v.2-->
				<section class="mb-4">
				    <!--Section heading-->
				    <h2 class="h1-responsive font-weight-bold text-center my-4">Contact us</h2>
				    <!--Section description-->
				    <p class="text-center w-responsive mx-auto mb-5">
				    ${DulieuBanNhapLa} 
				    <p class="text-center w-responsive mx-auto mb-5">
				    ${contactModel.thongBao}
				
				    <div class="row">
				        <!--Grid column-->
				        <div class="col-md-9 mb-md-0 mb-5">
				            <sf:form id="contact-form" name="contact-form" 
				            action="${base}/contact" method="POST" modelAttribute="contact">
				                <div class="row">
				                    <div class="col-md-6">
				                        <div class="md-form mb-0">
				                            <sf:input type="text" id="fistName" name="fistName" class="form-control" 
				                            path="fistName"></sf:input>
				                            <label for="name" class="">Fist Name</label>
				                        </div>
				                    </div>
				                    
				                     <div class="col-md-6">
				                        <div class="md-form mb-0">
				                            <sf:input type="text" id="lastName" name="lastName" class="form-control" 
				                            path="lastName"></sf:input>
				                            <label for="name" class="">Las Name</label>
				                        </div>
				                    </div>
				                    
				                    <div class="col-md-6">
				                        <div class="md-form mb-0">
				                            <sf:input type="text" id="email" name="email" class="form-control" path="email"></sf:input>
				                            <label for="email" class="">Your email</label>
				                        </div>
				                    </div>
				                </div>
				                <%-- <div class="row">
				                    <div class="col-md-12">
				                        <div class="md-form mb-0">
				                            <sf:input type="text" id="subject" name="subject" class="form-control" path="subject"></sf:input>
				                            <label for="subject" class="">Subject</label>
				                        </div>
				                    </div>
				                </div> --%>
				                <div class="row">
				                    <div class="col-md-12">
				                        <div class="md-form">
				                            <sf:textarea type="text" id="message" name="message" rows="2" class="form-control md-textarea" path="message"></sf:textarea>
				                            <label for="message">Your message</label>
				                        </div>
				                    </div>
				                </div>
				            </sf:form>
				            <div class="text-center text-md-left">
				                <a class="btn btn-primary" onclick="document.getElementById('contact-form').submit();">Send</a>
				             	<a class="btn btn-primary" onclick="SaveContact()">Send ajax</a>
				            </div>
				            <div class="status"></div>
				        </div>
				        <div class="col-md-3 text-center">
				            <ul class="list-unstyled mb-0">
				                <li><i class="fas fa-map-marker-alt fa-2x"></i>
				                    <p>San Francisco, CA 94126, USA</p>
				                </li>
				                <li><i class="fas fa-phone mt-4 fa-2x"></i>
				                    <p>+ 01 234 567 89</p>
				                </li>
				                <li><i class="fas fa-envelope mt-4 fa-2x"></i>
				                    <p>contact@mdbootstrap.com</p>
				                </li>
				            </ul>
				        </div>
				    </div>
				</section>
            </div>
        </section>
       	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
       	<!-- Bootstrap core JS-->
      	 <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    </body>
</html>
