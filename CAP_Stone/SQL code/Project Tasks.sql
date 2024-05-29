--Task for DAILY_AGGREGATED_SALES.

CREATE OR REPLACE TASK tpcds.intermediate.creating_daily_aggregated_sales_incrementally
    WAREHOUSE = COMPUTE_WH
    SCHEDULE = 'USING CRON * 8 * * * UTC'
    AS
CALL populating_daily_aggregated_sales_incrementally();



--Task for WEEKLY_SALES_INVENTORY 

CREATE OR REPLACE TASK tpcds.ANALYTICS.creating_weekly_aggregated_sales_incrementally
    WAREHOUSE = COMPUTE_WH
    SCHEDULE = 'USING CRON * 8 * * * UTC'
    AS
CALL populating_weekly_aggregated_sales_incrementally();



--Task for Customer

CREATE OR REPLACE TASK TPCDS.ANALYTICS.creating_customer_dimension_using_scd_type_2
    WAREHOUSE = COMPUTE_WH
    SCHEDULE = 'USING CRON * 8 * * * UTC'
    AS
CALL populating_customer_dimension_using_scd_type_2();




--ALTER TASK tpcds.intermediate.creating_daily_aggregated_sales_incrementally RESUME;
ALTER TASK tpcds.intermediate.creating_daily_aggregated_sales_incrementally RESUME;

ALTER TASK tpcds.analytics.creating_weekly_aggregated_sales_incrementally RESUME;

ALTER TASK tpcds.analytics.creating_customer_dimension_using_scd_type_2 RESUME;

EXECUTE TASK tpcds.intermediate.creating_daily_aggregated_sales_incrementally;

EXECUTE TASK tpcds.analytics.creating_weekly_aggregated_sales_incrementally;

EXECUTE TASK tpcds.analytics.creating_customer_dimension_using_scd_type_2;


