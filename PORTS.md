# 端口 & IP 规划

> 所有服务端口和 IP 统一规划，避免冲突。
> Web UI 服务统一通过 nginx 反向代理访问：`http(s)://hostname/<path>`
>
> **统一密码**：`cZgWD@tPYvTx^EZAWQ-_g5aY`（适用于所有服务）

---

## 一、网络规划

| 网络 | 子网 | 用途 |
|---|---|---|
| `devtools-network` | `172.18.0.0/16` | 单机开发环境 |
| `cluster-network` | `172.21.0.0/16` | 集群模式（所有集群共享） |
| `ai-network`（外部引用 devtools-network） | — | AI 服务复用 devtools 网络 |

---

## 二、主机端口规划

### 系统保留

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 53 | dnsmasq | devtools | DNS（UDP+TCP） |
| 80 | nginx | devtools | HTTP 反向代理 |
| 443 | nginx | devtools | HTTPS 反向代理 |

### 数据库 — 1000~1999 / 3000~3999 / 5000~5999 / 9000~9099 / 27000+

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 1025 | mailpit | devtools | SMTP |
| 1433 | mssql | devtools | SQL Server |
| 2181 | zookeeper | devtools | ZooKeeper client |
| 3306 | mysql | devtools | MySQL 单机 |
| 3307 | mysql-master | cluster-mysql | MySQL 集群 master |
| 3308 | mysql-slave-1 | cluster-mysql | MySQL 集群 slave-1 |
| 3309 | mysql-slave-2 | cluster-mysql | MySQL 集群 slave-2 |
| 5432 | postgres | devtools | PostgreSQL 单机 |
| 5433 | pgvector | ai | PostgreSQL + pgvector（AI 向量） |
| 5434 | pg-master | cluster-postgres | PostgreSQL 集群 master |
| 5435 | pg-slave-1 | cluster-postgres | PostgreSQL 集群 slave-1 |
| 5436 | pg-slave-2 | cluster-postgres | PostgreSQL 集群 slave-2 |
| 9042 | cassandra | devtools | CQL native |
| 9043 | cassandra-node-1 | cluster-cassandra | CQL node-1 |
| 9044 | cassandra-node-2 | cluster-cassandra | CQL node-2 |
| 9045 | cassandra-node-3 | cluster-cassandra | CQL node-3 |
| 27017 | mongodb | devtools | MongoDB 单机 |
| 27117 | mongo-rs-1 | cluster-mongodb | MongoDB 副本集 node-1 |
| 27118 | mongo-rs-2 | cluster-mongodb | MongoDB 副本集 node-2 |
| 27119 | mongo-rs-3 | cluster-mongodb | MongoDB 副本集 node-3 |

### 缓存 — Redis 6000~6999 / 7000~7999 / 26000+

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 6379 | redis | devtools | Redis 单机 |
| 6380 | redis-sentinel-master | cluster-redis-sentinel | Sentinel master |
| 6381 | redis-sentinel-slave-1 | cluster-redis-sentinel | Sentinel slave-1 |
| 6382 | redis-sentinel-slave-2 | cluster-redis-sentinel | Sentinel slave-2 |
| 7001 | redis-cluster-1 | cluster-redis-cluster | Cluster node-1 |
| 7002 | redis-cluster-2 | cluster-redis-cluster | Cluster node-2 |
| 7003 | redis-cluster-3 | cluster-redis-cluster | Cluster node-3 |
| 7004 | redis-cluster-4 | cluster-redis-cluster | Cluster node-4 |
| 7005 | redis-cluster-5 | cluster-redis-cluster | Cluster node-5 |
| 7006 | redis-cluster-6 | cluster-redis-cluster | Cluster node-6 |
| 26379 | redis-sentinel-1 | cluster-redis-sentinel | Sentinel 哨兵-1 |
| 26380 | redis-sentinel-2 | cluster-redis-sentinel | Sentinel 哨兵-2 |
| 26381 | redis-sentinel-3 | cluster-redis-sentinel | Sentinel 哨兵-3 |

