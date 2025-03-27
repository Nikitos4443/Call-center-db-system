CREATE INDEX idx_on_duration_call ON calls USING btree (duration);

DROP INDEX idx_on_duration_call;