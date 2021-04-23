/*
 * Calculates the languages that commonly use the hashtag #coronavirus
 */

SELECT lang, COUNT(DISTINCT id)
FROM (
	SELECT
	data ->> 'lang' AS lang,
	data -> 'id' AS id
	FROM tweets_jsonb
	WHERE (
		(data->'extended_tweet'::text -> 'entities'::text -> 'hashtags'::
		text) @> '[{"text":"coronavirus"}]' OR
		(data->'entities'::text -> 'hashtags'::text) @> '[{"text":
		"coronavirus"}]')
) t
GROUP BY (lang)
ORDER BY count DESC, lang;