### 消息队列 — 5600~5699 / 9800~9899 / 10900~10999 / 15600+

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 5672 | rabbitmq | devtools | AMQP |
| 5682 | rabbitmq-node-1 | cluster-rabbitmq | AMQP node-1 |
| 5683 | rabbitmq-node-2 | cluster-rabbitmq | AMQP node-2 |
| 5684 | rabbitmq-node-3 | cluster-rabbitmq | AMQP node-3 |
| 9092 | kafka | devtools | Kafka 单机 |
| 9192 | kafka-cluster-1 | cluster-kafka | Kafka 集群 broker-1 |
| 9193 | kafka-cluster-2 | cluster-kafka | Kafka 集群 broker-2 |
| 9194 | kafka-cluster-3 | cluster-kafka | Kafka 集群 broker-3 |
| 9876 | rocketmq-namesrv | devtools | RocketMQ NameServer |
| 9877 | rocketmq-namesrv-c1 | cluster-rocketmq | RocketMQ 集群 NameServer-1 |
| 9878 | rocketmq-namesrv-c2 | cluster-rocketmq | RocketMQ 集群 NameServer-2 |
| 10909 | rocketmq-broker | devtools | RocketMQ Broker fast |
| 10911 | rocketmq-broker | devtools | RocketMQ Broker main |
| 10921 | rocketmq-broker-a-m | cluster-rocketmq | 集群 Broker-A master |
| 10922 | rocketmq-broker-a-s | cluster-rocketmq | 集群 Broker-A slave |
| 10923 | rocketmq-broker-b-m | cluster-rocketmq | 集群 Broker-B master |
| 10924 | rocketmq-broker-b-s | cluster-rocketmq | 集群 Broker-B slave |
| *(nginx)* | rabbitmq mgmt | devtools | 通过 nginx `/rabbitmq` 访问 |
| 15682 | rabbitmq-node-1 | cluster-rabbitmq | Management UI node-1 |
| 15683 | rabbitmq-node-2 | cluster-rabbitmq | Management UI node-2 |
| 15684 | rabbitmq-node-3 | cluster-rabbitmq | Management UI node-3 |

### 搜索 — 9200~9299 / 5600~5609

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 9200 | opensearch | devtools | REST API |
| 9210 | opensearch-node-1 | cluster-opensearch | REST API node-1 |
| 9211 | opensearch-node-2 | cluster-opensearch | REST API node-2 |
| 9212 | opensearch-node-3 | cluster-opensearch | REST API node-3 |
| 9600 | opensearch | devtools | Performance Analyzer |
| *(nginx)* | opensearch-dashboards | devtools | 通过 nginx `/opensearch` 访问 |
| 5602 | opensearch-dashboards | cluster-opensearch | 集群 Dashboards |

### 可观测性 — 4000~4999 / 5080 / 9090

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 4317 | jaeger | devtools | OTLP gRPC（应用上报） |
| 4318 | jaeger | devtools | OTLP HTTP（应用上报） |
| 5080 | openobserve | devtools | Web UI + API |
| 9090 | prometheus | devtools | Prometheus |
| *(nginx)* | grafana | devtools | 通过 nginx `/grafana` 访问 |
| *(nginx)* | jaeger UI | devtools | 通过 nginx `/jaeger` 访问 |

### 大数据 — 7077 / 8020~8199 / 9870

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 7000 | cassandra | devtools | Inter-node |
| 7077 | spark | devtools | Spark Master RPC |
| 7199 | cassandra | devtools | JMX |
| 8020 | hadoop | devtools | HDFS RPC |
| *(nginx)* | spark | devtools | 通过 nginx `/spark` 访问 |
| *(nginx)* | flink | devtools | 通过 nginx `/flink` 访问 |
| *(nginx)* | clickhouse | devtools | 通过 nginx `/clickhouse` 访问 |
| 8124 | clickhouse s1r1 | cluster-clickhouse | HTTP API shard1-rep1 |
| 8125 | clickhouse s1r2 | cluster-clickhouse | HTTP API shard1-rep2 |
| 8126 | clickhouse s2r1 | cluster-clickhouse | HTTP API shard2-rep1 |
| 8127 | clickhouse s2r2 | cluster-clickhouse | HTTP API shard2-rep2 |
| 9009 | clickhouse | devtools | Native TCP（host→9000） |
| 9010 | clickhouse s1r1 | cluster-clickhouse | Native TCP |
| 9011 | clickhouse s1r2 | cluster-clickhouse | Native TCP |
| 9012 | clickhouse s2r1 | cluster-clickhouse | Native TCP |
| 9013 | clickhouse s2r2 | cluster-clickhouse | Native TCP |
| *(nginx)* | hadoop | devtools | 通过 nginx `/hadoop` 访问 |
| 10010 | hive | devtools | HiveServer2 JDBC（host→10000） |
| *(nginx)* | hive | devtools | 通过 nginx `/hive` 访问 Web UI |

### 存储 — 9001~9002 / 10000~10254

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 9001 | minio | devtools | S3 API（host→9000） |
| 9002 | minio-node-1 | cluster-minio | 集群 S3 API |
| 9444 | minio-node-1 | cluster-minio | 集群 Console |
| 10000 | azure-storage | devtools | Blob |
| 10001 | azure-storage | devtools | Queue |
| 10002 | azure-storage | devtools | File Share |
| 10251~10254 | cosmosdb | devtools | CosmosDB 内部 |

