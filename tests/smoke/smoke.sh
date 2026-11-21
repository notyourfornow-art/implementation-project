#!/bin/bash
# Smoke-тест после deployment
set -e
BASE=http://localhost

echo "1. Проверка доступности frontend"
curl -fsS $BASE/ > /dev/null && echo "OK"

echo "2. Вход в систему"
TOKEN=$(curl -fsS -X POST $BASE/api/login -d '{"user":"test","pass":"test"}' | jq -r .token)
[ "$TOKEN" != "null" ] && echo "OK"

echo "3. Создание заявки"
TICKET=$(curl -fsS -X POST $BASE/api/tickets -H "Authorization: Bearer $TOKEN" -d '{"title":"Smoke test","priority":"high"}')
echo "$TICKET" | grep -q "id" && echo "OK"

echo "4. Проверка уведомления (v1.2.0)"
sleep 5
curl -fsS "$BASE/api/notifications?ticket_id=$(echo $TICKET | jq -r .id)" -H "Authorization: Bearer $TOKEN" | grep -q "pending\|sent" && echo "OK"

echo "5. Поиск заявки"
curl -fsS "$BASE/api/tickets?search=Smoke" -H "Authorization: Bearer $TOKEN" | grep -q "Smoke test" && echo "OK"

echo "SMOKE-ТЕСТ ПРОЙДЕН"
