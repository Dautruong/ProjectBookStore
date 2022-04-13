<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Administrator Product</title>
        
        <!-- Favicon-->
        <!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
		
		<!-- COMMON -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
		
        <!-- Core theme CSS (includes Bootstrap)-->
        <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>
        
    </head>
    <body>
    
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
            
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                
                <!-- Top navigation-->
            	<jsp:include page="/WEB-INF/views/administrator/layout/menu.jsp"></jsp:include>    
                
                <!-- Page content-->
                <div class="container-fluid">
                    <form class="form-inline" action="${base}/admin/product/list" method="get">
                   		<div class="d-flex flex-row justify-content-between mt-4">
	                   		<div class="d-flex flex-row">
	                   			<input type="hidden" id="page" name="page">
	                   			<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }"> 
	                   			 <!--
								<select class="form-control" name="categoryId" id="categoryId">
									<c:forEach  items="${categories}" var="categories">
									 
										<option value="${categories.id}" 
											${categories.id == searchModel.categoryId ? "selected" : ""}>${categories.name}
										</option>
									</c:forEach>
								</select>
								-->
								<button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary">Seach</button>
							</div>
							<div>
								<a class="btn btn-outline-primary mb-1" href="${base}/admin/product/addOrUpdate" role="button">Add list</a>
							</div>
                    	</div>
						
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Title</th>
									<th scope="col">Price</th>
									<th scope="col">Category</th>
									<th scope="col">Status</th>
									<th scope="col">Avatar</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${productsWithPaging.data}" var="product" varStatus="loop">
									<tr>
										<th scope="row">${loop.index + 1}</th>
										<td>${product.title }</td>
										<td>
											<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${product.price }" type="currency" />
										</td>
										<td>${product.categories.name }</td>
										<td>
											<span id="_product_status_${product.id} }">
												<c:choose>
													<c:when test="${product.status}">
														<input type="checkbox" checked="checked">
													</c:when>
													<c:otherwise>
														<input type="checkbox">
													</c:otherwise>
												</c:choose>
											</span>
										</td>
										<td>
											
											<img src="${base}/uploads/${product.avatar}" width="100" height="100">
											
										</td>
										<td>
											<a class="btn btn-primary" href="${base }/admin/productedit/${product.id}" role="button">Edit</a>
											<button class="btn btn-danger" role="button" onclick="DeleteProduct(${product.id})">Delete</button>
										</td>
									</tr>
									
								</c:forEach>
							</tbody>
						</table>
						
						<jsp:include page="/WEB-INF/views/common/page.jsp"></jsp:include>
					</form>
                     
                </div>
            </div>
        </div>
        
		<!-- JS <img src="${base}/uploads/${productImages.product.title}" width="100" height="100">-->
		 <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
		<script type="text/javascript">
			$( document ).ready(function() {
				$("#paging").pagination({
					currentPage: ${productsWithPaging.currentPage},
			        items: ${productsWithPaging.totalPage},
			        itemsOnPage: 5,
			        cssStyle: 'compact-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');
					},
			    });
			});
		</script>
    </body>
</html>
