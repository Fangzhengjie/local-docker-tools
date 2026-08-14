# Local Docker Tools

本地开发环境 Docker Compose 配置，适用于 Windows VDI。

## 服务列表

### core（默认最小启动）

| 服务 | 地址 | 说明 |
|------|------|------|
| nginx | http://localhost | 反向代理 |
| postgres | localhost:5432 | PostgreSQL 17 |
| redis | localhost:6379 | Redis 7 |

### mq（消息队列）

| 服务 | 地址 | 说明 |
|------|------|------|
| kafka | localhost:9092 | Kafka Broker (KRaft 模式) |
| kafka-ui | http://kafka-ui.local.dev | Kafka 管理界面 |
| rabbitmq | localhost:5672 | RabbitMQ（Management UI: http://rabbitmq.local.dev, admin/mMRUyERlULpXwJgAyZAnElhl!!） |
| rocketmq-namesrv | localhost:9876 | RocketMQ NameServer |
| rocketmq-broker | localhost:10911 | RocketMQ Broker |
| rocketmq-dashboard | http://rocketmq.local.dev | RocketMQ 管理界面 |

### search（搜索）

| 服务 | 地址 | 说明 |
|------|------|------|
| opensearch | localhost:9200 | OpenSearch |
| opensearch-dashboards | http://opensearch.local.dev | OpenSearch 可视化界面 |

### db（数据库）

| 服务 | 地址 | 说明 |
|------|------|------|
| mysql | localhost:3306 | MySQL 8.4 |
| mssql | localhost:1433 | Azure SQL Edge |
| mongodb | localhost:27017 | MongoDB 7 |
| cosmosdb | https://localhost:8081 | Cosmos DB 模拟器 |

### workflow（工作流）

| 服务 | 地址 | 说明 |
|------|------|------|
| Camunda 8 Operate | http://localhost:8088/operate | 流程运维与监控 |
| Camunda 8 Tasklist | http://localhost:8088/tasklist | 用户任务管理 |
| Camunda 8 REST API | http://localhost:8088/v2/ | Zeebe REST API |
| Camunda 8 Zeebe | localhost:26500 | gRPC 网关 |

### storage（文件存储）

| 服务 | 地址 | 说明 |
|------|------|------|
| minio | http://minio.local.dev | S3 兼容对象存储 Web UI（minioadmin） |
| azurite | localhost:10000~10002 | Azure Storage 模拟器（Blob/Queue/File） |

### obs（可观测性）

| 服务 | 地址 | 说明 |
|------|------|------|
| prometheus | http://prometheus.local.dev | 指标采集 |
| grafana | http://grafana.local.dev | 监控面板 (admin/admin) |
| jaeger | http://jaeger.local.dev | 分布式链路追踪 UI |
| openobserve | http://openobserve.local.dev | 日志收集 + 查询 UI（admin@local.com / admin123） |

### qa（代码质量）

| 服务 | 地址 | 说明 |
|------|------|------|
| sonarqube | http://sonarqube.local.dev | 代码质量分析 (admin/admin，依赖 core postgres) |

### mail（邮件）

| 服务 | 地址 | 说明 |
|------|------|------|
| mailpit | http://mailpit.local.dev | 本地邮件捕获（SMTP: localhost:1025） |

### bigdata（大数据）

| 服务 | 地址 | 说明 |
|------|------|------|
| zookeeper | localhost:2181 | ZooKeeper（Hive 元数据协调） |
| hadoop | localhost:9870 / 8020 | Hadoop HDFS（NameNode UI: 9870, RPC: 8020） |
| hive | localhost:10010 | Hive Server2（JDBC: 10010, Web UI: 10012） |
| spark | localhost:7077 | Spark Master（Web UI: localhost:8088） |
| spark-worker | — | Spark Worker（自动注册到 spark:7077） |
| flink | localhost:8090 | Flink JobManager Web UI |
| flink-taskmanager | — | Flink TaskManager（自动注册到 flink:6123） |
| clickhouse | localhost:8123 | ClickHouse HTTP API（Native: 9009） |

### ai（AI 开发环境）