### DevOps & Mock — 8081~8499 / 9000

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 8081 | cosmosdb | devtools | Data Explorer & API |
| 8180 | wiremock | devtools | HTTP Mock（host→8080） |
| 8443 | wiremock | devtools | HTTPS Mock |
| *(nginx)* | sonarqube | devtools | 通过 nginx `/sonarqube` 访问 |
| 26500 | camunda | devtools | Camunda 8 Zeebe gRPC |
| 8088 | camunda | devtools | Camunda 8 REST API / Operate / Tasklist |
| *(nginx)* | kafka-ui | devtools | 通过 nginx `/kafka-ui` 访问 |
| *(nginx)* | rocketmq-dashboard | devtools | 通过 nginx `/rocketmq` 访问 |
| *(nginx)* | rabbitmq mgmt | devtools | 通过 nginx `/rabbitmq` 访问 |
| *(nginx)* | mailpit | devtools | 通过 nginx `/mailpit` 访问 |

### AI — 3100~3199 / 4000~4001 / 6333~6334 / 8100~8399 / 11434 / 19530 / 50051

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 3100 | open-webui | ai | Web UI（host→8080） |
| 3101 | flowise | ai | Flowise UI（host→3000） |
| 4000 | litellm | ai | OpenAI 兼容 API |
| 4001 | litellm | ai | Prometheus metrics |
| 6333 | qdrant | ai | REST API + Dashboard |
| 6334 | qdrant | ai | gRPC |
| 8100 | chromadb | ai | REST API（host→8000） |
| 8300 | attu | ai | Milvus 管理 UI（host→3000） |
| 8380 | weaviate | ai | REST API（host→8080） |
| 9091 | milvus | ai | Metrics |
| 11434 | ollama | ai | REST API |
| 19530 | milvus | ai | gRPC + REST |
| 50051 | weaviate | ai | gRPC |

### 集群 Web UI（通过 host port 直接访问）

| 端口 | 服务 | Compose | 说明 |
|---|---|---|---|
| 8480 | kafka-cluster-ui | cluster-kafka | Kafka 集群 UI（host→8080） |
| 8680 | rocketmq-cluster-dashboard | cluster-rocketmq | RocketMQ 集群 Dashboard（host→8080） |

---

## 三、Docker 内部 IP 规划

### devtools-network（172.18.0.0/16）

| IP | 容器 |
|---|---|
| 172.18.0.2 | nginx |
| 172.18.0.3 | postgres |
| 172.18.0.4 | mssql |
| 172.18.0.5 | redis |
| 172.18.0.6 | kafka |
| 172.18.0.7 | kafka-ui |
| 172.18.0.8 | opensearch |
| 172.18.0.9 | opensearch-dashboards |
| 172.18.0.10 | sonarqube |
| 172.18.0.11 | prometheus |
| 172.18.0.12 | grafana |
| 172.18.0.13 | cassandra |
| 172.18.0.14 | mysql |
| 172.18.0.15 | azure-storage |
| 172.18.0.16 | wiremock |
| 172.18.0.17 | camunda |
| 172.18.0.18 | jaeger |
| 172.18.0.19 | mailpit |
| 172.18.0.21 | rabbitmq |
| 172.18.0.22 | rocketmq-namesrv |
| 172.18.0.23 | rocketmq-broker |
| 172.18.0.24 | rocketmq-dashboard |
| 172.18.0.25 | mongodb |
| 172.18.0.26 | minio |
| 172.18.0.27 | cosmosdb |
| 172.18.0.28 | openobserve |
| 172.18.0.30 | zookeeper |
| 172.18.0.31 | hadoop |
| 172.18.0.32 | hive |
| 172.18.0.33 | spark |
| 172.18.0.34 | spark-worker |
| 172.18.0.35 | flink |
| 172.18.0.36 | flink-taskmanager |
| 172.18.0.37 | clickhouse |
| 172.18.0.53 | dnsmasq |
| 172.18.0.60 | opensearch-init |

### cluster-network（172.21.0.0/16）

