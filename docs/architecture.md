# Архитектурная схема

```
[Пользователь] → [Frontend (Nginx)] → [Backend API (FastAPI)] → [PostgreSQL 16]
                                        ↘ [Notifications service] → [SMTP / Telegram API]
```

## Компоненты
| Компонент | Технология | Порт | Владелец |
|-----------|-----------|------|----------|
| frontend | Nginx + React | 80 | Разработчик |
| backend | FastAPI (Python 3.12) | 8000 | Разработчик |
| notifications | Python worker | — | Разработчик |
| database | PostgreSQL 16 | 5432 | Deploy-менеджер |

## Интеграции
- SMTP-сервер колледжа (уведомления)
- Telegram Bot API (опционально)

## Зависимости
- Backend требует доступность PostgreSQL до старта
- Миграции выполняются до запуска backend (см. scripts/deploy)
