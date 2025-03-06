# Cloud-Based ETL Pipeline with AWS and Snowflake

## Overview
This ETL pipeline extracts data from AWS S3, processes it using PySpark on AWS EMR, and loads it into Snowflake. dbt is used for additional transformations.

## Architecture
1. **Extract:** Raw data is uploaded to an S3 bucket.
2. **Transform:** PySpark running on AWS EMR processes the data.
3. **Load:** The transformed data is stored in Snowflake.
4. **Automate:** dbt runs further transformations inside Snowflake.

## Prerequisites
- AWS account with S3, EMR, and IAM permissions
- Snowflake account with configured warehouse, schema, and database
- Python 3 installed
- dbt installed (`pip install dbt-snowflake`)

## Steps to Run
1. Configure credentials in `config/config.py`.
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Execute the pipeline:
   ```bash
   bash deploy.sh
   ```

## File Structure
```
cloud-etl-pipeline/
│── extract/
│   ├── s3_to_emr.py
│── transform/
│   ├── process_data.py
│── load/
│   ├── emr_to_snowflake.py
│── dbt_project/
│   ├── models/
│   │   ├── staging/
│   │   │   ├── staging_table.sql
│   │   ├── transformations/
│   │   │   ├── final_transformation.sql
│── config/
│   ├── config.py
│── requirements.txt
│── README.md
│── deploy.sh
```
