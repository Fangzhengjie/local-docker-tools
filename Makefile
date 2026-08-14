CLUSTER_SERVICES := redis-cluster redis-sentinel mysql postgres kafka mongodb opensearch rabbitmq rocketmq clickhouse minio cassandra

.PHONY: init devtools-up devtools-down devtools-ps devtools-pull devtools-pull-up devtools-logs devtools-log \
        tools-up tools-down tools-ps tools-logs \
        restart exec bash \
        ai-up ai-down ai-ps ai-pull-up ai-logs ai-log ollama-pull \
        $(foreach s,$(CLUSTER_SERVICES),cluster-$(s)-up cluster-$(s)-down cluster-$(s)-ps cluster-$(s)-logs) \
        emulator-setup emulator-start emulator-start-gplay emulator-setup-gplay emulator-keyboard emulator-kill

# ─────────────────────────────────────────────
# 变量
# ─────────────────────────────────────────────
DEVTOOLS_COMPOSE = docker compose -p devtools -f docker-compose-devtools.yml
TOOLS_COMPOSE = docker compose -p tools -f compose/tools.yml

# ─────────────────────────────────────────────
# 初始化
# ─────────────────────────────────────────────

## 检查 .env 是否存在（占位符，实际检查已省略以兼容 Windows）
init:
	@echo "Initializing..."

# ─────────────────────────────────────────────
# devtools（日常开发环境）— project: devtools
# ─────────────────────────────────────────────

## 启动 devtools 所有服务
devtools-up: init
	$(DEVTOOLS_COMPOSE) up -d

## 停止 devtools 所有服务
devtools-down:
	$(DEVTOOLS_COMPOSE) down

## 查看 devtools 所有运行中服务状态
devtools-ps:
	$(DEVTOOLS_COMPOSE) ps

## 拉取 devtools 所有镜像
devtools-pull:
	$(DEVTOOLS_COMPOSE) pull

## 拉取最新镜像并启动 devtools
devtools-pull-up: init
	$(DEVTOOLS_COMPOSE) up -d --pull always

## 查看 devtools 服务日志
devtools-logs:
	$(DEVTOOLS_COMPOSE) logs -f

## 查看单个服务日志，用法: make devtools-log svc=postgres
devtools-log:
	$(DEVTOOLS_COMPOSE) logs -f $(svc)

## 启动扩展工具：Trino、Superset、Airflow、dbt、Jupyter、MLflow、监控和 Keycloak
tools-up: init
	$(TOOLS_COMPOSE) up -d

## 停止扩展工具
tools-down:
	$(TOOLS_COMPOSE) down

## 查看扩展工具状态
tools-ps:
	$(TOOLS_COMPOSE) ps

## 查看扩展工具日志
tools-logs:
	$(TOOLS_COMPOSE) logs -f

## 重启单个容器，用法: make restart svc=postgres
restart:
	docker restart $(svc)

## 进入容器 shell (sh)，用法: make exec svc=redis
exec:
	docker exec -it $(svc) sh

## 进入容器 shell (bash)，用法: make bash svc=postgres
bash:
	docker exec -it $(svc) bash

# ─────────────────────────────────────────────
# ai（AI 开发环境）— project: ai
# 包含：Ollama、Open WebUI、向量数据库（Qdrant/Milvus/Weaviate/ChromaDB/pgvector）、
#        LiteLLM、Flowise
# 依赖：devtools（共享 devtools-network）
# ─────────────────────────────────────────────
AI_COMPOSE = docker compose -p ai -f docker-compose-ai.yml

## 启动 AI 所有服务（依赖 devtools 网络）
ai-up: init
	$(AI_COMPOSE) up -d

## 拉取最新镜像并启动 AI 服务
ai-pull-up: init
	$(AI_COMPOSE) up -d --pull always

## 停止 AI 所有服务
ai-down:
	$(AI_COMPOSE) down

