— RFM Segmentation

WITH rfm AS (
    SELECT
        customer_id,
        churn,
        NTILE(5) OVER (ORDER BY tenure ASC) AS recency,
        NTILE(5) OVER (ORDER BY monthly_charges ASC) AS frequency,
        NTILE(5) OVER (ORDER BY total_charges ASC) AS monetary
    FROM customers
)
SELECT
    recency,
    frequency,
    monetary,
    COUNT(*) AS customer_count,
    ROUND(AVG(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate
FROM rfm
GROUP BY recency, frequency, monetary
ORDER BY churn_rate DESC;