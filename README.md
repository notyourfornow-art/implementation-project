# Implementation Project — Система учёта заявок (HelpDesk)

Учебный репозиторий внедрения информационной системы учёта заявок техникума.

## Назначение
Репозиторий является единым источником правды для подготовки, выполнения и сопровождения внедрения версии v1.2.0 (уведомления + миграция БД).

## Состав системы
- `backend/` — API-сервер (Python/FastAPI) *(в учебном проекте описан в docs/architecture.md)*
- `frontend/` — веб-интерфейс
- `database/` — PostgreSQL 16
- `notifications/` — сервис уведомлений (email/Telegram)

## Требования
- Docker 24+, Docker Compose 2+
- PostgreSQL 16
- Git 2.40+

## Быстрый старт (тестовая среда)
```bash
cp config/application.example.yml config/application.yml
docker compose up -d
pytest tests/smoke
```

## Развёртывание
Полный сценарий: [docs/deployment-plan.md](docs/deployment-plan.md)
Возврат: [docs/rollback-plan.md](docs/rollback-plan.md)
Сопровождение: [docs/support-runbook.md](docs/support-runbook.md)

## Поддержка
- L1: helpdesk@example.edu
- Менеджер сопровождения: support@example.edu
- Менеджер развёртывания: deploy@example.edu
