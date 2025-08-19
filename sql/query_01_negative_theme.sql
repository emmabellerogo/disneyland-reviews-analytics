-- Query 1: Find out which themes are most commonly mentioned in reviews where the sentiment is negative 

SELECT
  theme, 
  COUNT(*) AS Negative_Review_Count 
FROM `disneyland-metrics.disneyland_analytics.reviews_ca`, 
  UNNEST(Matched_Themes) AS theme
WHERE 
  Sentiment = 'Negative'
GROUP BY theme
ORDER BY Negative_Review_Count DESC;