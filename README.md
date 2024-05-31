# Inventory Data Pipeline with Snowflake and AWS Lambda

This project involves an ETL (Extract, Transform, Load) process to manage and analyze inventory data. The data pipeline downloads inventory data from an API, uploads it to Snowflake, and provides insights through Metabase. The primary goals include analyzing sales amounts and quantities of the highest performing items of the week, detecting items with low stock levels, and displaying items with low supply levels for each week.

## Table of Contents

- [Prerequisites](#prerequisites)

- [Architecture](#architecture)

- [Setup](#setup)

- [Lambda Function](#lambda-function)

- [Snowflake Procedures](#snowflake-procedures)

- [Visualization](#visualization)

- [Usage](#usage)


## Prerequisites

- AWS account with permissions to create and manage Lambda functions

- Snowflake account

- Metabase instance for data visualization

- Python 3.x

- `boto3`, `requests`, `snowflake-connector-python` libraries

## Architecture

**Data Ingestion:**

*AWS Lambda*: Downloads inventory data from an API and uploads it to Snowflake.
*Airbyte*: Extracts inventory data from various sources.
    
**Data Transformation**

*Snowflake*: Stores and processes the inventory data.

**Data Analyzation**

*Metabase*: Visualizes the processed data.

## Setup

### Environment Variables

Set the following environment variables in your AWS Lambda function configuration:

- `S3_SOURCE`: URL of the inventory data API.

- `ACCOUNT`: Snowflake account identifier.

- `WAREHOUSE`: Snowflake warehouse name.

- `USER`: Snowflake user name.

- `PASSWORD`: Snowflake password.

- `ROLE`: Snowflake role.

### Install Dependencies

Install the required Python libraries:

```pip install boto3 requests snowflake-connector-python```

### Deploy Lambda Function

Deploy the Lambda function using the AWS Management Console or AWS CLI.

Lambda Function
---------------

The Lambda function performs the following steps:

1.  **Download Data**: Fetches inventory data from the specified API endpoint.
    
2.  **Save Data**: Saves the data to a temporary file in the /tmp directory.
    
3.  **Snowflake Connection**: Connects to Snowflake using provided credentials.
    
4.  **Stage Data**: Uploads the data to a Snowflake stage.
    
5.  **Load Data**: Copies the staged data into the Snowflake inventory table.
    
6.  **Clean Up**: Truncates the table before loading new data.
    

Snowflake Procedures
--------------------

The Snowflake procedures are responsible for:

*   Aggregating daily sales data.
    
*   Incrementally updating weekly sales data.
    
*   Creating a customer dimension using SCD type 2.
    

Visualization
-------------

Using Metabase, you can visualize:

*   Highest performing items of the week by analyzing sales amounts and quantities.
    
*   Items experiencing low stock levels along with their corresponding week and warehouse numbers.
    
*   Items with low supply levels for each week.
    

Usage
-----

1.  **Schedule Lambda Function**: Schedule the Lambda function to run at your preferred interval using CloudWatch Events.
    
2.  **Monitor Data**: Use Metabase to create dashboards and monitor the inventory data.

