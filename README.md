
# IoT Sensor Monitoring System

## 1. Giới thiệu

Hệ thống giám sát cảm biến IoT theo thời gian thực,
được phát triển cho môn Phát triển ứng dụng phân tán.

Hệ thống thu thập, xử lý, lưu trữ và hiển thị dữ liệu
cảm biến thông qua các dịch vụ giao tiếp qua mạng.

## 2. Mục tiêu

- Thu thập dữ liệu nhiệt độ, độ ẩm và CO2.
- Giao tiếp giữa các thiết bị bằng MQTT.
- Lưu trữ dữ liệu vào PostgreSQL.
- Xây dựng REST API bằng ASP.NET Core.
- Hiển thị dữ liệu thời gian thực bằng SignalR.
- Xây dựng Dashboard bằng React.
- Phát hiện và cảnh báo khi vượt ngưỡng.
- Triển khai các dịch vụ bằng Docker Compose.

## 3. Công nghệ sử dụng

| Thành phần | Công nghệ |
|---|---|
| Backend | ASP.NET Core Web API |
| Frontend | React |
| Database | PostgreSQL |
| IoT Simulator | Python |
| Message Broker | MQTT / Mosquitto |
| Real-time | SignalR |
| Deployment | Docker Compose |
| Version Control | Git / GitHub |

## 4. Cấu trúc dự án

- backend/: Backend API
- frontend/: Web Dashboard
- iot-simulator/: Giả lập thiết bị cảm biến
- mqtt/: Cấu hình MQTT Broker
- database/: Cơ sở dữ liệu
- docs/: Tài liệu và báo cáo tiến độ

## 5. Tiến độ

- [x] Tuần 1: Khởi tạo dự án và Git
- [ ] Tuần 2: Thiết kế hệ thống
- [ ] Tuần 3: IoT Simulator
- [ ] Tuần 4: Backend và Database
- [ ] Tuần 5: Frontend
- [ ] Tuần 6: Real-time
- [ ] Tuần 7: Cảnh báo và xử lý lỗi
- [ ] Tuần 8: Kiểm thử và hoàn thiện

## 6. Trạng thái

Dự án đang trong quá trình phát triển.
