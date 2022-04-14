SET sql_safe_updates=0;
delete from tbl_products_images;
delete from tbl_products;
delete from tbl_category where parent_id is not null;
delete from tbl_category;
delete from tbl_saleorder_products;
delete from tbl_saleorder;