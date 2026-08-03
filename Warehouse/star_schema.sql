CREATE TABLE analytics.dim_customer
AS
SELECT
    ROW_NUMBER() OVER(ORDER BY CustomerName) AS customer_key,
    CustomerName AS customer_name
FROM
(
    SELECT DISTINCT CustomerName
    FROM staging.silver_sales
) c;
CREATE TABLE analytics.dim_product
AS
SELECT
    ROW_NUMBER() OVER(ORDER BY ProductCategory) AS product_key,
    ProductCategory AS product_category
FROM
(
    SELECT DISTINCT ProductCategory
    FROM staging.silver_sales
) p;
CREATE TABLE analytics.dim_region
AS
SELECT
    ROW_NUMBER() OVER(ORDER BY Region) AS region_key,
    Region
FROM
(
    SELECT DISTINCT Region
    FROM staging.silver_sales
) r;
CREATE TABLE analytics.dim_status
AS
SELECT
    ROW_NUMBER() OVER(ORDER BY Status) AS status_key,
    Status
FROM
(
    SELECT DISTINCT Status
    FROM staging.silver_sales
) s;
CREATE TABLE analytics.dim_date
AS
SELECT DISTINCT

    (YEAR(OrderDate) * 10000) +
    (MONTH(OrderDate) * 100) +
     DAY(OrderDate) AS date_key,

    OrderDate AS full_date,

    YEAR(OrderDate) AS year,

    DATEPART(QUARTER, OrderDate) AS quarter,

    MONTH(OrderDate) AS month_number,

    DAY(OrderDate) AS day_number,

    DATEPART(WEEKDAY, OrderDate) AS weekday_number,

    CASE
        WHEN DATEPART(WEEKDAY, OrderDate) IN (1,7)
        THEN 1
        ELSE 0
    END AS is_weekend

FROM staging.silver_sales;
CREATE TABLE analytics.fact_sales
AS

SELECT

    s.OrderID,

    dc.customer_key,

    dp.product_key,

    dr.region_key,

    ds.status_key,

    dd.date_key,

    s.Revenue,

    s.Quantity

FROM staging.silver_sales s

JOIN analytics.dim_customer dc
ON s.CustomerName = dc.customer_name

JOIN analytics.dim_product dp
ON s.ProductCategory = dp.product_category

JOIN analytics.dim_region dr
ON s.Region = dr.Region

JOIN analytics.dim_status ds
ON s.Status = ds.Status

JOIN analytics.dim_date dd
ON s.OrderDate = dd.full_date;