| 服务 | 地址 | 说明 |
|------|------|------|
| ollama | localhost:11434 | 本地 LLM 推理引擎（OpenAI 兼容 API） |
| open-webui | http://localhost:3100 | ChatGPT 风格对话界面（对接 Ollama） |
| qdrant | http://localhost:6333/dashboard | 向量数据库（REST: 6333, gRPC: 6334） |
| milvus | localhost:19530 | 生产级向量数据库（gRPC + REST） |
| attu | http://localhost:8300 | Milvus 可视化管理界面 |
| weaviate | http://localhost:8380 | GraphQL 原生向量数据库（gRPC: 50051） |
| chromadb | http://localhost:8100 | 轻量级向量数据库（LangChain 默认推荐） |
| pgvector | localhost:5433 | PostgreSQL 向量扩展（SQL 原生） |
| litellm | http://localhost:4000 | LLM API 网关（OpenAI 兼容代理） |
| flowise | http://localhost:3101 | 可视化 LLM 工作流编排（admin/admin123） |

### tools（数据工程、分析和运维扩展）

| 服务 | 地址 | 说明 |
|------|------|------|
| trino | http://localhost:8089 | 统一 SQL 查询 |
| superset | http://localhost:8091 | BI 数据可视化 |
| airflow | http://localhost:8083 | 数据任务编排 |
| dbt | — | dbt PostgreSQL CLI 容器 |
| jupyter | http://localhost:8889 | Python / Spark 分析 |
| mlflow | http://localhost:5000 | ML 实验和模型管理 |
| pgadmin | http://localhost:5050 | PostgreSQL 管理 |
| redisinsight | http://localhost:5540 | Redis 管理 |
| alertmanager | http://localhost:9093 | Prometheus 告警 |
| node-exporter | http://localhost:9100 | 主机指标 |
| cadvisor | http://localhost:8082 | 容器指标 |
| otel-collector | localhost:14317 / 14318 | OTLP traces、metrics、logs |
| keycloak | http://localhost:8181 | OAuth2 / OIDC 统一认证 |
| vault | http://localhost:8200 | 密钥和凭据管理 |
| jenkins | http://localhost:8084 | CI/CD 自动化 |
| nexus | http://localhost:8086 | Maven/npm/PyPI/Docker 制品仓库 |
| gitea | http://localhost:3001 | 私有 Git 服务 |
| uptime-kuma | http://localhost:3002 | 服务可用性监控 |
| debezium-connect | http://localhost:8085 | CDC 数据同步 |
| sftpgo | http://localhost:8087 | SFTP/Web 文件服务 |
| clamav | localhost:3310 | 文件病毒扫描 |

## 启动方式

服务按功能分组为独立 profile，按需启动以节省内存。

> 首次使用需确保项目根目录存在 `.env` 文件，内容参考 `.env.example`（如有）。
> `.env` 不存在时执行任何 `make` 命令都会报错提示。

### Make 命令（推荐，Windows / Mac / Linux 通用）

JetBrains IDE 会在 `Makefile` 每行左侧显示 ▶ 按钮，点击直接运行。

```bash
# ── devtools（所有基础设施服务）──────────────────────────────
make devtools-up           # 启动所有 devtools 服务
make devtools-down         # 停止所有 devtools 服务
make devtools-ps           # 查看运行状态
make devtools-pull         # 拉取所有镜像（不重启）
make devtools-pull-up      # 拉取最新镜像并启动
make devtools-logs         # 查看所有服务日志
make devtools-log svc=postgres  # 查看单个服务日志

# ── 按需启动指定服务 ─────────────────────────────────────────
# docker compose -f docker-compose-devtools.yml up -d nginx postgres redis  # 只启动指定服务

# ── ai（AI 开发环境，独立 compose）───────────────────────────
make ai-up                 # 启动 AI 服务
make ai-down               # 停止 AI 服务
make ai-ps                 # 查看 AI 服务状态
make ai-pull-up            # 拉取最新镜像并启动
make ai-logs               # 查看 AI 服务日志
make ai-log svc=ollama     # 查看单个 AI 服务日志
make ollama-pull           # 拉取默认模型 llama3.2（model=xxx 可指定）

# ── tools（数据工程、分析和运维扩展）────────────────────────
make tools-up              # 启动扩展工具
make tools-down            # 停止扩展工具
make tools-ps              # 查看扩展工具状态
make tools-logs            # 查看扩展工具日志

# ── cluster（集群模式，每种集群独立 compose）─────────────────
# 可选: redis mysql postgres kafka mongodb opensearch
#       rabbitmq rocketmq clickhouse minio cassandra
make cluster-redis-up      # 启动 Redis 集群（Cluster + Sentinel）
make cluster-redis-down    # 停止 Redis 集群
make cluster-redis-ps      # 查看 Redis 集群状态
make cluster-redis-logs    # 查看 Redis 集群日志
make cluster-mysql-up      # 启动 MySQL 主从
make cluster-kafka-up      # 启动 Kafka 3节点集群
# ... 其他集群同理: make cluster-{名称}-up/down/ps/logs

# ── 日志 / 运维 ─────────────────────────────────────────────
make restart svc=grafana   # 重启单个服务
make exec svc=redis        # 进入容器 shell (sh)
make bash svc=postgres     # 进入容器 shell (bash)
```

