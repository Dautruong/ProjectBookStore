function SaveContact(){

	//data lay du lieu ma day len action cua controller
	let data ={
		name : $("#name").val(),
		email: jQuery("#email").val(),
		
	};
	//$ === jQuery
	// json == javascript object
	jQuery.ajax({
		url:"/ajax/contact",	//->action
		type:"post",
		contentType : "application/json",
		data:JSON.stringify(data),
		
		dataType:"json",//Kieu du lieu tra ve tu controller la json
		
		success: function(jsonResult){
			alert("Da lu thanh cong dia chi email "+ jsonResult.message.email);
		},
		error: function(jqXhr, textStatus, errorMessage){//errorcallback
		}
	});
}

/*!
* Start Bootstrap - Simple Sidebar v6.0.3 (https://startbootstrap.com/template/simple-sidebar)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-simple-sidebar/blob/master/LICENSE)
*/
// 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});
