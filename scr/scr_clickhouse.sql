CREATE TABLE IF NOT EXISTS default.data_mart_shop_sales (
    "sales_month" UInt32,
    "shop_name" String,
    "product_name" String,
    "sales_fact" UInt32,
    "sales_plan" UInt32,
    "sales_fact/sales_plan" Float32,
    "income_fact" Float32,
    "income_plan" Float32,
    "income_fact/income_plan" Float32
)
ENGINE = PostgreSQL('postgres:5432', 'testdb', 'data_mart_shop_sales', 'postgres', 'postgres');
