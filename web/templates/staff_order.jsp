<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- CSS + style inline vẫn giữ nguyên -->
    <link rel="stylesheet" href="CssTotal/sidebar_staff.css">
    <link rel="stylesheet" href="CssTotal/navbar_admin.css">
</head>

<body>
    <%@ include file="partials/sidebar_staff.jsp" %>

    <div class="main" id="main">
        <%@ include file="partials/navbar_staff.jsp" %>

        <div class="inner-position">
            <h2>Chọn món</h2>
            <div class="position-right">
                <a href="intro_qc">Trang chủ /</a>
                <p>Chọn món</p>
            </div>
        </div>

        <div class="container">
            <!-- Left Panel -->
            <div class="left-panel">
                <form class="filter-bar">
                    <label>Tìm kiếm:</label>
                    <input type="text" id="searchInput" placeholder="Tìm kiếm món, danh mục, thương hiệu..." oninput="filterMenu()" />
                    <select id="categoryFilter" onchange="filterMenu()">
                        <option value="all">Tất cả</option>
                        <option value="Khai vị">Khai vị</option>
                        <option value="Món chính">Món chính</option>
                        <option value="Canh-Tiêm-Súp">Canh-Tiêm-Súp</option>
                        <option value="Cơm-Mì-Cháo">Cơm-Mì-Cháo</option>
                        <option value="Bánh tráng miệng">Bánh tráng miệng</option>
                        <option value="Đồ uống">Đồ uống</option>
                        <option value="Món Việt">Món Việt</option>
                    </select>
                    <select id="brandFilter" onchange="filterMenu()">
                        <option value="all">Tất cả</option>
                        <option value="Món Âu">Món Âu</option>
                        <option value="Món Ý">Món Ý</option>
                        <option value="Món Nhật">Món Nhật</option>
                        <option value="Món Việt">Món Việt</option>
                    </select>
                    <button type="button"><i class="fa fa-search"></i> Tìm kiếm</button>
                </form>

                <!-- Menu Items -->
                <div class="menu1-panel" id="menu1-panel">
                    <c:forEach var="item" items="${foods}" varStatus="status">
                        <div class="menu-card" onclick="toggleSelect(${status.index})">
                            <img src="static/avatars/media/${item.image}" />
                            <h4>${item.nameFood}</h4>
                            <p><fmt:formatNumber value="${item.price}" type="number"/> VNĐ</p>
                            <p class="category">${item.category}</p>
                            <p class="brand">${item.style}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Bill Panel -->
            <div class="bill-panel">
                <h3>Đơn hàng</h3>
                <div id="bill-list"></div>
                <div class="bill-total">Tổng tiền: <span id="total">0</span> VNĐ</div>

                <div class="payment-method">
                    <h4>Phương thức thanh toán:</h4>
                    <div class="payment-options">
                        <label><input type="radio" name="payment" value="cash" checked> <i class="fa-solid fa-money-bill-wave"></i> Tiền mặt</label>
                        <label><input type="radio" name="payment" value="card"> <i class="fa-solid fa-credit-card"></i> Thẻ</label>
                        <label><input type="radio" name="payment" value="momo"> <i class="fa-brands fa-momo"></i> Momo</label>
                        <label><input type="radio" name="payment" value="other"> <i class="fa-solid fa-ellipsis"></i> Khác</label>
                    </div>
                </div>
                
                <p>idTable: ${booking_id}</p>
                
                <form id="checkoutForm" action="checkout" method="POST">
                    <input type="hidden" name="total" id="totalInput">
                    <input type="hidden" name="payment" id="paymentInput">
                    <input type="hidden" name="cart" id="cartInput">
                    <c:if test="${not empty booking_id}">
                        <input type="hidden" name="booking_id" value="${booking_id}">
                    </c:if>
                    <button id="checkoutBtn" class="export-btn" type="submit" disabled>
                        <i class="fa fa-print"></i> Xuất hoá đơn
                    </button>
                </form>
            </div>
        </div>
    </div>

    <c:if test="${not empty success}">
        <div id="toast" class="toast">${success}</div>
    </c:if>

    <!-- JavaScript giữ nguyên, chỉ đổi cách lấy menu từ JSP sang JS array -->
    <script>
        const menuItems = [
            <c:forEach var="item" items="${foods}" varStatus="status">
            {
                id: '${item.id}',
                nameFood: '${item.nameFood}',
                price: ${item.price},
                category: '${item.category}',
                style: '${item.style}',
                image: '${item.image}'
            }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

        const cart = [];
        // ... giữ nguyên JS renderMenu(), toggleSelect(), renderBill() ...
    </script>

    <script src="CssTotal/navbar_admin.js"></script>
</body>
</html>
