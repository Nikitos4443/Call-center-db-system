CREATE INDEX idx_on_call_id ON issues USING btree (call_id);

DROP INDEX idx_on_call_id;