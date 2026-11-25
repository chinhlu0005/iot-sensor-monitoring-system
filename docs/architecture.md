
# Kiến trúc hệ thống giám sát cảm biến IoT

## 1. Giới thiệu

Hệ thống tiếp nhận dữ liệu từ nhiều cảm biến giả lập,
xử lý bất đồng bộ qua RabbitMQ, lưu trữ dữ liệu
và gửi cảnh báo gần thời gian thực đến Dashboard.

## 2. Kiến trúc phân tán

Sensor Clients
    |
    v
Sensor API
    |
    v
RabbitMQ
    |
    v
Monitor Worker
    |
    +----> PostgreSQL
    |
    +----> RabbitMQ (Alert Events)
                |
                v
        Notification Service
                |
                v
         React Dashboard

Dashboard cũng gọi REST API để truy vấn
danh sách cảm biến và lịch sử dữ liệu.

## 3. Các thành phần

### Sensor Clients
- Viết bằng Python.
- Giả lập nhiều cảm biến độc lập.
- Gửi dữ liệu qua HTTP đến Sensor API.

### Sensor API
- ASP.NET Core Web API.
- Đăng ký và quản lý cảm biến.
- Tiếp nhận dữ liệu đo.
- Kiểm tra dữ liệu đầu vào.
- Đưa thông điệp vào RabbitMQ.
- Cung cấp API tra cứu dữ liệu.

### RabbitMQ
- Là message broker của hệ thống.
- Sử dụng hàng đợi sensor.readings.
- Phân phối thông điệp đến Monitor Worker.
- Phân phối sự kiện cảnh báo đến Notification Service.

### Monitor Worker
- Sử dụng .NET Worker Service.
- Đọc dữ liệu từ hàng đợi.
- Lưu dữ liệu vào PostgreSQL.
- Kiểm tra dữ liệu theo ngưỡng cảnh báo.
- Phát sự kiện khi vượt ngưỡng.

### PostgreSQL
- Lưu thông tin cảm biến.
- Lưu lịch sử dữ liệu.
- Lưu thông tin cảnh báo.

### Notification Service
- Nhận sự kiện cảnh báo từ RabbitMQ.
- Sử dụng SignalR.
- Gửi cảnh báo đến Dashboard Client.

### React Dashboard
- Hiển thị dữ liệu cảm biến.
- Hiển thị biểu đồ theo thời gian.
- Tra cứu lịch sử dữ liệu.
- Hiển thị cảnh báo gần thời gian thực.
- Sử dụng giao diện Dark Dashboard.

## 4. Các API bắt buộc

POST /sensors

POST /sensors/{id}/readings

GET /sensors

GET /sensors/{id}/readings/latest

GET /sensors/{id}/readings

API lịch sử hỗ trợ tham số from và to.

## 5. Công nghệ

- Python: Sensor Clients
- ASP.NET Core: Sensor API
- RabbitMQ: Message Broker
- .NET Worker Service: Monitor Worker
- PostgreSQL: Database
- ASP.NET Core SignalR: Notification Service
- React + TypeScript: Dashboard
- Docker Compose: Triển khai

## 6. Nguyên tắc xử lý

- Mỗi thành phần có trách nhiệm riêng.
- Sensor API không xử lý dữ liệu đo trực tiếp.
- Worker xử lý dữ liệu bất đồng bộ.
- Thông điệp chỉ được xác nhận sau khi xử lý thành công.
- Các dữ liệu trùng lặp cần được kiểm soát.
- Cảnh báo được gửi đến Dashboard qua SignalR.
- Dữ liệu lịch sử được lưu trong PostgreSQL.
