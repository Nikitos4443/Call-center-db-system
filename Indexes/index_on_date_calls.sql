CREATE INDEX idx_on_date_calls ON calls USING btree (date);

DROP INDEX idx_on_date_calls;