-- Cohort Retention

WITH cohorts AS (
    SELECT
        customer_id,
        CASE
            WHEN tenure <= 6 THEN '0-6 months'
            WHEN tenure <= 12 THEN '7-12 months'
            WHEN tenure <= 24 THEN '13-24 months'
            ELSE '24+ months'
        END AS cohort,
        churn
    FROM customers
)
SELECT
    cohort,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'No' THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(
        SUM(CASE WHEN churn = 'No' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS retention_pct
FROM cohorts
GROUP BY cohort
ORDER BY retention_pct DESC;


-- Code for PostgreSQL (If signup date column and user activity table is present)

With cohorts as(
select customer_id,
date_trunc(‘month’, signup_date) as cohort_month
From users),

Monthly_activity as(
Select c.cohort_month,
date_trunc(‘month’, a.activity_date) as activity_month
count(distinct a.customer_id) as active_users
From cohorts c
Join user_activity a
On c.customer_id = a.customer_id
Group by 1, 2
)

Select cohort_month,
activity_month,
active_users,
active_users * 100 / first_value(active_users) over(partition by cohort_month order by activity_month) as retention_pct
From monthly_activity
Order by cohort_month, activity_month;
