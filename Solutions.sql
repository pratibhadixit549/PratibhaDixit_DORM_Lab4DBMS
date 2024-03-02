-- Problem Statement
-- You are part of a team which is involved in developing an E-Commerce Website. 
-- The E-commerce website manages its data in the Database..




-- 1) You are required to create tables for 
-- supplier,customer,category,product,supplier_pricing,order,rating to store the data 
-- for the E-commerce with the schema definition given below.

create database if not exists ecommerce;
use ecommerce;



-- 2) You are required to develop SQL based programs (Queries) to facilitate the Admin 
-- team of the E-Commerce company to retrieve the data in summarized format - The Data Retrieval needs 
-- are described below.

CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50),
    SUPP_PHONE VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer (
    CUS_ID INT NOT NULL,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR,
    PRIMARY KEY (CUS_ID)
);

CREATE TABLE IF NOT EXISTS category (
    CAT_ID INT NOT NULL,
    CAT_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT NOT NULL,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT NOT NULL,
    PRIMARY KEY (PRO_ID),
    FOREIGN KEY (CAT_ID)
        REFERENCES CATEGORY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
    PRICING_ID INT NOT NULL,
    PRO_ID INT NOT NULL,
    SUPP_ID INT NOT NULL,
    SUPP_PRICE INT DEFAULT 0,
    PRIMARY KEY (PRICING_ID),
    FOREIGN KEY (PRO_ID)
        REFERENCES PRODUCT (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES SUPPLIER (SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order` (
    ORD_ID INT NOT NULL,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE,
    CUS_ID INT NOT NULL,
    PRICING_ID INT NOT NULL,
    PRIMARY KEY (ORD_ID),
    FOREIGN KEY (CUS_ID)
        REFERENCES CUSTOMER (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES SUPPLIER_PRICING (PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating (
    RAT_ID INT NOT NULL,
    ORD_ID INT NOT NULL,
    RAT_RATSTARS INT NOT NULL,
    PRIMARY KEY (RAT_ID),
    FOREIGN KEY (ORD_ID)
        REFERENCES `order` (ORD_ID)
); 



-- 3) Insert the following data in the table created above

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);



-- 4) Display the total number of customers based on gender 
-- who have placed individual orders of worth at least Rs.3000.

SELECT 
    C_O.CUS_GENDER AS 'Gender',
    COUNT(C_O.CUS_GENDER) AS 'NoOfCustomers'
FROM
    (SELECT 
        c.cus_id, c.cus_name, c.cus_gender
    FROM
        customer c
    INNER JOIN `order` o ON c.cus_id = o.cus_id
    WHERE
        o.ORD_AMOUNT >= 3000
    GROUP BY c.cus_id) AS C_O
GROUP BY C_O.cus_gender;



-- 5) Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT 
    o.cus_id,
    o.ord_id,
    o.ORD_AMOUNT,
    o.ORD_DATE,
    sp.SUPP_PRICE,
    p.PRO_NAME
FROM
    `order` o
        INNER JOIN
    supplier_pricing sp
        INNER JOIN
    product p ON (o.PRICING_ID = sp.PRICING_ID
        AND sp.PRO_ID = p.PRO_ID)
WHERE
    o.CUS_Id = 2;



-- 6) Display the Supplier details who can supply more than one product.

SELECT 
    s.*, NoOfProducts_Supplied
FROM
    supplier s
        INNER JOIN
    (SELECT 
        supp_id, COUNT(pro_id) AS NoOfProducts_Supplied
    FROM
        supplier_pricing
    GROUP BY supp_id
    HAVING NoOfProducts_Supplied > 1) AS sp ON s.supp_id = sp.supp_id;



-- 7) Find the least expensive product from each category and print the table with 
-- category id, name, product name and price of the product

SELECT 
    P_SP.*
FROM
    category C
        INNER JOIN
    (SELECT 
        P.cat_id, P.pro_id, P.pro_name, Minimal_Product_Price
    FROM
        product P
    INNER JOIN (SELECT 
        pro_id, MIN(SUPP_PRICE) Minimal_Product_Price
    FROM
        supplier_pricing
    GROUP BY pro_id) AS SP ON p.PRO_ID = SP.PRO_ID) AS P_SP ON (C.CAT_ID = P_SP.CAT_ID);



-- 8) Display the Id and Name of the Product ordered after “2021-10-05”.

SELECT 
    p.pro_id, p.pro_name
FROM
    `order` o
        INNER JOIN
    supplier_pricing sp
        INNER JOIN
    product p ON (o.PRICING_ID = sp.PRICING_ID
        AND sp.PRO_ID = p.PRO_ID)
WHERE
    o.ORD_DATE >= '2021-10-05'
GROUP BY p.PRO_ID;



-- 9) Display customer name and gender whose names start or end with character 'A'.

SELECT 
    cus_id, cus_name
FROM
    ecommerce.customer
WHERE
    cus_name LIKE 'A%' OR cus_name LIKE '%A'



-- 10) Create a stored procedure to display supplier id, name, Rating(Average rating 
-- of all the products sold by every customer) and Type_of_Service. For Type_of_Service, 
-- If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print 
-- “Average Service” else print “Poor Service”. Note that there should be one rating per supplier.

-- Analysis
#===========
-- join [rating -> order -> supplier_pricing -> supplier]
-- supp_id, supp_name, order_infomration [ord_id], rating [order]
-- average rating [] avg(), group_by supp_id [] -> rating [supplier]
	-- supp_id, supp_name, avg_rating
    -- 5 records
-- add a pseudo column [Type_ofService]
	-- sql case []
    -- supp_id, supp_name, avg_rating, type_of_service
    -- 5 records
    
-- procedure
	-- display_supplier_rating_details

-- SQL Statement
#================
SELECT SUPP_ID, SUPP_NAME, AverageRating, 
	CASE
		WHEN AverageRating = 5 THEN 'Excellent Service'
        WHEN AverageRating > 4 THEN 'Good Service'
        WHEN AverageRating > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END As ServiceType
 FROM (
select s.SUPP_ID, s.SUPP_NAME, avg(r.RAT_RATSTARS) AverageRating
from rating r
	inner join `order` o
    inner join supplier_pricing sp
    inner join supplier s
on (
r.ORD_ID = o.ORD_ID AND
o.PRICING_ID = sp.PRICING_ID AND
sp.SUPP_ID = s.SUPP_ID
)
group by supp_id
) as R_O_SP_S;

-- Procedure
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplaySupplierRatingDetails`()
BEGIN
SELECT SUPP_ID, SUPP_NAME, AverageRating, 
	CASE
		WHEN AverageRating = 5 THEN 'Excellent Service'
        WHEN AverageRating > 4 THEN 'Good Service'
        WHEN AverageRating > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END As ServiceType
 FROM (
select s.SUPP_ID, s.SUPP_NAME, avg(r.RAT_RATSTARS) AverageRating
from rating r
	inner join `order` o
    inner join supplier_pricing sp
    inner join supplier s
on (
r.ORD_ID = o.ORD_ID AND
o.PRICING_ID = sp.PRICING_ID AND
sp.SUPP_ID = s.SUPP_ID
)
group by supp_id
) as R_O_SP_S;
END //


-- Call Procedure
#=================
call DisplaySupplierRatingDetails();

