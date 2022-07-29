-- добавьте код сюда

CREATE OR REPLACE VIEW analysis.users AS 
select  id, 
        name, 
        login
from production.users;

CREATE OR REPLACE VIEW analysis.products AS 
select id, 
       name, 
       price
from production.products;

CREATE OR REPLACE VIEW analysis.orderitems AS 
select id,
       product_id,
       order_id,
       name,
       price,
       discount,
       quantity
from production.orderitems;

CREATE OR REPLACE VIEW analysis.orders AS 
select  order_id,
        order_ts,
        user_id,
        bonus_payment,
        payment,
        cost,
        bonus_grant,
        status
from production.orders;

CREATE OR REPLACE VIEW analysis.orderstatuslog AS 
select  id,
        order_id,
        status_id,
        dttm
from production.orderstatuslog;


CREATE OR REPLACE VIEW analysis.orderstatuses AS 
select  id,
        key
from production.orderstatuses; 