## 查看 AI 服务状态
ai-ps:
	$(AI_COMPOSE) ps

## 查看 AI 所有服务日志
ai-logs:
	$(AI_COMPOSE) logs -f

## 查看单个 AI 服务日志，用法: make ai-log svc=ollama
ai-log:
	$(AI_COMPOSE) logs -f $(svc)

## 拉取常用 LLM 模型（需先启动 ollama），用法: make ollama-pull model=llama3.2
ollama-pull:
	docker exec ollama ollama pull $(or $(model),llama3.2)

# ─────────────────────────────────────────────
# cluster（集群模式）— 每种集群独立 compose
# 所有集群共享 cluster-network 172.21.0.0/16
# 可用集群: redis mysql postgres kafka mongodb opensearch
#            rabbitmq rocketmq clickhouse minio cassandra
#
# 用法: make cluster-redis-up     启动 Redis 集群
#       make cluster-redis-down   停止 Redis 集群
#       make cluster-redis-ps     查看状态
#       make cluster-redis-logs   查看日志
# ─────────────────────────────────────────────
define CLUSTER_COMPOSE_CMD
docker compose --env-file .env -p cluster-$(1) -f cluster/docker-compose-$(1).yml
endef

## 启动指定集群，用法: make cluster-redis-up
$(foreach s,$(CLUSTER_SERVICES),cluster-$(s)-up): cluster-%-up: init
	$(call CLUSTER_COMPOSE_CMD,$*) up -d

## 停止指定集群，用法: make cluster-redis-down
$(foreach s,$(CLUSTER_SERVICES),cluster-$(s)-down): cluster-%-down:
	$(call CLUSTER_COMPOSE_CMD,$*) down

## 查看指定集群状态，用法: make cluster-redis-ps
$(foreach s,$(CLUSTER_SERVICES),cluster-$(s)-ps): cluster-%-ps:
	$(call CLUSTER_COMPOSE_CMD,$*) ps

## 查看指定集群日志，用法: make cluster-redis-logs
$(foreach s,$(CLUSTER_SERVICES),cluster-$(s)-logs): cluster-%-logs:
	$(call CLUSTER_COMPOSE_CMD,$*) logs -f

# ─────────────────────────────────────────────
# Android 模拟器 — 一键配置
# 支持两种镜像：
#   AOSP:        make emulator-start + make emulator-setup（root + iptables + 系统CA）
#   Google Play: make emulator-start-gplay + make emulator-setup-gplay（无root，用户CA + dns-server）
# ─────────────────────────────────────────────

## 一键配置模拟器（DNS + 证书 + 端口转发），每次冷启动后执行（AOSP 镜像）
emulator-setup:
	@echo "📱 Setting up emulator (AOSP)..."
	powershell -ExecutionPolicy Bypass -File scripts/install-emulator-certs.ps1

## 启动模拟器 — AOSP 镜像（支持 root + writable-system）
emulator-start:
	@echo "📱 Starting emulator (AOSP)..."
	@echo "⌨️  Enabling hardware keyboard (hw.keyboard=yes)..."
	powershell -Command "$$avdIni = \"$$env:USERPROFILE\\.android\\avd\\Medium_Phone_API_33.avd\\config.ini\"; if (Test-Path $$avdIni) { $$c = Get-Content $$avdIni; if ($$c -match 'hw.keyboard') { $$c = $$c -replace 'hw.keyboard\s*=.*','hw.keyboard=yes' } else { $$c += 'hw.keyboard=yes' }; Set-Content $$avdIni $$c; Write-Host '  hw.keyboard=yes set in config.ini' }"
	powershell -Command "$$sdkPath = \"$$env:LOCALAPPDATA\\Android\\Sdk\"; $$env:ANDROID_SDK_ROOT = $$sdkPath; Start-Process \"$$sdkPath\\emulator\\emulator.exe\" -ArgumentList '-avd Medium_Phone_API_33 -writable-system -no-snapshot'"
	adb wait-for-device
	@echo "✅ Emulator started. Now run: make emulator-setup"

