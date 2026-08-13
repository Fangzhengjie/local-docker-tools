# install-emulator-certs.ps1
# 设置 Android 模拟器：DNS 重定向 + CA 证书安装
# 使用 iptables DNS 重定向 + bind mount CA 证书
#
# 用法: .\scripts\install-emulator-certs.ps1
#
# 前提:
#   - 模拟器使用 AOSP 镜像（支持 adb root）
#   - dnsmasq 容器已启动 (make devtools-up)
#   - OpenSSL 已安装

param(
    [string]$CertsDir = "$PSScriptRoot\..\nginx\certs\ca",
    [string]$HostsFile = "$PSScriptRoot\..\etc\hosts\emulator"
)

$ErrorActionPreference = "Continue"

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host " Android Emulator Setup" -ForegroundColor Cyan
Write-Host " DNS + Custom CA + mkcert CA" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# ── Step 1: Root ──
Write-Host "[1/4] Getting root access..." -ForegroundColor Yellow
$rootResult = adb root 2>&1 | Out-String
if ($rootResult -match "cannot run as root") {
    Write-Host "  FAILED: Cannot get root." -ForegroundColor Red
    Write-Host "  Use AOSP image, not Google Play." -ForegroundColor Red
    exit 1
}
Start-Sleep -Seconds 2
Write-Host "  OK" -ForegroundColor Green

# ── Step 2: DNS redirect via iptables ──
Write-Host "[2/4] Redirecting DNS to dnsmasq (10.0.2.2:53)..." -ForegroundColor Yellow
# Remove existing rules first to avoid duplicates
$null = adb shell "iptables -t nat -D OUTPUT -p udp --dport 53 -j DNAT --to-destination 10.0.2.2:53 2>/dev/null" 2>&1
$null = adb shell "iptables -t nat -D OUTPUT -p tcp --dport 53 -j DNAT --to-destination 10.0.2.2:53 2>/dev/null" 2>&1
# Add NAT rules
$null = adb shell "iptables -t nat -A OUTPUT -p udp --dport 53 -j DNAT --to-destination 10.0.2.2:53" 2>&1
$null = adb shell "iptables -t nat -A OUTPUT -p tcp --dport 53 -j DNAT --to-destination 10.0.2.2:53" 2>&1
# Flush DNS cache by toggling airplane mode
$null = adb shell "cmd connectivity airplane-mode enable" 2>&1
Start-Sleep -Seconds 3
$null = adb shell "cmd connectivity airplane-mode disable" 2>&1
Start-Sleep -Seconds 8
# Verify with retry
$dnsOk = $false
for ($i = 1; $i -le 3; $i++) {
    $pingResult = adb shell "ping -c 1 -W 3 grafana.local.dev 2>&1" | Out-String
    if ($pingResult -match "10.0.2.2") {
        $dnsOk = $true
        break
    }
    Start-Sleep -Seconds 3
}
if ($dnsOk) {
    Write-Host "  DNS OK: *.local.dev -> 10.0.2.2" -ForegroundColor Green
} else {
    Write-Host "  WARNING: DNS redirect may not be working" -ForegroundColor Yellow
    Write-Host "  Make sure dnsmasq is running: docker ps -f name=dnsmasq" -ForegroundColor Gray
    Write-Host "  Try manually: adb shell ping -c 1 grafana.local.dev" -ForegroundColor Gray
}

# ── Step 3: Stage CA certs ──
Write-Host "[3/5] Staging CA certificates..." -ForegroundColor Yellow
# Unmount any previous overlay so we can access original certs
$null = adb shell "umount /system/etc/security/cacerts 2>/dev/null" 2>&1
$null = adb shell "umount /apex/com.android.conscrypt/cacerts 2>/dev/null" 2>&1
$null = adb shell "rm -rf /data/local/tmp/cacerts && mkdir -p /data/local/tmp/cacerts" 2>&1
# Copy original system CAs from versioned APEX path (not the symlink which may be empty after unmount)
$apexVersion = (adb shell "ls /apex/ | grep 'conscrypt@'" 2>&1).Trim()
if ($apexVersion) {
    $null = adb shell "cp /apex/${apexVersion}/cacerts/* /data/local/tmp/cacerts/" 2>&1
} else {
    $null = adb shell "cp /system/etc/security/cacerts/* /data/local/tmp/cacerts/ 2>/dev/null" 2>&1
}
$sysCertCount = (adb shell "ls /data/local/tmp/cacerts/ | wc -l" 2>&1).Trim()
Write-Host "  Copied $sysCertCount system CA certificates" -ForegroundColor Gray

