
# Thiết kế cơ sở dữ liệu IoT Monitoring

## 1. Database

- Hệ quản trị: PostgreSQL
- Tên database: iot_monitoring

## 2. Bảng sensors

Lưu thông tin các cảm biến đăng ký.

| Cột | Kiểu dữ liệu | Mô tả |
|---|---|---|
| id | UUID | Khóa chính |
| name | VARCHAR(100) | Tên cảm biến |
| sensor_type | VARCHAR(30) | Loại cảm biến |
| unit | VARCHAR(20) | Đơn vị đo |
| min_threshold | DOUBLE PRECISION | Ngưỡng dưới |
| max_threshold | DOUBLE PRECISION | Ngưỡng trên |
| created_at | TIMESTAMPTZ | Ngày tạo |

## 3. Bảng sensor_readings

Lưu lịch sử các lần đo.

| Cột | Kiểu dữ liệu | Mô tả |
|---|---|---|
| id | UUID | Khóa chính |
| sensor_id | UUID | Khóa ngoại đến sensors |
| value | DOUBLE PRECISION | Giá trị đo |
| recorded_at | TIMESTAMPTZ | Thời điểm đo |
| is_alert | BOOLEAN | Có vượt ngưỡng không |

## 4. Bảng alerts

Lưu thông tin cảnh báo.

| Cột | Kiểu dữ liệu | Mô tả |
|---|---|---|
| id | UUID | Khóa chính |
| sensor_id | UUID | Khóa ngoại đến sensors |
| reading_id | UUID | Khóa ngoại đến sensor_readings |
| message | TEXT | Nội dung cảnh báo |
| created_at | TIMESTAMPTZ | Thời điểm cảnh báo |

## 5. Quan hệ

- sensors (1) - (N) sensor_readings
- sensors (1) - (N) alerts
- sensor_readings (1) - (0..1) alerts

## 6. Quy tắc nghiệp vụ

- Mỗi cảm biến có một ID duy nhất.
- Mỗi bản ghi dữ liệu thuộc một cảm biến.
- min_threshold phải nhỏ hơn max_threshold.
- Nếu value nằm ngoài khoảng ngưỡng,
  is_alert được đặt thành true.
- Worker tạo cảnh báo khi dữ liệu vượt ngưỡng.
- Thời gian lưu trong database sử dụng TIMESTAMPTZ.
- API hỗ trợ tra cứu lịch sử theo khoảng thời gian.
