-- Query 5: For each country, find the single most-mentioned theme in positive reviews 

WITH theme_counts AS (
  SELECT Reviewer_Location, 
  theme, 
  COUNT(*) AS frequency
  FROM `disneyland-metrics.disneyland_analytics.reviews_ca`, 
    UNNEST(Matched_Themes) AS theme 
  WHERE Sentiment = 'Positive'
  GROUP BY Reviewer_Location, theme
)

SELECT 
  Reviewer_Location,
  theme, 
  frequency
FROM (
  SELECT *, 
  ROW_NUMBER() OVER (
    PARTITION BY Reviewer_Location 
    ORDER BY frequency DESC
  ) as rn 
  FROM theme_counts
)
WHERE rn = 1
ORDER BY frequency DESC;