## Network

### 网络规划

所有服务运行在 `devtools-network`（`172.18.0.0/16`），应用需要访问时声明 external 网络：

| 网络名 | 子网 | 用途 |
|--------|------|------|
| `devtools-network` | `172.18.0.0/16` | 基础设施 + AI（本项目） |
| `cluster-network` | `172.21.0.0/16` | 集群模式（Redis/MySQL/PG/Kafka） |

**应用 docker-compose.yml 接入示例：**
```yaml
networks:
  devtools-network:
    external: true   # 引用 devtools 网络，直接用容器名访问 postgres/kafka/redis 等
```

### devtools-network IP 分配

所有 devtools 服务运行在 `devtools-network`（`172.18.0.0/16`）中，IP 固定分配：

| 容器 | IP | Profile |
|------|----|----|
| nginx | 172.18.0.2 | core |
| postgres | 172.18.0.3 | core |
| mssql | 172.18.0.4 | db |
| redis | 172.18.0.5 | core |
| kafka | 172.18.0.6 | mq |
| kafka-ui | 172.18.0.7 | mq |
| opensearch | 172.18.0.8 | search |
| opensearch-dashboards | 172.18.0.9 | search |
| sonarqube | 172.18.0.10 | qa |
| prometheus | 172.18.0.11 | obs |
| grafana | 172.18.0.12 | obs |
| cassandra | 172.18.0.13 | db |
| mysql | 172.18.0.14 | db |
| azurite | 172.18.0.15 | storage |
| wiremock | 172.18.0.16 | mock |
| camunda | 172.18.0.17 | workflow |
| jaeger | 172.18.0.18 | obs |
| mailpit | 172.18.0.19 | mail |
| rabbitmq | 172.18.0.21 | mq |
| rocketmq-namesrv | 172.18.0.22 | mq |
| rocketmq-broker | 172.18.0.23 | mq |
| rocketmq-dashboard | 172.18.0.24 | mq |
| mongodb | 172.18.0.25 | db |
| minio | 172.18.0.26 | storage |
| cosmosdb | 172.18.0.27 | db |
| openobserve | 172.18.0.28 | obs |
| zookeeper | 172.18.0.30 | bigdata |
| hadoop | 172.18.0.31 | bigdata |
| hive | 172.18.0.32 | bigdata |
| spark | 172.18.0.33 | bigdata |
| spark-worker | 172.18.0.34 | bigdata |
| flink | 172.18.0.35 | bigdata |
| flink-taskmanager | 172.18.0.36 | bigdata |
| clickhouse | 172.18.0.37 | bigdata |
| dnsmasq | 172.18.0.53 | core |
| ollama | 172.18.0.40 | ai |
| open-webui | 172.18.0.41 | ai |
| qdrant | 172.18.0.42 | ai |
| litellm | 172.18.0.43 | ai |
| flowise | 172.18.0.44 | ai |
| milvus-etcd | 172.18.0.45 | ai |
| milvus-minio | 172.18.0.46 | ai |
| milvus | 172.18.0.47 | ai |
| weaviate | 172.18.0.48 | ai |
| chromadb | 172.18.0.49 | ai |
| pgvector | 172.18.0.50 | ai |
| attu | 172.18.0.51 | ai |

### cluster-network IP 分配

集群服务运行在 `cluster-network`（`172.21.0.0/16`）中，每种集群独立 compose 文件：

| 集群 | compose 文件 | IP 范围 | 主要端口 |
|------|-------------|---------|---------|
| Redis Cluster | `docker-compose-redis.yml` | 172.21.0.10~25 | 7001~7006, 6380~6382, 26379~26381 |
| MySQL 主从 | `docker-compose-mysql.yml` | 172.21.0.30~33 | 3307~3309 |
| PostgreSQL 主从 | `docker-compose-postgres.yml` | 172.21.0.40~42 | 5434~5436 |
| Kafka Cluster | `docker-compose-kafka.yml` | 172.21.0.50~53 | 9192~9194, 8480 |
| MongoDB RS | `docker-compose-mongodb.yml` | 172.21.0.60~63 | 27117~27119 |
| OpenSearch Cluster | `docker-compose-opensearch.yml` | 172.21.0.70~73 | 9210~9212, 5602 |
| RabbitMQ Cluster | `docker-compose-rabbitmq.yml` | 172.21.0.80~83 | 5682~5684, 15682~15684 |
| RocketMQ Cluster | `docker-compose-rocketmq.yml` | 172.21.0.90~96 | 9877~9878, 10921~10924, 8680 |
| ClickHouse Cluster | `docker-compose-clickhouse.yml` | 172.21.0.100~104 | 8124~8127, 9010~9013 |
| MinIO EC | `docker-compose-minio.yml` | 172.21.0.110~113 | 9002, 9444 |
| Cassandra Ring | `docker-compose-cassandra.yml` | 172.21.0.120~122 | 9043~9045 |

