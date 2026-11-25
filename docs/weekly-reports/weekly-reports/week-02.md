
# Báo cáo tiến độ - Tuần 2

## Đề tài
Hệ thống giám sát cảm biến IoT

## Môn học
Phát triển ứng dụng phân tán

## 1. Công việc đã hoàn thành

- Phân tích và thiết kế kiến trúc hệ thống phân tán.
- Sử dụng RabbitMQ làm message broker.
- Thiết kế cơ sở dữ liệu PostgreSQL.
- Xây dựng file database/init.sql.
- Khởi chạy PostgreSQL 16 bằng Docker.
- Kiểm tra thành công 3 bảng:
  - sensors
  - sensor_readings
  - alerts
- Khởi chạy RabbitMQ bằng Docker.
- Tạo hàng đợi sensor.readings.
- Kiểm thử gửi thông điệp JSON vào RabbitMQ.
- Khởi tạo ASP.NET Core Sensor API với .NET 10.
- Build và khởi chạy thử Sensor API thành công.

## 2. Kết quả kiểm thử

- PostgreSQL: Healthy.
- RabbitMQ: Healthy.
- Database: Đã tạo đủ 3 bảng.
- RabbitMQ: Đã tiếp nhận thông điệp thử nghiệm.
- Sensor API: Build thành công và chạy trên localhost:5000.

## 3. Chức năng chưa triển khai

- API đăng ký cảm biến.
- API nhận dữ liệu đo từ cảm biến.
- Kết nối Sensor API với PostgreSQL.
- Monitor Worker xử lý dữ liệu.
- Notification Service.
- React Dashboard.

## 4. Kế hoạch Tuần 3

- Kết nối Sensor API với PostgreSQL.
- Xây dựng API POST /sensors.
- Xây dựng API GET /sensors.
- Xây dựng API POST /sensors/{id}/readings.
- Tích hợp Sensor API với RabbitMQ.
- Xây dựng Python Sensor Clients.
- Kiểm thử dữ liệu từ nhiều cảm biến giả lập.

## 5. Kết luận

Đã hoàn thành thiết kế và thiết lập các thành phần
hạ tầng phân tán cơ bản.

Các dịch vụ PostgreSQL, RabbitMQ và project
Sensor API đã được khởi tạo, kiểm tra thành công.
