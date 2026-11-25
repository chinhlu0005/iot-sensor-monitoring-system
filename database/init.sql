
-- IoT Sensor Monitoring System
-- PostgreSQL Database Schema

-- 1. Sensors
CREATE TABLE IF NOT EXISTS sensors (
    id UUID PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    sensor_type VARCHAR(30) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    min_threshold DOUBLE PRECISION NOT NULL,
    max_threshold DOUBLE PRECISION NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT chk_sensor_threshold
        CHECK (min_threshold < max_threshold)
);

-- 2. Sensor readings
CREATE TABLE IF NOT EXISTS sensor_readings (
    id UUID PRIMARY KEY,
    sensor_id UUID NOT NULL,
    value DOUBLE PRECISION NOT NULL,
    recorded_at TIMESTAMPTZ NOT NULL,
    is_alert BOOLEAN NOT NULL DEFAULT FALSE,

    CONSTRAINT fk_reading_sensor
        FOREIGN KEY (sensor_id)
        REFERENCES sensors(id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_reading_value_finite
        CHECK (
            value > '-Infinity'::float8
            AND value < 'Infinity'::float8
        )
);

-- 3. Alerts
CREATE TABLE IF NOT EXISTS alerts (
    id UUID PRIMARY KEY,
    sensor_id UUID NOT NULL,
    reading_id UUID NOT NULL UNIQUE,
    message TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_alert_sensor
        FOREIGN KEY (sensor_id)
        REFERENCES sensors(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_alert_reading
        FOREIGN KEY (reading_id)
        REFERENCES sensor_readings(id)
        ON DELETE RESTRICT
);

-- 4. Indexes
CREATE INDEX IF NOT EXISTS idx_readings_sensor_time
    ON sensor_readings(sensor_id, recorded_at DESC);

CREATE INDEX IF NOT EXISTS idx_alerts_sensor_time
    ON alerts(sensor_id, created_at DESC);