| IP 段 | 集群 |
|---|---|
| 172.21.0.10~0.16 | Redis Cluster（6 节点 + init） |
| 172.21.0.20~0.25 | Redis Sentinel（master + 2 slave + 3 sentinel） |
| 172.21.0.30~0.32 | MySQL（master + 2 slave） |
| 172.21.0.40~0.42 | PostgreSQL（master + 2 slave） |
| 172.21.0.50~0.53 | Kafka（3 broker + UI） |
| 172.21.0.60~0.63 | MongoDB（3 RS + init） |
| 172.21.0.70~0.73 | OpenSearch（3 node + dashboards） |
| 172.21.0.80~0.83 | RabbitMQ（3 node + init） |
| 172.21.0.90~0.96 | RocketMQ（2 namesrv + 4 broker + dashboard） |
| 172.21.0.100~0.104 | ClickHouse（ZK + 4 shard/replica） |
| 172.21.0.110~0.113 | MinIO（4 node） |
| 172.21.0.120~0.122 | Cassandra（3 node） |

---

## 四、Nginx 路径反向代理

通过 `http://localhost/<path>` 访问 Web UI，无需记端口号。

| 路径 | 服务 | 后端地址 | 子路径原生支持 |
|---|---|---|---|
| `/` | 导航首页 | — | — |
| `/grafana/` | Grafana | grafana:3000 | ✅ `GF_SERVER_SERVE_FROM_SUB_PATH` |
| `/prometheus/` | Prometheus | prometheus:9090 | ✅ `--web.external-url` |
| `/jaeger/` | Jaeger | jaeger:16686 | ✅ `QUERY_BASE_PATH` |
| `/openobserve/` | OpenObserve | openobserve:5080 | ❌ rewrite 剥离 |
| `/kafka-ui/` | Kafka UI | kafka-ui:8080 | ✅ `SERVER_SERVLET_CONTEXT_PATH` |
| `/rabbitmq/` | RabbitMQ Mgmt | rabbitmq:15672 | ❌ rewrite 剥离 |
| `/rocketmq/` | RocketMQ Dashboard | rocketmq-dashboard:8082 | ❌ rewrite 剥离 |
| `/opensearch/` | OpenSearch Dashboards | opensearch-dashboards:5601 | ✅ `SERVER_BASEPATH` |
| `/sonarqube/` | SonarQube | sonarqube:9000 | ✅ `SONAR_WEB_CONTEXT` |
| `http://localhost:8088/operate` | Camunda 8 Operate | camunda:8080 | 统一发行镜像 |
| `http://localhost:8088/tasklist` | Camunda 8 Tasklist | camunda:8080 | 统一发行镜像 |
| `http://localhost:8088/v2/` | Camunda 8 REST API | camunda:8080 | Zeebe REST API |
| `/mailpit/` | Mailpit | mailpit:8025 | ✅ `MP_WEBROOT` |
| `/minio/` | MinIO Console | minio:9001 | ❌ rewrite 剥离 |
| `/spark/` | Spark Master | spark:8080 | ❌ rewrite 剥离 |
| `/flink/` | Flink Dashboard | flink:8081 | ❌ rewrite 剥离 |
| `/hadoop/` | Hadoop NameNode | hadoop:9870 | ❌ rewrite 剥离 |
| `/wiremock/` | WireMock Admin | wiremock:8080 | ❌ rewrite 剥离 |
| `/clickhouse/` | ClickHouse Play | clickhouse:8123 | ❌ rewrite 剥离 |
| `/hive/` | Hive Web UI | hive:10002 | ❌ rewrite 剥离 |

> **注意**：标记 ❌ 的服务使用 nginx `rewrite` 剥离路径前缀再转发，部分 SPA 应用的前端静态资源引用可能仍使用绝对根路径（`/js/...`），此时建议直接用端口或子域名方式访问。

### 扩展工具 — `docker-compose-tools.yml`

| 端口 | 服务 | 说明 |
|---|---|---|
| 8089 | trino | Trino Web UI |
| 8091 | superset | BI 可视化 |
| 8083 | airflow | 数据任务编排 |
| 8889 | jupyter | JupyterLab |
| 5000 | mlflow | ML 实验管理 |
| 5050 | pgadmin | PostgreSQL 管理 |
| 5540 | redisinsight | Redis 管理 |
| 9093 | alertmanager | Prometheus 告警 |
| 9100 | node-exporter | 主机指标 |
| 8082 | cadvisor | 容器指标 |
| 14317 / 14318 | otel-collector | OTLP gRPC / HTTP |
| 8181 | keycloak | OAuth2 / OIDC |
| 8200 | vault | 密钥和凭据管理 |
| 8084 / 50000 | jenkins | Web UI / Agent |
| 8086 | nexus | 制品仓库 |
| 3001 / 2222 | gitea | Git Web / SSH |
| 3002 | uptime-kuma | 服务可用性监控 |
| Nginx `/debezium/connectors` | debezium-connect | Kafka Connect CDC API（不暴露宿主机 Web 端口） |
| 8087 / 2022 | sftpgo | Web / SFTP |
| 3310 | clamav | 病毒扫描服务 |