## 内存参考

| Profile | 包含服务 | 估算内存 |
|---------|---------|---------|
| core | nginx + postgres + redis | ~500 MB |
| mq | kafka + kafka-ui + rabbitmq + rocketmq | ~1.5 GB |
| search | opensearch + opensearch-dashboards | ~1.5 GB |
| db | mysql + mssql + mongodb + cosmosdb | ~1.2 GB |
| storage | minio + azurite | ~300 MB |
| obs | prometheus + grafana + jaeger + openobserve | ~700 MB |
| qa | sonarqube（+ core）| ~1 GB |
| mail | mailpit | ~50 MB |
| bigdata | zookeeper + hadoop + hive + spark + flink + clickhouse | ~3 GB |
| ai | ollama + open-webui + qdrant + milvus + weaviate + chromadb + pgvector + litellm + flowise | ~5 GB |
| cluster-redis | Redis Cluster(6) + Sentinel(6) | ~600 MB |
| cluster-mysql | MySQL 主从(3) | ~1.5 GB |
| cluster-postgres | PostgreSQL 主从(3) | ~600 MB |
| cluster-kafka | Kafka KRaft(3) + UI | ~2 GB |
| cluster-mongodb | MongoDB RS(3) | ~900 MB |
| cluster-opensearch | OpenSearch(3) + Dashboards | ~3 GB |
| cluster-rabbitmq | RabbitMQ(3) | ~1.2 GB |
| cluster-rocketmq | RocketMQ 2主2从 + 2NameSrv + Dashboard | ~2 GB |
| cluster-clickhouse | ClickHouse 2×2 + ZK | ~2 GB |
| cluster-minio | MinIO EC(4) | ~800 MB |
| cluster-cassandra | Cassandra(3) | ~2 GB |

> 全部启动约 **~13 GB**，64GB 内存可直接 `make all-up` 一键启动所有服务。

---

## Volume 路径

数据持久化在 `C:\Users\vn54359\volume\` 下：

```
C:\Users\vn54359\volume\
├── nginx\
│   ├── nginx.conf
│   ├── conf.d\
│   └── certs\
├── postgresql\data\
├── mssql\
├── redis\
├── opensearch\data\
├── sonarqube\
│   ├── data\
│   ├── logs\
│   └── extensions\
├── prometheus\
│   ├── prometheus.yml
│   └── data\
├── grafana\
│   ├── data\
│   └── provisioning\
│       └── datasources\
│           └── datasources.yml
├── mongodb\data\
├── minio\data\
├── azurite\
├── cosmosdb\
```

## 注意事项

### Prometheus 配置文件
启动前需要创建 `prometheus.yml`，最简配置：
```yaml
global:
  scrape_interval: 15s
scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
```

---

## Cosmos DB 使用指南

Azure Cosmos DB 本地模拟器，支持 SQL API（NoSQL）。

### 访问
- **Data Explorer**：`https://localhost:8081/_explorer/index.html`（注意是 https，需忽略证书警告）
- **连接字符串**（固定）：
```
AccountEndpoint=https://localhost:8081/;AccountKey=C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw==
```

> ⚠️ 模拟器使用自签名证书，Java SDK 需要禁用 SSL 验证或导入证书

### Spring Boot 接入
```yaml
# application.yml
spring:
  cloud:
    azure:
      cosmos:
        endpoint: https://localhost:8081
        key: C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw==
        database: mydb
        consistency-level: session
```

### Java SDK 接入
```java
CosmosClient client = new CosmosClientBuilder()
    .endpoint("https://localhost:8081")
    .key("C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw==")
    .gatewayMode()
    .endpointDiscoveryEnabled(false)
    .buildClient();
```

---

## Azurite 使用指南

Azurite 是微软官方 Azure Storage 本地模拟器，支持 Blob、Queue、File Share。

