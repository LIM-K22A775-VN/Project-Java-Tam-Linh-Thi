<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Chi tiết đơn hàng</title>
    <link rel="stylesheet" href="../static/CssTotal/standard.css" />
    <link rel="stylesheet" href="../static/CssTotal/orderdetail.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
    <script src="../static/CssTotal/standard.js"></script>

    <link rel="stylesheet" href="../static/ascesss/css/formchuan.css">

    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }
        /* Các style popup và button giữ nguyên từ HTML */
    </style>
</head>
<body>

<jsp:include page="partials/header.jsp" />
<jsp:include page="partials/vitri.jsp" />

<!-- Popup Xác nhận Hủy -->
<div id="cancelPopup" class="popup hidden">
    <div class="popup-content">
        <h2>Xác nhận hủy đơn</h2>
        <p>Bạn có chắc chắn muốn hủy đơn hàng này không?</p>
        <div class="popup-buttons">
            <button id="confirmCancelBtn" class="btn-confirm">Xác nhận</button>
            <button id="cancelCancelBtn" class="btn-cancel">Hủy</button>
        </div>
    </div>
</div>

<!-- Popup Hủy thành công -->
<div id="cancelSuccessPopup" class="popup hidden">
    <div class="popup-content">
        <h2>✅ Hủy đơn thành công!</h2>
        <p>Đơn hàng của bạn đã được hủy thành công!</p>
    </div>
</div>

<!-- Popup Xác nhận -->
<div id="confirmPopup" class="popup hidden">
    <div class="popup-content">
        <h2>Xác nhận đặt lại</h2>
        <p>Bạn có chắc muốn đặt lại đơn hàng này không?</p>
        <div class="popup-buttons">
            <button id="confirmBtn" class="btn-confirm">Xác nhận</button>
            <button id="cancelBtn" class="btn-cancel">Hủy</button>
        </div>
    </div>
</div>

<!-- Popup Chúc mừng -->
<div id="congratsPopup" class="popup hidden">
    <div class="popup-content">
        <h2>🎉 Đặt lại thành công!</h2>
        <p>Đơn hàng đã được đặt lại thành công!</p>
    </div>
</div>

<div class="main">
    <div class="container">
        <div class="order-container">
            <div class="customer-info">
                <h2 style="text-align: center">Thông tin đơn hàng</h2>
                <p><strong>Họ tên:</strong> ${user.username}</p>
                <p><strong>Điện thoại:</strong> ${user.phone}</p>
                <p><strong>Địa chỉ:</strong> ${user.address}</p>
                <p><strong>Tổng tiền:</strong> 
                    <fmt:formatNumber value="${order.total}" type="number" groupingUsed="true"/> VNĐ
                </p>
                <p><strong>Trạng thái:</strong> ${order.status}</p>
                <p><strong>Ngày tạo đơn:</strong> ${order.date_ordered}</p>
            </div>

            <h3 class="section-title">Chi tiết món ăn</h3>
            <table class="detail-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Hình ảnh</th>
                        <th>Tên món ăn</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${order.items}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td><img src="../static/avatars/media/${item.img}" alt="${item.food_name}"></td>
                            <td>${item.food_name}</td>
                            <td><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true"/> VNĐ</td>
                            <td>${item.quantity}</td>
                            <td><fmt:formatNumber value="${item.subtotal}" type="number" groupingUsed="true"/> VNĐ</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <p class="thankyou">
                Cảm ơn bạn đã đặt món tại <strong>TheRiceBowl</strong>!
            </p>

            <div class="total-cancel">
                <p class="total-amount">
                    Tổng tiền: <strong><fmt:formatNumber value="${order.total}" type="number" groupingUsed="true"/> VNĐ</strong>
                </p>

                <c:choose>
                    <c:when test="${order.status eq 'Đã hủy'}">
                        <button class="cancel-btn" onclick="showConfirmReorder('${order.id}')">Đặt lại</button>
                    </c:when>
                    <c:when test="${order.status eq 'Đang chờ xử lý'}">
                        <button class="cancel-btn" onclick="showConfirmCancel('${order.id}')">Hủy đơn hàng</button>
                    </c:when>
                </c:choose>
            </div>

        </div>
    </div>
</div>

<jsp:include page="partials/footer.jsp" />

<script src="../static/js/tuvan.js"></script>
<script src="../static/CssTotal/jssignup.js"></script>

<script>
let pendingOrderId = null;

function showConfirmReorder(orderId) {
    pendingOrderId = orderId;
    document.getElementById('confirmPopup').classList.remove('hidden');
}

function showConfirmCancel(orderId) {
    pendingOrderId = orderId;
    document.getElementById('cancelPopup').classList.remove('hidden');
}

function reorder(orderId) {
    fetch('/reorder/' + orderId, { method: 'POST' })
        .then(res => res.json())
        .then(data => {
            if(data.status === 'success') {
                document.getElementById('congratsPopup').classList.remove('hidden');
                launchFireworks();
                setTimeout(() => { window.location.href = '/order'; }, 3000);
            } else {
                alert('Đặt lại thất bại: ' + data.message);
            }
        })
        .catch(err => { console.error(err); alert('Lỗi!'); });
}

function cancelOrder(orderId) {
    fetch('/cancel_order/' + orderId, { method: 'POST' })
        .then(res => res.json())
        .then(data => {
            if(data.status === 'success') {
                document.getElementById('cancelSuccessPopup').classList.remove('hidden');
                setTimeout(() => { window.location.href = '/order'; }, 2000);
            } else {
                alert('Hủy thất bại: ' + data.message);
            }
        })
        .catch(err => { console.error(err); alert('Lỗi!'); });
}

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('confirmBtn').onclick = function() {
        reorder(pendingOrderId);
        document.getElementById('confirmPopup').classList.add('hidden');
    };
    document.getElementById('cancelBtn').onclick = function() {
        document.getElementById('confirmPopup').classList.add('hidden');
    };
    document.getElementById('confirmCancelBtn').onclick = function() {
        cancelOrder(pendingOrderId);
        document.getElementById('cancelPopup').classList.add('hidden');
    };
    document.getElementById('cancelCancelBtn').onclick = function() {
        document.getElementById('cancelPopup').classList.add('hidden');
    };
});

function launchFireworks() {
    const duration = 2 * 1000;
    const end = Date.now() + duration;

    (function frame() {
        confetti({ particleCount: 5, angle: 60, spread: 55, origin: {x: 0} });
        confetti({ particleCount: 5, angle: 120, spread: 55, origin: {x: 1} });
        if(Date.now() < end) requestAnimationFrame(frame);
    })();
}
</script>

<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>

</body>
</html>
