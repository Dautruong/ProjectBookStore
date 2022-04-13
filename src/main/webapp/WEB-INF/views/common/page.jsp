
<link href="${base}/css/simplePagination.css" rel="stylesheet" />
<!-- Paging -->
<div class="row">
	<div class="col-12 d-flex justify-content-center">
		<div id="paging"></div>
	</div>
</div>
<script type="text/javascript">
	$( document ).ready(function() {
		$("#paging").pagination({
			currentPage: ${productsWithPaging.currentPage},
	        items: ${productsWithPaging.totalPage},
	        itemsOnPage: 6,
	        cssStyle: 'compact-theme',
	        onPageClick: function(pageNumber, event) {
	        	$('#page').val(pageNumber);
	        	$('#btnSearch').trigger('click');
			},
	    });
	});
</script>