### 连接字符串
```
# 默认账号密码（固定）
AccountName: devstoreaccount1
AccountKey: Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==

# Blob
DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://localhost:10000/devstoreaccount1;

# File Share
DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;FileEndpoint=http://localhost:10002/devstoreaccount1;
```

### Spring Boot 接入（File Share）
```yaml
# application.yml
azure:
  storage:
    connection-string: "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;FileEndpoint=http://localhost:10002/devstoreaccount1;"
    file-share-name: my-share
```

### Java SDK 接入

两种方式效果相同，选其一即可：

**方式一：连接字符串**
```java
ShareServiceClient client = new ShareServiceClientBuilder()
    .connectionString("DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;FileEndpoint=http://localhost:10002/devstoreaccount1;")
    .buildClient();
```

**方式二：AccountName + AccountKey**
```java
StorageSharedKeyCredential credential = new StorageSharedKeyCredential(
    "devstoreaccount1",
    "Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw=="
);

ShareServiceClient client = new ShareServiceClientBuilder()
    .endpoint("http://localhost:10002/devstoreaccount1")
    .credential(credential)
    .buildClient();

// 创建 File Share
client.createShare("my-share");
```

---

## Mailpit 使用指南

Mailpit 是本地邮件捕获服务，拦截应用发出的所有邮件，不会真实发送。

### 访问
- **Web UI**：`http://localhost:8025`（查看所有捕获的邮件）
- **SMTP**：`localhost:1025`（应用配置邮件服务器地址）

### Spring Boot 接入
```yaml
# application.yml
spring:
  mail:
    host: localhost
    port: 1025
    properties:
      mail:
        smtp:
          auth: false
          starttls:
            enable: false
```

### Java SDK 接入
```java
Properties props = new Properties();
props.put("mail.smtp.host", "localhost");
props.put("mail.smtp.port", "1025");

Session session = Session.getInstance(props);
MimeMessage message = new MimeMessage(session);
message.setFrom(new InternetAddress("from@example.com"));
message.setRecipient(Message.RecipientType.TO, new InternetAddress("to@example.com"));
message.setSubject("Test");
message.setText("Hello from local dev!");
Transport.send(message);
```

> 发送后在 `http://localhost:8025` 即可看到邮件内容，支持 HTML 预览、附件查看。

---

## MinIO 使用指南

MinIO 是 S3 兼容的本地对象存储，可模拟 Azure Blob Storage / AWS S3。

### 访问地址
| 地址 | 用途 |
|------|------|
| `http://localhost:9002` | Web 控制台（浏览器） |
| `http://localhost:9001` | API 端点（应用连接） |

**默认账号：** `minioadmin` / `mMRUyERlULpXwJgAyZAnElhl!!`

### 创建 Bucket
登录 Web 控制台 → Buckets → Create Bucket → 输入名称 → Create

### Java 应用接入（AWS S3 SDK）
```xml
<!-- pom.xml -->
<dependency>
    <groupId>software.amazon.awssdk</groupId>
    <artifactId>s3</artifactId>
</dependency>
```

```java
S3Client s3 = S3Client.builder()
    .endpointOverride(URI.create("http://localhost:9001"))
    .credentialsProvider(StaticCredentialsProvider.create(
        AwsBasicCredentials.create("minioadmin", "mMRUyERlULpXwJgAyZAnElhl!!")))
    .region(Region.US_EAST_1)  // MinIO 不验证 region，随便填
    .forcePathStyle(true)       // 必须开启，MinIO 用 path-style
    .build();
```

### Spring Boot 接入
```yaml
# application.yml
spring:
  cloud:
    aws:
      s3:
        endpoint: http://localhost:9001
        path-style-access-enabled: true
      credentials:
        access-key: minioadmin
        secret-key: mMRUyERlULpXwJgAyZAnElhl!!
      region:
        static: us-east-1
```

---

## Jaeger 使用指南

Jaeger 是 OpenTelemetry 兼容的分布式链路追踪系统，适合本地开发环境进行链路调试。

### 访问
- **Jaeger UI**：`http://localhost:16686`（查看 Trace、Span）
- **OTLP gRPC**：`localhost:4317`（应用上报地址）
- **OTLP HTTP**：`localhost:4318`（应用上报地址，REST 风格）

### Spring Boot 接入（推荐方式）

**1. 添加依赖（pom.xml）**
```xml
<!-- Spring Boot Actuator + Micrometer Tracing -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
<dependency>
    <groupId>io.micrometer</groupId>
    <artifactId>micrometer-tracing-bridge-otel</artifactId>
</dependency>
<dependency>
    <groupId>io.opentelemetry</groupId>
    <artifactId>opentelemetry-exporter-otlp</artifactId>
</dependency>
```

