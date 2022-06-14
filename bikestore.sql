--join queries

--productname and brand name from product 
SELECT product_name,brand_name FROM production.products p
INNER JOIN production.brands b ON p.brand_id=b.brand_id;


--product_name,brand_name,category_name from products
SELECT product_name,brand_name,category_name FROM production.products p
INNER JOIN production.brands b ON p.brand_id=b.brand_id
INNER JOIN production.categories c ON c.category_id=p.category_id;

--product_name,brand_name,category_name from products where category_name=mountainbikes
SELECT product_name,brand_name,category_name FROM production.products p
INNER JOIN production.brands b ON p.brand_id=b.brand_id
INNER JOIN production.categories c ON c.category_id=p.category_id WHERE category_name='mountain bikes';

--outer join