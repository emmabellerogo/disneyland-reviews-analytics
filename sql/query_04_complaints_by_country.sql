-- Query 04: Find out which themes are most frequently complained about by reviewers from each country

SELECT 
  Reviewer_Location,
  theme, 
  COUNT(*) AS frequency
FROM `disneyland-metrics.disneyland_analytics.reviews_ca`, 
  UNNEST(Matched_Themes) AS theme 
WHERE Sentiment = 'Negative'
GROUP BY Reviewer_Location, theme
ORDER BY frequency DESC; 