**2. 配置 application.yml**
```yaml
management:
  tracing:
    sampling:
      probability: 1.0   # 本地开发全量采样，生产建议 0.1
  otlp:
    tracing:
      endpoint: http://localhost:4318/v1/traces   # OTLP HTTP

spring:
  application:
    name: my-service   # Jaeger UI 中显示的服务名
```

> 使用 gRPC 上报改为：`http://localhost:4317`，依赖替换为 `opentelemetry-exporter-otlp-grpc`

**3. 验证**
启动应用后访问任意接口，在 `http://localhost:16686` 选择服务名，点击 **Find Traces** 即可看到链路数据。

### Java SDK 接入（无 Spring Boot）

```java
// 创建 OTLP HTTP Exporter
OtlpHttpSpanExporter exporter = OtlpHttpSpanExporter.builder()
    .setEndpoint("http://localhost:4318/v1/traces")
    .build();

SdkTracerProvider tracerProvider = SdkTracerProvider.builder()
    .addSpanProcessor(BatchSpanProcessor.builder(exporter).build())
    .setResource(Resource.create(Attributes.of(
        ResourceAttributes.SERVICE_NAME, "my-service")))
    .build();

OpenTelemetrySdk openTelemetry = OpenTelemetrySdk.builder()
    .setTracerProvider(tracerProvider)
    .buildAndRegisterGlobal();
```

### 在 Grafana 中查看 Trace（推荐）

Grafana 已通过 Provisioning 自动配置 Jaeger 数据源，**无需手动添加**，启动即生效。

**操作步骤：**
1. 打开 `http://localhost:3000`（admin / admin）
2. 左侧菜单 → **Explore**（指南针图标）
3. 顶部数据源下拉选择 **Jaeger**
4. 查询方式选择：
   - **Search**：选 Service Name → Operation → 点 Run query，列出最近 Trace
   - **TraceID**：直接粘贴 TraceID（从日志/响应头中获取）
5. 点击某条 Trace 展开瀑布图，查看各 Span 耗时

> Provisioning 配置文件：`${VOLUME_BASE}/grafana/provisioning/datasources/datasources.yml`
> 修改后需重启 Grafana 容器：`docker restart grafana`

### 与生产级追踪系统的对比

| 特性 | Jaeger（本地）| 生产级追踪系统 |
|------|--------------|-----------------|
| 协议 | OpenTelemetry (OTLP) | OpenTelemetry (OTLP) |
| 配置项 | `localhost:4317/4318` | TraceStore endpoint |
| 采样率 | `probability: 1.0` | 按项目配置 |
| Trace 可视化 | Jaeger UI / Grafana Explore | Wolly (Grafana) |

> 本地和生产只需修改 `management.otlp.tracing.endpoint`，其余代码无需改动。

---

## OpenObserve 使用指南

OpenObserve 是轻量级一站式可观测性平台，本地用于**日志收集与查询**，支持 OTLP 协议接收应用日志。

### 访问
- **Web UI**：`http://openobserve.local.dev`
- **账号**：`admin@local.com` / `admin123`
- **OTLP HTTP 日志接收端点**：`http://localhost:5080/api/default/v1/logs`（容器内：`http://openobserve:5080/api/default/v1/logs`）

### Spring Boot 接入（推荐：OTLP HTTP）

**1. 添加依赖（pom.xml）**
```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
<!-- OTLP 日志导出 -->
<dependency>
    <groupId>io.opentelemetry</groupId>
    <artifactId>opentelemetry-exporter-otlp</artifactId>
</dependency>
<dependency>
    <groupId>io.micrometer</groupId>
    <artifactId>micrometer-tracing-bridge-otel</artifactId>
</dependency>
```

**2. 配置 application.yml**
```yaml
spring:
  application:
    name: my-service

management:
  otlp:
    logging:
      endpoint: http://localhost:5080/api/default/v1/logs
      headers:
        Authorization: "Basic YWRtaW5AbG9jYWwuY29tOmFkbWluMTIz"  # admin@local.com:admin123 base64
  logging:
    structured:
      format: json   # 结构化 JSON 日志，OpenObserve 可解析字段
  tracing:
    sampling:
      probability: 1.0
  otlp:
    tracing:
      endpoint: http://localhost:4318/v1/traces
```

> Authorization header 的 Base64 值由 `admin@local.com:admin123` 编码而来，如修改密码需重新生成。

