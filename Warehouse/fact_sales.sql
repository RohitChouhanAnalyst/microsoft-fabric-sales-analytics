CREATE TABLE [analytics].[fact_sales] (

	[OrderID] varchar(8000) NULL, 
	[customer_key] bigint NULL, 
	[product_key] bigint NULL, 
	[region_key] bigint NULL, 
	[status_key] bigint NULL, 
	[date_key] int NULL, 
	[Revenue] float NULL, 
	[Quantity] int NULL, 
	[RevenueUSD] decimal(18,2) NULL
);