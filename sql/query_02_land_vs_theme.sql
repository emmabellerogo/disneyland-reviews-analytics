-- Query 2: Identify which Disneyland lands are associated with which complaint themes 
SELECT 
  theme, 
  land, 
  COUNT(*) AS frequency
FROM `disneyland-metrics.disneyland_analytics.reviews_ca`, 
  UNNEST(Matched_Themes) AS theme, 
  UNNEST(Matched_Lands) AS land
GROUP BY land, theme
ORDER BY frequency DESC;