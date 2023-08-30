CREATE TABLE IF NOT EXISTS public.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS public.shops (
    shop_id SERIAL PRIMARY KEY,
    shop_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.plan (
    plan_id SERIAL PRIMARY KEY,
    shop_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    plan_cnt INTEGER NOT NULL,
    plan_date DATE NOT NULL,
    FOREIGN KEY (shop_id) REFERENCES shops (shop_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.shop_dns (
    shop_dns_item SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    sales_cnt INTEGER NOT NULL,
    sales_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.shop_mvideo (
    shop_mvideo_item SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    sales_cnt INTEGER NOT NULL,
    sales_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.shop_sitilink (
    shop_sitilink_item SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    sales_cnt INTEGER NOT NULL,
    sales_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE
);
