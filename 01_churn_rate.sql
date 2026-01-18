-- Churn Rate by Tenure Segment

SELECT
  CASE
    WHEN tenure <= 12 THEN 'New'
    WHEN tenure <= 36 THEN 'Mid'
    ELSE 'Long-term'
  END AS segment,
  ROUND(AVG(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate,
  COUNT(*) AS customers
FROM customers
GROUP BY segment
ORDER BY churn_rate DESC;