**3. 在 OpenObserve 查看日志**
1. 打开 `http://openobserve.local.dev`
2. 左侧菜单 → **Logs**
3. Stream 选择 `default`（或你的 service name）
4. 输入查询条件（支持 SQL 语法），点击 **Run Query**

### 与 Grafana Loki 的对比

| 特性 | OpenObserve | Grafana + Loki |
|------|-------------|----------------|
| 部署 | 单容器 | 需要 Loki + Grafana 两个容器 |
| 存储 | 本地文件（/data）| 本地文件 |
| 查询语言 | SQL | LogQL |
| OTLP 支持 | ✅ 原生 | 需要 Alloy/Promtail |
| 内存占用 | ~200 MB | ~300 MB（Loki 单独）|
| 内置 UI | ✅ | 需要 Grafana |

---

## RabbitMQ 使用指南

### 访问
- **Management UI**：`http://rabbitmq.local.dev`（guest / guest）
- **AMQP**：`localhost:5673`（宿主机连接，容器内用 `rabbitmq:5672`）

### Spring Boot 接入
```yaml
spring:
  rabbitmq:
    host: localhost
    port: 5673
    username: guest
    password: guest
```

### Spring Boot 接入（容器内）
```yaml
spring:
  rabbitmq:
    host: rabbitmq
    port: 5672
    username: guest
    password: guest
```

---

## RocketMQ 使用指南

### 访问
- **Dashboard UI**：`http://rocketmq.local.dev`
- **NameServer**：`localhost:9876`
- **Broker**：`localhost:10911`

### Spring Boot 接入
```xml
<dependency>
    <groupId>org.apache.rocketmq</groupId>
    <artifactId>rocketmq-spring-boot-starter</artifactId>
    <version>2.3.0</version>
</dependency>
```

```yaml
rocketmq:
  name-server: localhost:9876
  producer:
    group: my-producer-group
```

---

## MySQL 使用指南

### 连接信息
- **Host**：`localhost:3306`（容器内：`mysql:3306`）
- **账号**：`root` / `mMRUyERlULpXwJgAyZAnElhl!!`

### Spring Boot 接入
```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC
    username: root
    password: mMRUyERlULpXwJgAyZAnElhl!!
    driver-class-name: com.mysql.cj.jdbc.Driver
```

---

## ClickHouse 使用指南

### 访问
- **HTTP API**：`http://localhost:8123`
- **Native 协议**：`localhost:9009`
- **默认账号**：`admin` / `mMRUyERlULpXwJgAyZAnElhl!!`

### 连接示例
```bash
# HTTP API 查询
curl http://localhost:8123?query=SELECT+version()

# 创建数据库
curl -X POST "http://localhost:8123/" --data "CREATE DATABASE IF NOT EXISTS mydb"
```

### Spring Boot 接入（JDBC）
```xml
<dependency>
    <groupId>com.clickhouse</groupId>
    <artifactId>clickhouse-jdbc</artifactId>
    <version>0.6.0</version>
</dependency>
```

```yaml
spring:
  datasource:
    url: jdbc:clickhouse://localhost:8123/default
    username: admin
    password: mMRUyERlULpXwJgAyZAnElhl!!
    driver-class-name: com.clickhouse.jdbc.ClickHouseDriver
```

---

## Hive 使用指南

### 访问
- **HiveServer2 JDBC**：`localhost:10010`
- **HiveServer2 Web UI**：`http://localhost:10012`

> ⚠️ Hive 依赖 Hadoop HDFS（172.18.0.31）和 ZooKeeper（172.18.0.30），需同属 `bigdata` profile 一起启动

### JDBC 连接
```
jdbc:hive2://localhost:10010/default
```

### Spring Boot 接入
```yaml
spring:
  datasource:
    url: jdbc:hive2://localhost:10010/default
    driver-class-name: org.apache.hive.jdbc.HiveDriver
    username: hive
    password: hive
```

---

## Spark 使用指南

### 访问
- **Spark Master Web UI**：`http://localhost:8088`
- **Spark Master**：`spark://localhost:7077`

### 提交作业
```bash
# 进入 spark master 容器
docker exec -it spark bash

# 提交示例作业
spark-submit --master spark://spark:7077 \
  --class org.apache.spark.examples.SparkPi \
  /opt/bitnami/spark/examples/jars/spark-examples_2.12-*.jar 10
```

---

## Flink 使用指南

### 访问
- **Flink Web UI**：`http://localhost:8090`（提交 Job、查看 Task 状态）

