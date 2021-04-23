
-- indexes to be created
CREATE INDEX tweet_tags_idx_tagid ON tweet_tags(tag, id_tweets);

CREATE INDEX tweet_tags_idx_id ON tweet_tags(id_tweets);

CREATE INDEX tweets_idx_id ON tweets(id_tweets);

CREATE INDEX tweets_idx_fts ON tweets USING gin(to_tsvector('english', text));

CREATE INDEX tweets_idx_idlang ON tweets(id_tweets, lang);
