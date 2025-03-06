echo "Uploading raw data to S3..."
python extract/s3_to_emr.py

echo "Processing data using Spark..."
spark-submit transform/process_data.py

echo "Loading data to Snowflake..."
python load/emr_to_snowflake.py

echo "Running dbt transformations..."
dbt run --profiles-dir dbt_project

echo "Pipeline execution complete."
