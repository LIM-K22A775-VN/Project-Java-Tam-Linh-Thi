<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết hóa đơn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/admin.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/standard_admin.css">
    
    <style>
        /* Copy toàn bộ CSS từ HTML cũ vào đây (giữ nguyên) */
    </style>
</head>

<body>
    <jsp:include page="partials/sidebar_admin.jsp" />
    <div class="main" id="main">
        <jsp:include page="partials/navbar_admin.jsp" />
        
        <div class="inner-position">
            <h2>Thống kê doanh thu/lợi nhuận</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>Doanh thu</p>
            </div>
        </div>

        <div class="content">
            <!-- Filter section -->
            <div class="filter-container">
                <div class="filter-group">
                    <button class="filter-btn active" data-type="today">Hôm nay</button>
                    <button class="filter-btn" data-type="week">Tuần này</button>
                    <button class="filter-btn" data-type="month">Tháng này</button>
                    <button class="filter-btn" data-type="year">Năm nay</button>
                </div>
                <div class="date-picker">
                    <input type="date" id="start-date">
                    <span>đến</span>
                    <input type="date" id="end-date">
                    <button id="apply-date">Áp dụng</button>
                </div>
            </div>

            <!-- Stats cards -->
            <div class="stats-container">
                <div class="stat-card income">
                    <i class="fas fa-wallet"></i>
                    <h3>Tổng doanh thu</h3>
                    <div class="value"><c:out value="${totalRevenue}"/> ₫</div>
                    <div class="compare positive">
                        <i class="fas fa-arrow-up"></i> 12% so với tháng trước
                    </div>
                </div>

                <div class="stat-card expense">
                    <i class="fas fa-money-bill-wave"></i>
                    <h3>Tổng chi phí</h3>
                    <div class="value"><c:out value="${totalCost}"/>₫</div>
                    <div class="compare negative">
                        <i class="fas fa-arrow-down"></i> 8% so với tháng trước
                    </div>
                </div>

                <div class="stat-card profit">
                    <i class="fas fa-chart-line"></i>
                    <h3>Lợi nhuận</h3>
                    <div class="value"><c:out value="${profit}"/></div>
                    <div class="compare positive">
                        <i class="fas fa-arrow-up"></i> 
                    </div>
                </div>

                <div class="stat-card orders">
                    <i class="fas fa-shopping-cart"></i>
                    <h3>Tổng đơn hàng</h3>
                    <div class="value"><c:out value="${totalOrdersAll}"/></div>
                    <div class="compare positive">
                        <i class="fas fa-arrow-up"></i> 
                    </div>
                </div>
            </div>

            <!-- Charts section -->
            <div class="chart-container">
                <div class="chart-card">
                    <h3>Biểu đồ doanh thu và chi phí</h3>
                    <div class="chart">
                        <canvas id="revenueChart"></canvas>
                    </div>
                </div>

                <div class="chart-card">
                    <h3>Phân bổ doanh thu</h3>
                    <div class="chart">
                        <canvas id="incomeDistributionChart"></canvas>
                    </div>
                </div>
            </div>

            <!-- Details section -->
            <div class="details-container">
                <div class="detail-card">
                    <h3>Chi tiết doanh thu</h3>
                    <table class="detail-table">
                        <thead>
                            <tr>
                                <th>Nguồn</th>
                                <th>Số lượng</th>
                                <th>Doanh thu</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${revenueDetails}">
                                <tr>
                                    <td><c:out value="${item.source}"/></td>
                                    <td><c:out value="${item.quantity}"/> đơn</td>
                                    <td class="positive-amount"><c:out value="${item.amount}"/>₫</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="detail-card">
                    <h3>Chi tiết chi phí</h3>
                    <table class="detail-table">
                        <thead>
                            <tr>
                                <th>Danh mục</th>
                                <th>Chi phí</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${costDetails}">
                                <tr>
                                    <td><c:out value="${item.category}"/></td>
                                    <td class="negative-amount"><c:out value="${item.amount}"/>₫</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Chart.js initialization remains the same
        const chartLabels = ${chartLabels}; // array từ Servlet
        const chartRevenue = ${chartRevenue};
        const chartCost = ${chartCost};
    </script>
    <script src="<%= request.getContextPath() %>/static/CssTotal/navbar_admin.js"></script>
</body>
</html>
