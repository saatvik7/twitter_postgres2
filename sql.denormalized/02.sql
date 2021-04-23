/*
 * Calculates the hashtags that are commonly used with the hashtag #coronavirus
 */
SELECT '#' || tags AS tag,
COUNT(distinct id) FROM
      (
	SELECT
	jsonb_array_elements(COALESCE((data->'extended_tweet'::text -> 'entities'::
	text -> 'hashtags'), (data->'entities'::text -> 'hashtags' )))->>'text'
	AS tags,
	data->'id' AS id
	FROM tweets_jsonb
	WHERE
	(data->'extended_tweet'::text -> 'entities'::text -> 'hashtags'::text) @>
	'[{"text":"coronavirus"}]' OR
	(data->'entities'::text -> 'hashtags'::text) @> '[{"text":"coronavirus"}]'
      ) t
GROUP BY (1)
ORDER BY count DESC, tag
limit 1000;

