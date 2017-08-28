$("form").before "<%= escape_javascript(@result.to_json) %>"
