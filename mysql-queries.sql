CREATE DATABASE b2b_saas_analytics;
USE b2b_saas_analytics;
CREATE TABLE b2b_saas_marketing_data (
    date DATE,
    channel VARCHAR(50),
    campaign_name VARCHAR(100),
    spend DECIMAL(10,2),
    impressions INT,
    clicks INT,
    signups INT,
    trial_starts INT,
    paid_conversions INT,
    revenue INT
);
SELECT * FROM b2b_saas_analytics.b2b_saas_marketing_data;

SELECT
  channel,
  SUM(spend) AS total_spend,
  SUM(revenue) AS total_revenue,
  ROUND(SUM(revenue) / NULLIF(SUM(spend), 0), 2) AS roas
FROM b2b_saas_marketing_data
GROUP BY channel
ORDER BY roas DESC;
SELECT
  channel,
  SUM(spend) AS total_spend,
  SUM(paid_conversions) AS paid_customers,
  ROUND(SUM(spend) / NULLIF(SUM(paid_conversions), 0), 2) AS cac
FROM b2b_saas_marketing_data
GROUP BY channel
ORDER BY cac ASC;