#!/bin/bash

echo "📊 CommuniKit Production Status"
echo "================================"
echo ""

echo "🐳 Docker Status:"
docker compose ps
echo ""

echo "💾 Disk Usage:"
df -h | grep -E "(Filesystem|/dev/)"
echo ""

echo "🔧 Memory Usage:"
free -h
echo ""

echo "📈 Container Stats:"
docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}"
echo ""

echo "🔍 Service Health:"
curl -s -o /dev/null -w "communikit.com: %{http_code} - %{time_total}s\n" https://communikit.com
curl -s -o /dev/null -w "indigenous.communikit.com: %{http_code} - %{time_total}s\n" https://indigenous.communikit.com
curl -s -o /dev/null -w "municipalities.communikit.com: %{http_code} - %{time_total}s\n" https://municipalities.communikit.com