### 提交作业
```bash
# 进入 flink jobmanager 容器
docker exec -it flink bash

# 提交示例 WordCount 作业
flink run /opt/flink/examples/batch/WordCount.jar
```

---

## AI 开发环境使用指南

### 快速开始
```bash
# 1. 启动 AI 服务（需先确保 devtools-network 存在）
make ai-up

# 2. 拉取模型（默认 llama3.2，约 2GB）
make ollama-pull

# 3. 拉取嵌入模型（RAG 场景）
make ollama-pull model=nomic-embed-text

# 4. 访问 Open WebUI 开始对话
# http://localhost:3100
```

---

### Ollama 使用指南

**访问地址**
- **API**：`http://localhost:11434`（容器内：`http://ollama:11434`）
- **API 格式**：兼容 OpenAI `/v1/chat/completions`

**常用模型**

| 模型 | 大小 | 适用场景 |
|------|------|---------|
| `llama3.2` | ~2GB | 通用对话 |
| `qwen2.5:7b` | ~4.7GB | 中文场景 |
| `mistral` | ~4.1GB | 代码/推理 |
| `nomic-embed-text` | ~274MB | 文本嵌入（RAG） |
| `codellama` | ~3.8GB | 代码补全 |

```bash
# 拉取模型
docker exec ollama ollama pull qwen2.5:7b

# 列出已安装模型
docker exec ollama ollama list

# 命令行对话测试
docker exec -it ollama ollama run llama3.2
```

**Spring Boot 接入（OpenAI 兼容）**
```xml
<dependency>
    <groupId>org.springframework.ai</groupId>
    <artifactId>spring-ai-openai-spring-boot-starter</artifactId>
</dependency>
```

```yaml
spring:
  ai:
    openai:
      base-url: http://localhost:11434
      api-key: ollama          # Ollama 不验证 key，随意填
      chat:
        options:
          model: llama3.2
      embedding:
        options:
          model: nomic-embed-text
```

---

### Qdrant 使用指南

**访问地址**
- **Dashboard**：`http://localhost:6333/dashboard`
- **REST API**：`http://localhost:6333`（容器内：`http://qdrant:6333`）
- **gRPC**：`localhost:6334`

**Spring Boot 接入（Spring AI）**
```yaml
spring:
  ai:
    vectorstore:
      qdrant:
        host: localhost
        port: 6334
        collection-name: my-collection
        initialize-schema: true
```

**REST API 快速验证**
```bash
# 创建 collection
curl -X PUT http://localhost:6333/collections/test \
  -H 'Content-Type: application/json' \
  -d '{"vectors": {"size": 768, "distance": "Cosine"}}'

# 查看 collection
curl http://localhost:6333/collections
```

---

### LiteLLM 使用指南

LiteLLM 提供统一的 OpenAI 兼容 API，可代理路由到 Ollama 或其他 LLM。

**访问地址**
- **API**：`http://localhost:4000`（完全兼容 OpenAI SDK）
- **Admin UI**：`http://localhost:4000/ui`（admin/admin123）
- **Master Key**：`sk-local-dev-key`

**配置文件**：`${VOLUME_BASE}/litellm/config.yaml`
```yaml
model_list:
  - model_name: llama3.2
    litellm_params:
      model: ollama/llama3.2
      api_base: http://ollama:11434

  - model_name: qwen2.5
    litellm_params:
      model: ollama/qwen2.5:7b
      api_base: http://ollama:11434

  - model_name: embedding
    litellm_params:
      model: ollama/nomic-embed-text
      api_base: http://ollama:11434

litellm_settings:
  drop_params: true
```

**Python 接入**
```python
from openai import OpenAI

client = OpenAI(
    base_url="http://localhost:4000",
    api_key="sk-local-dev-key"
)

response = client.chat.completions.create(
    model="llama3.2",
    messages=[{"role": "user", "content": "Hello!"}]
)
```

---

### Flowise 使用指南

**访问地址**：`http://localhost:3101`（admin / admin123）

Flowise 提供拖拽式界面构建 LangChain / LlamaIndex 工作流，支持：
- RAG（文档问答）
- Agent（工具调用）
- 对话链（ConversationChain）

**典型 RAG 流程**
1. 打开 `http://localhost:3101` → Add New Chatflow
2. 拖入：**Ollama Embeddings** → **Qdrant** → **Ollama LLM** → **Conversational Retrieval QA Chain**
3. 配置：
   - Ollama Base URL：`http://ollama:11434`
   - Qdrant URL：`http://qdrant:6333`
4. 点击右上角保存 → 上传文档 → 开始对话
