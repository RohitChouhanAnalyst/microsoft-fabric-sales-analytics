CREATE TABLE [analytics].[dim_date] (

	[date_key] int NULL, 
	[full_date] date NULL, 
	[year] int NULL, 
	[quarter] int NULL, 
	[month_number] int NULL, 
	[day_number] int NULL, 
	[weekday_number] int NULL, 
	[is_weekend] int NOT NULL
);