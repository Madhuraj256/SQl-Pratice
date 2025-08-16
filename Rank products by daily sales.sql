-- Rank products by daily sales
SELECT
  sale_date,
  product_id,
  SUM(sale_amount) AS total_sales,
  RANK() OVER (PARTITION BY sale_date ORDER BY SUM(sale_amount) DESC) AS daily_rank
FROM
  sales_table
GROUP BY
  sale_date, product_id;