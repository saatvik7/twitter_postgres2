-- indexes to be created for the denormalized database

CREATE INDEX tweets_jsonb_idx_hashtags ON tweets_jsonb USING gin(((data->'entities'::text) -> 'hashtags'::text));

CREATE INDEX tweets_jsonb_idx_exthashtags ON tweets_jsonb USING gin((((data->'extended_tweet'::text) -> 'entities'::text) -> 'hashtags'::text));

CREATE INDEX tweets_jsonb_idx_fts ON tweets_jsonb USING gin (to_tsvector('english', COALESCE((data -> 'extended_tweet' ->> 'full_text'), (data ->> 'text'))));


