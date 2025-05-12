/*
=======================================================================
  Script: Raw Data Layer Table Creation and Data Ingestion
  Description:
    This script creates raw tables under the Raw_Layer schema
    for both CRM and ERP source data, then bulk loads CSV files 
    into the respective tables.
=======================================================================
*/

CREATE TABLE Raw_Layer.crm_cust_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastdname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);

CREATE TABLE Raw_Layer.crm_prd_info(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);

CREATE TABLE Raw_Layer.crm_sales_details(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_id INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

CREATE TABLE Raw_Layer.erp_loc_a101(
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);

CREATE TABLE Raw_Layer.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50)
);

CREATE TABLE Raw_Layer.erp_px_cat_g1v2(
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);

BULK INSERT Raw_Layer.crm_cust_info
FROM 'C:\dwh\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

DROP TABLE IF EXISTS Raw_Layer.crm_prd_info;

CREATE TABLE Raw_Layer.crm_prd_info( 
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(100),
	prd_cost NVARCHAR(20),         -- was INT, now NVARCHAR to accept blanks if you have other method kindly drop i'm so nobe
	prd_line NVARCHAR(10),
	prd_start_dt DATETIME,     
	prd_end_dt DATETIME
);

BULK INSERT Raw_Layer.crm_prd_info
FROM 'C:\dwh\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',  
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	TABLOCK
);

BULK INSERT Raw_Layer.crm_sales_details
FROM 'C:\dwh\datasets\source_crm\sales_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

BULK INSERT Raw_Layer.erp_loc_a101
FROM 'C:\dwh\datasets\source_erp\loc_a101.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

BULK INSERT Raw_Layer.erp_cust_az12
FROM 'C:\dwh\datasets\source_erp\cust_az12.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

BULK INSERT Raw_Layer.erp_px_cat_g1v2
FROM 'C:\dwh\datasets\source_erp\px_cat_g1v2.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

