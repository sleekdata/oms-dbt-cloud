{% macro log_start_time(model_ref) %}
-- Pre-hook macro to log the model's start time in the audit table
INSERT INTO audit.model_runs (model_name, run_type, run_timestamp)
VALUES ('{{ model_ref }}', 'start', CURRENT_TIMESTAMP)
{% endmacro %}


{% macro log_end_time(model_ref) %}
-- Post-hook macro to log the model's end time in the audit table
INSERT INTO audit.model_runs (model_name, run_type, run_timestamp)
VALUES ('{{ model_ref }}', 'end', CURRENT_TIMESTAMP)
{% endmacro %}