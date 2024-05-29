-- *DDL*

-- [Creating database for Snowflake TPCDS]
CREATE OR REPLACE DATABASE SF_TPCDS;

CREATE OR REPLACE SCHEMA INTERMEDIATE; 

-- [Creating Customer Snapshot Table]
CREATE OR REPLACE TABLE SF_TPCDS.INTERMEDIATE.CUSTOMER_SNAPSHOT (
	C_SALUTATION VARCHAR(16777216),
	C_PREFERRED_CUST_FLAG VARCHAR(16777216),
	C_FIRST_SALES_DATE_SK NUMBER(38,0),
	C_CUSTOMER_SK NUMBER(38,0),
	C_LOGIN VARCHAR(16777216),
	C_CURRENT_CDEMO_SK NUMBER(38,0),
	C_FIRST_NAME VARCHAR(16777216),
	C_CURRENT_HDEMO_SK NUMBER(38,0),
	C_CURRENT_ADDR_SK NUMBER(38,0),
	C_LAST_NAME VARCHAR(16777216),
	C_CUSTOMER_ID VARCHAR(16777216),
	C_LAST_REVIEW_DATE_SK NUMBER(38,0),
	C_BIRTH_MONTH NUMBER(38,0),
	C_BIRTH_COUNTRY VARCHAR(16777216),
	C_BIRTH_YEAR NUMBER(38,0),
	C_BIRTH_DAY NUMBER(38,0),
	C_EMAIL_ADDRESS VARCHAR(16777216),
	C_FIRST_SHIPTO_DATE_SK NUMBER(38,0),
	START_DATE TIMESTAMP_NTZ(9),
	END_DATE TIMESTAMP_NTZ(9)
);

CREATE OR REPLACE SCHEMA ANALYTICS;


-- [Final Customer_Dim]
create or replace TABLE SF_TPCDS.ANALYTICS.CUSTOMER_DIM (
	C_SALUTATION VARCHAR(16777216),
	C_PREFERRED_CUST_FLAG VARCHAR(16777216),
	C_FIRST_SALES_DATE_SK NUMBER(38,0),
	C_CUSTOMER_SK NUMBER(38,0),
	C_LOGIN VARCHAR(16777216),
	C_CURRENT_CDEMO_SK NUMBER(38,0),
	C_FIRST_NAME VARCHAR(16777216),
	C_CURRENT_HDEMO_SK NUMBER(38,0),
	C_CURRENT_ADDR_SK NUMBER(38,0),
	C_LAST_NAME VARCHAR(16777216),
	C_CUSTOMER_ID VARCHAR(16777216),
	C_LAST_REVIEW_DATE_SK NUMBER(38,0),
	C_BIRTH_MONTH NUMBER(38,0),
	C_BIRTH_COUNTRY VARCHAR(16777216),
	C_BIRTH_YEAR NUMBER(38,0),
	C_BIRTH_DAY NUMBER(38,0),
	C_EMAIL_ADDRESS VARCHAR(16777216),
	C_FIRST_SHIPTO_DATE_SK NUMBER(38,0),
	CA_STREET_NAME VARCHAR(16777216),
	CA_SUITE_NUMBER VARCHAR(16777216),
	CA_STATE VARCHAR(16777216),
	CA_LOCATION_TYPE VARCHAR(16777216),
	CA_COUNTRY VARCHAR(16777216),
	CA_ADDRESS_ID VARCHAR(16777216),
	CA_COUNTY VARCHAR(16777216),
	CA_STREET_NUMBER VARCHAR(16777216),
	CA_ZIP VARCHAR(16777216),
	CA_CITY VARCHAR(16777216),
	CA_GMT_OFFSET FLOAT,
	CD_DEP_EMPLOYED_COUNT NUMBER(38,0),
	CD_DEP_COUNT NUMBER(38,0),
	CD_CREDIT_RATING VARCHAR(16777216),
	CD_EDUCATION_STATUS VARCHAR(16777216),
	CD_PURCHASE_ESTIMATE NUMBER(38,0),
	CD_MARITAL_STATUS VARCHAR(16777216),
	CD_DEP_COLLEGE_COUNT NUMBER(38,0),
	CD_GENDER VARCHAR(16777216),
	HD_BUY_POTENTIAL VARCHAR(16777216),
	HD_DEP_COUNT NUMBER(38,0),
	HD_VEHICLE_COUNT NUMBER(38,0),
	HD_INCOME_BAND_SK NUMBER(38,0),
	IB_LOWER_BOUND NUMBER(38,0),
	IB_UPPER_BOUND NUMBER(38,0),
	START_DATE TIMESTAMP_NTZ(9),
	END_DATE TIMESTAMP_NTZ(9)
);


create or replace TABLE SF_TPCDS.ANALYTICS.WEEKLY_SALES_INVENTORY (
    WAREHOUSE_SK NUMBER(38,0),
	ITEM_SK NUMBER(38,0),
	SOLD_WK_SK NUMBER(38,0),
	SOLD_WK_NUM NUMBER(38,0),
	SOLD_YR_NUM NUMBER(38,0),
	SUM_QTY_WK NUMBER(38,0),
	SUM_AMT_WK FLOAT,
	SUM_PROFIT_WK FLOAT,
	AVG_QTY_DY NUMBER(38,6),
	INV_QTY_WK NUMBER(38,0),
	WKS_SPLY NUMBER(38,6),
	LOW_STOCK_FLG_WK BOOLEAN
);

create or replace TABLE SF_TPCDS.INTERMEDIATE.DAILY_AGGREGATED_SALES (
	WAREHOUSE_SK NUMBER(38,0),
	ITEM_SK NUMBER(38,0),
    SOLD_DATE_SK NUMBER(38,0),
    SOLD_WK_NUM NUMBER(38,0),
    SOLD_YR_NUM NUMBER(38,0),
	DAILY_QTY NUMBER(38,0),
	DAILY_SALES_AMT FLOAT,
	DAILY_NET_PROFIT FLOAT
);