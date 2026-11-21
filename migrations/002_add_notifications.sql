-- Миграция v1.2.0
ALTER TABLE tickets ADD COLUMN priority VARCHAR(10) DEFAULT 'medium';

CREATE TABLE IF NOT EXISTS notifications (
    id SERIAL PRIMARY KEY,
    ticket_id INTEGER REFERENCES tickets(id),
    channel VARCHAR(20) NOT NULL,  -- email | telegram
    recipient VARCHAR(200) NOT NULL,
    sent_at TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending'
);

CREATE INDEX idx_notifications_ticket ON notifications(ticket_id);
