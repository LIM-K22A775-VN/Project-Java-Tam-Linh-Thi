<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        /* CSS giữ nguyên như bản HTML gốc */
        :root {
            --primary: #4361ee;
            --primary-light: #eef2ff;
            --secondary: #3f37c9;
            --success: #4cc9f0;
            --danger: #f72585;
            --warning: #f8961e;
            --info: #4895ef;
            --dark: #212529;
            --light: #f8f9fa;
        }
        body {
            font-family: 'Source Sans 3', sans-serif;
            background-color: #f5f7fb;
            color: #333;
        }
        .container {
            padding: 20px;
            display: grid;
            grid-template-columns: 300px 1fr;
            gap: 20px;
            overflow-y: scroll;
        }
        /* ... (các style còn lại giữ nguyên như bản bạn gửi) ... */
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/sidebar_staff.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/navbar_admin.css">
</head>

<body>

    <jsp:include page="partials/sidebar_staff.jsp" />
    <div class="main" id="main">
        <jsp:include page="partials/navbar_staff.jsp" />

        <div class="inner-position">
            <h2>Dashboard</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/intro_qc">Trang chủ /</a>
                <p>Dashboard</p>
            </div>
        </div>

        <div class="container">

            <!-- Profile Section -->
            <div class="profile-card">
                <img src="${pageContext.request.contextPath}/static/avatars/${user.avatar}" 
                     alt="Avatar"
                     style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                
                <h3 class="profile-name">${user.username}</h3>
                <span class="profile-position">${user.role}</span>

                <div class="detail-item">
                    <i class="fas fa-venus"></i>
                    <span>${user.gender}</span>
                </div>
                <div class="detail-item">
                    <i class="fas fa-phone"></i>
                    <span>${user.phone}</span>
                </div>
                <div class="detail-item">
                    <i class="fas fa-envelope"></i>
                    <span>${user.email}</span>
                </div>

                <div class="salary-info">
                    <div>
                        <div class="salary-label">Lương cơ bản</div>
                        <div class="salary-amount">12,500,000 VND</div>
                    </div>
                    <i class="fas fa-wallet" style="font-size: 2rem; color: var(--primary);"></i>
                </div>
            </div>

            <div>
                <!-- Stats Cards -->
                <div class="stats-container">

                    <div class="stat-card order" onclick="window.location.href='${pageContext.request.contextPath}/order_staff'">
                        <div class="icon"><i class="fas fa-utensils"></i></div>
                        <div class="value">142</div>
                        <div class="label"><a href="${pageContext.request.contextPath}/order_staff">Đơn hàng</a></div>
                    </div>

                    <div class="stat-card booking" onclick="window.location.href='${pageContext.request.contextPath}/booking_staff'">
                        <div class="icon"><i class="fas fa-calendar-check"></i></div>
                        <div class="value">28</div>
                        <div class="label"><a href="${pageContext.request.contextPath}/booking_staff">Đặt bàn</a></div>
                    </div>

                    <div class="stat-card advice" onclick="window.location.href='${pageContext.request.contextPath}/consultant_staff'">
                        <div class="icon"><i class="fas fa-comments"></i></div>
                        <div class="value">15</div>
                        <div class="label"><a href="${pageContext.request.contextPath}/consultant_staff">Tư vấn</a></div>
                    </div>

                    <div class="stat-card contact" onclick="window.location.href='${pageContext.request.contextPath}/contact_staff'">
                        <div class="icon"><i class="fas fa-phone-volume"></i></div>
                        <div class="value">9</div>
                        <div class="label"><a href="${pageContext.request.contextPath}/contact_staff">Liên hệ</a></div>
                    </div>

                    <div class="stat-card review" onclick="window.location.href='${pageContext.request.contextPath}/evaluate_staff'">
                        <div class="icon"><i class="fas fa-star"></i></div>
                        <div class="value">4.8</div>
                        <div class="label"><a href="${pageContext.request.contextPath}/evaluate_staff">Đánh giá</a></div>
                    </div>

                    <div class="stat-card import-export" onclick="window.location.href='${pageContext.request.contextPath}/import_staff'">
                        <div class="icon"><i class="fas fa-exchange-alt"></i></div>
                        <div class="value">Auto</div>
                        <div class="label"><a href="${pageContext.request.contextPath}/import_staff">Nhập/Xuất</a></div>
                    </div>
                </div>

                <!-- Charts Section -->
                <div class="charts-container">
                    <div class="chart-card">
                        <h3 class="chart-title">Hiệu suất làm việc</h3>
                        <div class="chart-container"><canvas id="performanceChart"></canvas></div>
                    </div>

                    <div class="chart-card">
                        <h3 class="chart-title">Phân bổ công việc</h3>
                        <div class="chart-container"><canvas id="taskDistributionChart"></canvas></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Script xử lý menu và biểu đồ -->
    <script>
        const submenuToggles = document.querySelectorAll('.submenu-toggle');
        submenuToggles.forEach(toggle => {
            toggle.addEventListener('click', e => {
                e.preventDefault();
                const parent = toggle.parentElement;
                const isOpen = parent.classList.contains('open');
                document.querySelectorAll('.has-submenu').forEach(item => {
                    if (item !== parent) item.classList.remove('open');
                });
                parent.classList.toggle('open');
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            setTimeout(initializeCharts, 500);
        });

        function initializeCharts() {
            const performanceCtx = document.getElementById('performanceChart').getContext('2d');
            new Chart(performanceCtx, {
                type: 'line',
                data: {
                    labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
                    datasets: [{
                        label: 'Đơn hàng hoàn thành',
                        data: [18, 22, 25, 20, 28, 30],
                        borderColor: '#4361ee',
                        backgroundColor: 'rgba(67, 97, 238, 0.1)',
                        borderWidth: 2,
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đánh giá trung bình',
                        data: [4.2, 4.5, 4.7, 4.8, 4.9, 4.8],
                        borderColor: '#4cc9f0',
                        backgroundColor: 'rgba(76, 201, 240, 0.1)',
                        borderWidth: 2,
                        tension: 0.3,
                        fill: true,
                        yAxisID: 'y1'
                    }, {
                        label: 'Vi phạm',
                        data: [2, 1, 0, 1, 0, 0],
                        borderColor: '#f72585',
                        borderWidth: 2,
                        borderDash: [5, 5],
                        yAxisID: 'y1'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: { display: true, text: 'Số đơn hàng' }
                        },
                        y1: {
                            position: 'right',
                            beginAtZero: true,
                            max: 5,
                            title: { display: true, text: 'Điểm đánh giá' },
                            grid: { drawOnChartArea: false }
                        }
                    }
                }
            });

            const taskCtx = document.getElementById('taskDistributionChart').getContext('2d');
            new Chart(taskCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Nấu ăn', 'Chuẩn bị nguyên liệu', 'Vệ sinh', 'Kiểm kho', 'Khác'],
                    datasets: [{
                        data: [45, 25, 15, 10, 5],
                        backgroundColor: ['#4361ee', '#4cc9f0', '#f8961e', '#4895ef', '#f72585'],
                        borderWidth: 0
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { position: 'right' },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    return `${context.label}: ${context.raw}%`;
                                }
                            }
                        }
                    },
                    cutout: '70%'
                }
            });
        }
    </script>
</body>
</html>
