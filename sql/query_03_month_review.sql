-- Query 3: See how the frequency of compliant themes change from month-to-month

SELECT 
  Review_Month, 
  theme, 
  COUNT(*) AS frequency
FROM `disneyland-metrics.disneyland_analytics.reviews_ca`, 
  UNNEST(Matched_Themes) AS theme
WHERE Review_Month IS NOT NULL
GROUP BY Review_Month, theme
ORDER BY Review_Month, frequency DESC; 