# The including location must define: set $context_path /service;
proxy_set_header X-Forwarded-Prefix $context_path;
proxy_set_header X-Script-Name $context_path;
proxy_redirect / $context_path/;