## 启动模拟器 — Google Play 镜像（无 root，DNS 通过启动参数指定）
emulator-start-gplay:
	@echo "📱 Starting emulator (Google Play)..."
	@echo "⌨️  Enabling hardware keyboard (hw.keyboard=yes)..."
	powershell -Command "$$avdIni = \"$$env:USERPROFILE\\.android\\avd\\Medium_Phone_API_35.avd\\config.ini\"; if (Test-Path $$avdIni) { $$c = Get-Content $$avdIni; if ($$c -match 'hw.keyboard') { $$c = $$c -replace 'hw.keyboard\s*=.*','hw.keyboard=yes' } else { $$c += 'hw.keyboard=yes' }; Set-Content $$avdIni $$c; Write-Host '  hw.keyboard=yes set in config.ini' }"
	powershell -Command "$$sdkPath = \"$$env:LOCALAPPDATA\\Android\\Sdk\"; $$env:ANDROID_SDK_ROOT = $$sdkPath; Start-Process \"$$sdkPath\\emulator\\emulator.exe\" -ArgumentList '-avd Medium_Phone_API_35 -dns-server 10.0.2.2'"
	adb wait-for-device
	@echo "✅ Emulator started (Google Play). Now run: make emulator-setup-gplay"

## 配置 Google Play 模拟器（安装用户 CA + 端口转发 + DNS，无需 root）
emulator-setup-gplay:
	@echo "Setting up emulator (Google Play, no root)..."
	@echo "[1/3] Pushing mkcert CA certificate..."
	powershell -Command "$$caRoot = mkcert -CAROOT; adb push \"$$caRoot\rootCA.pem\" /sdcard/Download/mkcert-ca.crt"
	@echo "[2/3] Setting up port forwarding..."
	adb reverse tcp:8081 tcp:8081
	adb reverse tcp:8097 tcp:8097
	@echo "[3/3] Verifying DNS..."
	adb shell "ping -c 1 -W 3 grafana.local.dev" && echo "  DNS OK" || ( \
		echo "  DNS not configured. First-time setup required:" && \
		echo "    1. Open Settings > Network > WiFi" && \
		echo "    2. Long-press AndroidWifi > Modify network" && \
		echo "    3. Advanced > IP settings: Static" && \
		echo "    4. IP: 10.0.2.16, Gateway: 10.0.2.2, Prefix: 24, DNS 1: 10.0.2.2" && \
		echo "    5. Save" && \
		echo "" && \
		echo "  Also install CA cert: Settings > Security > Encryption > Install CA certificate" && \
		echo "    Select /sdcard/Download/mkcert-ca.crt" && \
		adb shell "am start -a android.settings.WIFI_SETTINGS" \
	)
	@echo "Setup complete (Google Play mode)"

## 修复键盘输入（Google API 镜像）
emulator-keyboard:
	@echo "⌨️  Fixing keyboard input for Google API image..."
	powershell -Command "$$avdIni = \"$$env:USERPROFILE\\.android\\avd\\Medium_Phone_API_33.avd\\config.ini\"; if (Test-Path $$avdIni) { $$c = Get-Content $$avdIni; if ($$c -match 'hw.keyboard') { $$c = $$c -replace 'hw.keyboard\s*=.*','hw.keyboard=yes' } else { $$c += 'hw.keyboard=yes' }; Set-Content $$avdIni $$c; Write-Host '  hw.keyboard=yes set' } else { Write-Host 'ERROR: AVD config not found' -ForegroundColor Red }"
	adb shell "settings put secure show_ime_with_hard_keyboard 1" 2>/dev/null || true
	@echo "✅ Keyboard enabled. Restart emulator if still not working."

## 关闭模拟器
emulator-kill:
	adb emu kill