$androidCertsDir = "$PSScriptRoot\..\nginx\certs\android-cacerts"
if (-not (Test-Path $androidCertsDir)) { $androidCertsDir = $CertsDir }
$certFiles = Get-ChildItem -Path $androidCertsDir -Filter "*.0" -ErrorAction SilentlyContinue
if (-not $certFiles) {
    # Generate Android-format certs from PEM files
    $pemFiles = Get-ChildItem -Path $CertsDir -Filter "*.pem" -ErrorAction SilentlyContinue
    foreach ($pem in $pemFiles) {
        $hash = (openssl x509 -inform PEM -subject_hash_old -in $pem.FullName -noout 2>&1).Trim()
        if ($hash -match '^[0-9a-f]{8}$') {
            $targetName = "${hash}.0"
            $null = adb push $pem.FullName "/data/local/tmp/cacerts/${targetName}" 2>&1
            $installed++
            Write-Host "  + $($pem.BaseName) -> ${targetName}" -ForegroundColor Gray
        }
    }
} else {
    foreach ($cert in $certFiles) {
        $null = adb push $cert.FullName "/data/local/tmp/cacerts/$($cert.Name)" 2>&1
        $installed++
        Write-Host "  + $($cert.BaseName)" -ForegroundColor Gray
    }
}
Write-Host "  Staged $installed certificates" -ForegroundColor Green

# ── Step 4: Mount tmpfs with all certs (APEX + system paths) ──
Write-Host "[4/5] Mounting CA store..." -ForegroundColor Yellow
$null = adb shell "chmod 644 /data/local/tmp/cacerts/*" 2>&1
$null = adb shell "chown root:root /data/local/tmp/cacerts/*" 2>&1
$null = adb shell "chcon u:object_r:system_security_cacerts_file:s0 /data/local/tmp/cacerts/*" 2>&1
# Mount tmpfs and copy all certs to both locations
$null = adb shell "mount -t tmpfs tmpfs /system/etc/security/cacerts && cp /data/local/tmp/cacerts/* /system/etc/security/cacerts/ && chmod 644 /system/etc/security/cacerts/* && chcon u:object_r:system_security_cacerts_file:s0 /system/etc/security/cacerts/*" 2>&1
$null = adb shell "mount -t tmpfs tmpfs /apex/com.android.conscrypt/cacerts && cp /data/local/tmp/cacerts/* /apex/com.android.conscrypt/cacerts/ && chmod 644 /apex/com.android.conscrypt/cacerts/* && chcon u:object_r:system_security_cacerts_file:s0 /apex/com.android.conscrypt/cacerts/*" 2>&1

$count = (adb shell "ls /system/etc/security/cacerts/ | wc -l" 2>&1).Trim()
Write-Host "  CA store: $count certificates (system + custom)" -ForegroundColor Green

# ── Step 5: Kill cached processes to pick up new certs ──
Write-Host "[5/5] Refreshing certificate cache..." -ForegroundColor Yellow
# Kill processes that cache cert store (WebView, NetworkMonitor)
$null = adb shell "pkill -f webview 2>/dev/null" 2>&1
$null = adb shell "pkill -f chromium 2>/dev/null" 2>&1
$null = adb shell "pkill -f NetworkMonitor 2>/dev/null" 2>&1
Write-Host "  Killed cached WebView/browser processes" -ForegroundColor Green
Write-Host "  New processes will trust custom CAs" -ForegroundColor Green

# ── Done ──
Write-Host ""
Write-Host "=====================================" -ForegroundColor Green
Write-Host " Setup Complete!" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green
Write-Host ""
Write-Host " DNS:   *.local.dev -> 10.0.2.2 (via iptables + dnsmasq)" -ForegroundColor White
Write-Host " CAs:   Custom CA + mkcert ($installed certs)" -ForegroundColor White
Write-Host " HTTPS: *.local.dev should now be trusted" -ForegroundColor White

# ── Bonus: adb reverse for React Native Metro bundler ──
$null = adb reverse tcp:8081 tcp:8081 2>&1
$null = adb reverse tcp:8097 tcp:8097 2>&1
Write-Host " Ports: localhost:8081 (Metro) + 8097 (DevTools) -> host" -ForegroundColor White

Write-Host ""
Write-Host " NOTE: Changes are lost on emulator restart." -ForegroundColor Yellow
Write-Host " Run 'make emulator-setup' again after each cold boot." -ForegroundColor Yellow
Write-Host ""
