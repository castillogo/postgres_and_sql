
create view view_dummy as select orders."orderID" from orders join order_details on orders."orderID" = order_details."orderID" limit 5;
