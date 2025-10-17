<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="../static/CssTotal/sidebar_staff.css">
    <link rel="stylesheet" href="../static/CssTotal/navbar_admin.css">

    <style>
        /* Giữ nguyên toàn bộ CSS từ HTML bạn gửi */
    </style>
</head>
<body>

<jsp:include page="partials/sidebar_staff.jsp" />
<div class="main" id="main">
    <jsp:include page="partials/navbar_staff.jsp" />

    <div class="inner-position">
        <h2>xử lý đơn hàng</h2>
        <div class="position-right">
            <a href="intro.jsp">Trang chủ /</a>
            <p>Đơn hàng</p>
        </div>
    </div>

    <div class="container">
        <div class="order-section">
            <h2 style="text-align:center;">Danh sách đơn hàng</h2>
            <form class="filter-dropdown">
                <label for="statusFilter">Lọc theo:</label>
                <select id="statusFilter" onchange="filterOrders(this.value)">
                    <option value="all">Tất cả</option>
                    <option value="Đang chờ xử lý">Đang chờ xử lý</option>
                    <option value="Đang vận chuyển">Đang vận chuyển</option>
                    <option value="Đã giao hàng">Đã giao hàng</option>
                    <option value="Đã hủy">Đã hủy</option>
                </select>
            </form>

            <div class="order-list">
                <c:forEach var="order" items="${orders}">
                    <div class="order-card" data-status="${order.status}">
                        <div class="order-summary" onclick="toggleDetails(this)">
                            <div>
                                <h4 class="order-title">Đơn hàng #${order.IdOrder} lúc ${order.timeOrder}</h4>
                                <div class="tao">
                                    <img src="../static/avatars/${order.avatar}" alt="Avatar người đặt"
                                         style="width: 25px; height: 25px; border-radius: 50%; object-fit: cover; margin: 5px 0;">
                                    <p>${order.userName}</p>
                                </div>
                                <p><i class="fa fa-phone"></i> ${order.phone}</p>
                                <p><i class="fa fa-map-marker-alt"></i> ${order.address}</p>
                            </div>
                            <div class="order-meta">
                                <c:choose>
                                    <c:when test="${order.status eq 'Đang chờ xử lý'}">
                                        <span class="status-yellow">${order.status}</span>
                                    </c:when>
                                    <c:when test="${order.status eq 'Đã hủy'}">
                                        <span class="status-red">${order.status}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status">${order.status}</span>
                                    </c:otherwise>
                                </c:choose>
                                <span class="date">${order.timeOrder}</span>
                                <i class="fa fa-chevron-down toggle-icon"></i>
                            </div>
                        </div>

                        <div class="order-details">
                            <p><strong>Ghi chú:</strong> ${order.note}</p>
                            <p><strong>Phương thức thanh toán:</strong> ${order.payment_method}</p>
                            <div class="item-list">
                                <c:forEach var="item" items="${order.items}">
                                    <div class="item">
                                        <img src="../static/avatars/media/${item.image}" alt="${item.nameFood}">
                                        <div class="info">
                                            <h5>${item.nameFood}</h5>
                                            <p>
                                                Giá: <fmt:formatNumber value="${item.unit_price}" type="number" groupingUsed="true"/>đ |
                                                SL: ${item.quantity} |
                                                Thành tiền: <fmt:formatNumber value="${item.subtotal}" type="number" groupingUsed="true"/>đ
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="total">Tổng cộng:
                                <strong><fmt:formatNumber value="${order.grand_total}" type="number" groupingUsed="true"/>đ</strong>
                            </div>

                            <div class="order-actions" style="margin-top:15px; display:flex; justify-content:space-between; flex-wrap:wrap; gap:10px;">
                                <div>
                                    <label for="statusSelect${order.IdOrder}" style="font-weight:500;">Cập nhật trạng thái: </label>
                                    <select id="statusSelect${order.IdOrder}" style="padding:6px 12px; border-radius:6px; border:1px solid #ccc;">
                                        <option value="Đang chờ xử lý" <c:if test="${order.status eq 'Đang chờ xử lý'}">selected</c:if>>Đang chờ xử lý</option>
                                        <option value="Đang vận chuyển" <c:if test="${order.status eq 'Đang vận chuyển'}">selected</c:if>>Đang vận chuyển</option>
                                        <option value="Đã giao hàng" <c:if test="${order.status eq 'Đã giao hàng'}">selected</c:if>>Đã giao hàng</option>
                                        <option value="Đã hủy" <c:if test="${order.status eq 'Đã hủy'}">selected</c:if>>Đã hủy</option>
                                    </select>
                                </div>
                                <button onclick="updateOrderStatus('${order.IdOrder}')"
                                        <c:if test="${order.status eq 'Đã hủy'}">disabled style="opacity:0.6; cursor:not-allowed;"</c:if>
                                        style="padding:8px 16px; background:#007bff; border:none; border-radius:6px; color:white; font-weight:bold; cursor:pointer;">
                                    ✔ Cập nhật
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#sidebar").load("sidebar_staff.jsp?v=" + Math.random());
        $("#navbar").load("navbar_staff.jsp?v=" + Math.random(), function () {
            $.getScript("../static/CssTotal/navbar_admin.js");
        });
    });

    function toggleDetails(element) {
        const card = element.parentElement;
        card.classList.toggle('open');
    }

    function filterOrders(status) {
        const cards = document.querySelectorAll('.order-card');
        cards.forEach(card => {
            card.style.display = (status === 'all' || card.getAttribute('data-status') === status) ? 'block' : 'none';
        });
    }

    function updateOrderStatus(orderId) {
        const selectElement = document.querySelector(`#statusSelect${orderId}`);
        const newStatus = selectElement.value;
        fetch('/update_order_status', {
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: `order_id=${encodeURIComponent(orderId)}&new_status=${encodeURIComponent(newStatus)}`
        })
        .then(response => response.json())
        .then(data => {
            if(data.success) {
                alert(`Đã cập nhật trạng thái đơn hàng #${orderId} thành: ${newStatus}`);
                window.location.reload();
            } else {
                alert("Có lỗi xảy ra khi cập nhật trạng thái!");
            }
        })
        .catch(error => console.error('Lỗi:', error));
    }

    const usernameDisplay = document.getElementById("usernameDisplay");
    const userDropdown = document.getElementById("userDropdown");

    usernameDisplay.addEventListener("click", function (event) {
        event.stopPropagation();
        userDropdown.classList.toggle("show");
    });

    window.addEventListener("click", function () {
        userDropdown.classList.remove("show");
    });

    const fullscreenBtn = document.getElementById("fullscreenBtn");
    fullscreenBtn.addEventListener("click", () => {
        if (!document.fullscreenElement) {
            document.documentElement.requestFullscreen();
        } else {
            document.exitFullscreen();
        }
    });
</script>

</body>
</html>
