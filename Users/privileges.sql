GRANT CREATE, USAGE ON SCHEMA public TO db_administrator;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO db_administrator;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO db_administrator;

GRANT USAGE ON SCHEMA public TO call_operator;
GRANT SELECT ON issue_solutions, issues, issue_categories  TO call_operator;

GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO call_manager;
GRANT USAGE ON SCHEMA public TO call_manager;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO call_manager;
