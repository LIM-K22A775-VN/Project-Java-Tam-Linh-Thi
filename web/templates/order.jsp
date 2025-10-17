<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Danh sách đơn hàng</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/standard.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/order.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/ascesss/css/formchuan.css" />
    <script src="/static/CssTotal/standard.js"></script>
    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }
    </style>
        <!-- CDN & jQuery -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%= request.getContextPath() %>/CssTotal/standard.js"></script>

    
</head>
<body>

<jsp:include page="/partials/header.jsp" />
<jsp:include page="/partials/vitri.jsp" />

<div class="main">
    <div class="container">
        <h2 class="title">Danh sách đơn hàng</h2>
        <div class="status-tabs">
            <button class="filter-btn active" data-status="all">Tất cả</button>
            <button class="filter-btn" data-status="Đang chờ xử lý">Đang chờ xử lý</button>
            <button class="filter-btn" data-status="Đang vận chuyển">Đang vận chuyển</button>
            <button class="filter-btn" data-status="Đã giao hàng">Đã giao hàng</button>
            <button class="filter-btn" data-status="Đã hủy">Đã hủy</button>
        </div>

        <!-- Lặp qua danh sách orders -->
        <c:forEach var="order" items="${orders}">
            <div class="order_detail" data-status="${order.status}">
                <div class="order-info">
                    <p><strong>Đơn hàng - Ngày :</strong> 
                        <c:choose>
                            <c:when test="${not empty order.date_ordered}">
                                ${order.date_ordered}
                            </c:when>
                            <c:otherwise>
                                N/A
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <p style="margin: 10px 0;">
                        Trạng thái: <span class="status-label">${order.status}</span>
                    </p>
                    <button class="view-detail">
                        <a style="text-decoration: none; color: #fff;" href="order_detail.jsp?id=${order.id}">Xem chi tiết</a>
                    </button>
                </div>

                <table class="order-table">
                    <thead>
                        <tr>
                            <th>ID Món</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Đánh giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${order.items}">
                            <tr>
                                <td>${item.food_id}</td>
                                <td><img src="/static/avatars/media/${item.img}" alt="${item.name}" /></td>
                                <td>${item.name}</td>
                                <td>${item.price}</td>
                                <td>${item.quantity}</td>
                                <td>${item.price * item.quantity}</td>
                                <td>
                                    <form action="evaluate_dish.jsp" method="post" style="display:inline;">
                                        <input type="hidden" name="order_id" value="${order.id}" />
                                        <input type="hidden" name="food_id" value="${item.food_id}" />
                                        <button type="submit" class="rate-btn">Đánh giá</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="/partials/footer.jsp" />

<script>
    const userEmail = "${sessionScope.user_email}";
</script>
<script src="/static/CssTotal/jssignup.js"></script>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const filterButtons = document.querySelectorAll('.filter-btn');
    const orders = document.querySelectorAll('.order_detail');

    function renderOrders(status) {
        orders.forEach(order => {
            order.style.display = (status === 'all' || order.dataset.status === status) ? 'block' : 'none';
        });
    }

    renderOrders('all');

    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            const status = button.getAttribute('data-status');
            renderOrders(status);
        });
    });
});
</script>
     <script>
        var userEmail = "<%= session.getAttribute("user_email") != null ? session.getAttribute("user_email") : "" %>";
    </script>

    <script src="${pageContext.request.contextPath}/static/js/tuvan.js"></script>
    <script src="${pageContext.request.contextPath}/static/CssTotal/script.js"></script>
    <script src="/static/CssTotal/jsreserve.js"></script>
</body>
</html>
