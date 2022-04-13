<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple Sidebar - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
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
                    <h1 class="mt-4">Simple Sidebar</h1>
                   
                </div>
            </div>
        </div>
        	<!-- Bootstrap core JS-->
       	 	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
    </body>
</html>

