-- KPI 1: Overall conversion rate
SELECT
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN is_conversion = 1 THEN 1 ELSE 0 END) AS total_conversions,
    SUM(CASE WHEN is_conversion = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS conversion_rate_pct
FROM retail_user_behavior_100k;

-- KPI 2: Total revenue by category
SELECT category, SUM(price) AS total_revenue
FROM retail_user_behavior_100k
GROUP BY category
ORDER BY total_revenue DESC;

-- KPI 3: Daily session trends
SELECT DATE(timestamp_utc) AS session_date, COUNT(*) AS daily_sessions
FROM retail_user_behavior_100k
GROUP BY session_date
ORDER BY session_date DESC;

-- KPI 4: Conversion rate by channel
SELECT channel,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN is_conversion = 1 THEN 1 ELSE 0 END) AS total_conversions,
    SUM(CASE WHEN is_conversion = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS conversion_rate_pct
FROM retail_user_behavior_100k
GROUP BY channel
ORDER BY conversion_rate_pct DESC;
