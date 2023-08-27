WITH total_shop_sales AS (
    SELECT product_id, sales_cnt, sales_date, (SELECT shop_id FROM shops WHERE shop_name = 'DNS')
    FROM shop_dns
    UNION SELECT product_id, sales_cnt, sales_date, (SELECT shop_id FROM shops WHERE shop_name = 'MVIDEO')
    FROM shop_mvideo
    UNION SELECT product_id, sales_cnt, sales_date, (SELECT shop_id FROM shops WHERE shop_name = 'SITILINK')
    FROM shop_sitilink
)

SELECT s.shop_name,
       pr.product_name,
       toMonth(tss.sales_date) sales_month,
       SUM(tss.sales_cnt) sales_fact,
       SUM(p.plan_cnt) sales_plan,
       SUM(tss.sales_cnt::REAL) / SUM(p.plan_cnt) "sales_fact/sales_plan",
       SUM(pr.price * tss.sales_cnt) income_fact,
	     SUM(pr.price * p.plan_cnt) income_plan,
	     SUM(pr.price * tss.sales_cnt) / SUM(pr.price * p.plan_cnt) "income_fact/income_plan"
FROM plan p
JOIN shops s ON p.shop_id = s.shop_id
JOIN total_shop_sales tss ON p.shop_id = tss.shop_id AND p.product_id = tss.product_id AND p.plan_date = (date_trunc('month', tss.sales_date) + interval '1 month -1 day')::date
JOIN products pr ON p.product_id = pr.product_id
GROUP BY sales_month, shop_name, product_name
ORDER BY shop_name, product_name;