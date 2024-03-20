CREATE TABLE geography
(
 geo_id      INT NOT NULL,
 Country     varchar(20) NOT NULL,
 City        varchar(20) NOT NULL,
 state     varchar(20) NOT NULL,
 Region      varchar(50) NOT NULL,
 Postal_code int NOT NULL

);


CREATE TABLE shipping
(
 ship_id   int NOT NULL,
 Ship_mode varchar(20) NOT NULL

);

drop table calendar
CREATE TABLE calendar
(
 date    date NOT NULL,
 year     int NOT NULL,
 quater   varchar(5) NOT NULL,
 month    int NOT NULL,
 week_day int NOT NULL

);


insert into shipping 
select 100+row_number() over (), ship_mode from (select distinct ship_mode from orders);

select * from shipping; 

INSERT INTO geography (geo_id, country, city, state, region, postal_code)
SELECT 
    200+row_number() over (),
    o.country,
    o.city,
    o.state,
    o.region,
    postal_codes.postal_code
FROM 
    (SELECT DISTINCT postal_code FROM orders) AS postal_codes
    JOIN (SELECT DISTINCT postal_code, country, city, state, region FROM orders) AS o ON postal_codes.postal_code = o.postal_code;

truncate table calendar
   
insert into calendar
select order_date, extract("year" from order_date), extract(quarter from order_date) as quater,
extract("month" from order_date),extract(isodow from order_date)
from orders
   
   
CREATE TABLE product
(
 product_id    varchar(25) NOT NULL,
 category     varchar(25) NOT NULL,
 subcategory varchar(25) NOT NULL,
 segment      varchar(25) NOT NULL,
 product_name varchar(127) NOT NULL

);
   


INSERT INTO product (product_id, category, subcategory, segment, product_name)
SELECT 
    products_ids.product_id,
    o.category,
    o.subcategory,
    o.segment,
    o.product_name
FROM 
    (SELECT DISTINCT product_id FROM orders) AS products_ids
    JOIN (SELECT DISTINCT product_id, category, subcategory, segment, product_name FROM orders) AS o ON products_ids.product_id = o.product_id;



CREATE TABLE sales_fact
(
 row_id        int NOT NULL,
 order_id     varchar(20) NOT NULL,
 sales_amount numeric(9,4) NOT NULL,
 profit       numeric(21,16) NOT NULL,
 discount     varchar(25) NOT NULL,
 quantity     int NOT NULL,
 date       date NOT NULL,
 geo_id       int NOT NULL,
 ship_id      int NOT NULL,
 product_id    varchar(25) NOT NULL

);

CREATE INDEX FK_1 ON sales_fact
(
 date
);

CREATE INDEX FK_2 ON sales_fact
(
 geo_id
);

CREATE INDEX FK_3 ON sales_fact
(
 ship_id
);

CREATE INDEX FK_4 ON sales_fact
(
 product_id
);
