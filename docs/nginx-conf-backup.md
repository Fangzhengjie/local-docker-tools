# Nginx conf.d 配置备份

目录路径：`C:\Users\vn54359\volume\nginx\conf.d\`

证书路径说明：
- 应用服务证书：`/etc/nginx/certs/local.dev.crt` / `.key`
- DevTools 证书：`/etc/nginx/certs/docker-services.crt` / `.key`

---

## 应用服务（代理到宿主机）

### fastapi.conf
```nginx
server {
    listen 80;
    server_name fastapi.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name fastapi.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### fast-audit-api.conf
```nginx
server {
    listen 80;
    server_name fast-audit-api.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name fast-audit-api.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### fast-inspection-common-api.conf
```nginx
server {
    listen 80;
    server_name fast-inspection-common-api.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name fast-inspection-common-api.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8002;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### fast-inspection-common-job.conf
```nginx
server {
    listen 80;
    server_name fast-inspection-common-job.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name fast-inspection-common-job.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8003;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### fast-inspection-fs-api.conf
```nginx
server {
    listen 80;
    server_name fast-inspection-fs-api.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name fast-inspection-fs-api.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8004;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### fast-inspection-apparel-api.conf
```nginx
server {
    listen 80;
    server_name fast-inspection-apparel-api.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name fast-inspection-apparel-api.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8005;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### fast-quality-process-api.conf
```nginx
server {
    listen 80;
    server_name fast-quality-process-api.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name fast-quality-process-api.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8006;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### supplierhub.conf
```nginx
server {
    listen 80;
    server_name supplierhub.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name supplierhub.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8007;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### onesource.conf
```nginx
server {
    listen 80;
    server_name onesource.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name onesource.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8008;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### supplierone.conf
```nginx
server {
    listen 80;
    server_name supplierone.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name supplierone.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8009;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### qlens-citadel.conf
```nginx
server {
    listen 80;
    server_name qlens-citadel.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name qlens-citadel.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8010;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### qlens-orbit.conf
```nginx
server {
    listen 80;
    server_name qlens-orbit.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name qlens-orbit.local.dev;

    ssl_certificate /etc/nginx/certs/local.dev.crt;
    ssl_certificate_key /etc/nginx/certs/local.dev.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://host.docker.internal:8011;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

---

## DevTools 服务（代理到容器）

### kafka-ui.conf
```nginx
server {
    listen 80;
    server_name kafka-ui.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name kafka-ui.local.dev;

    ssl_certificate /etc/nginx/certs/docker-services.crt;
    ssl_certificate_key /etc/nginx/certs/docker-services.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://kafka-ui:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### opensearch-dashboards.conf
```nginx
server {
    listen 80;
    server_name opensearch-dashboards.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name opensearch-dashboards.local.dev;

    ssl_certificate /etc/nginx/certs/docker-services.crt;
    ssl_certificate_key /etc/nginx/certs/docker-services.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://opensearch-dashboards:5601;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### sonarqube.conf
```nginx
server {
    listen 80;
    server_name sonarqube.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name sonarqube.local.dev;

    ssl_certificate /etc/nginx/certs/docker-services.crt;
    ssl_certificate_key /etc/nginx/certs/docker-services.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://sonarqube:9000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### grafana.conf
```nginx
server {
    listen 80;
    server_name grafana.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name grafana.local.dev;

    ssl_certificate /etc/nginx/certs/docker-services.crt;
    ssl_certificate_key /etc/nginx/certs/docker-services.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://grafana:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### prometheus.conf
```nginx
server {
    listen 80;
    server_name prometheus.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name prometheus.local.dev;

    ssl_certificate /etc/nginx/certs/docker-services.crt;
    ssl_certificate_key /etc/nginx/certs/docker-services.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://prometheus:9090;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### minio.conf
```nginx
server {
    listen 80;
    server_name minio.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name minio.local.dev;

    ssl_certificate /etc/nginx/certs/docker-services.crt;
    ssl_certificate_key /etc/nginx/certs/docker-services.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    client_max_body_size 0;

    location / {
        proxy_pass http://minio:9001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```

### jaeger.conf
```nginx
server {
    listen 80;
    server_name jaeger.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name jaeger.local.dev;

    ssl_certificate /etc/nginx/certs/docker-services.crt;
    ssl_certificate_key /etc/nginx/certs/docker-services.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://jaeger:16686;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### mailpit.conf
```nginx
server {
    listen 80;
    server_name mailpit.local.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name mailpit.local.dev;

    ssl_certificate /etc/nginx/certs/docker-services.crt;
    ssl_certificate_key /etc/nginx/certs/docker-services.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://mailpit:8025;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
