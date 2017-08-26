$("#new_comment").before "<%= escape_javascript(render @comment, commentable: @commentable) %>"
