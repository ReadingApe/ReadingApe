$("form").before "<pre><code><%= escape_javascript(@result.to_yaml) %></code></pre><hr />"
