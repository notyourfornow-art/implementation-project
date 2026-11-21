# План развёртывания v1.2.0

- **Изменение:** CHG-2026-0112
- **Версия:** v1.2.0, тег `v1.2.0`, commit `a1b2c3d`
- **Контрольная сумма артефакта:** `sha256: 9f8e7d...` (см. CI/CD run #145)
- **Целевая среда:** production
- **Окно работ:** 2026-11-08 02:00–04:00 MSK
- **Допустимый простой:** 30 минут
- **Команда:** Deploy-менеджер (Иванов), Разработчик (Петров), DBA (Сидорова)

## Предварительные проверки
- [ ] Backup БД выполнен и проверен (`scripts/deploy/backup.sh`)
- [ ] Staging-проверка пройдена (миграция + smoke)
- [ ] Артефакт v1.2.0 опубликован в registry, checksum сверен
- [ ] Уведомления отправлены пользователям (за 3 дня и за 1 день)

## Пошаговая последовательность
1. Зафиксировать текущую версию: `git tag v1.2.0 && git push origin v1.2.0`
2. Выполнить backup: `bash scripts/deploy/backup.sh`
3. Остановить backend: `docker compose stop backend`
4. Применить миграции: `bash scripts/deploy/migrate.sh`
5. Развернуть новый артефакт: `bash scripts/deploy/deploy.sh v1.2.0`
6. Запустить backend и notifications
7. Smoke-тест: `bash tests/smoke/smoke.sh`
8. Наблюдение метрик 15 минут (dashboard: monitoring/alerts)

## Критерии успеха
- Все шаги smoke-теста пройдены
- Ошибок в логах backend < 5 за 15 минут
- Уведомление о тестовой заявке доставлено

## Rollback
Триггеры и процедура: [rollback-plan.md](rollback-plan.md)
