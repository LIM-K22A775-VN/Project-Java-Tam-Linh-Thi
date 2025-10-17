<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/warehouse_admin.css"/>
</head>
<body>
<aside class="sidebar" id="sidebar">
    <div class="brand"><i class="fas fa-smile"></i> <span style="font-style: italic; font-weight: 600;">AdminLTE 4</span></div>
    <ul>
        <li><a href="order_admin.jsp"><i class="fas fa-shopping-bag"></i>&nbsp; Đơn hàng</a></li>
        <li><a href="booking_admin.jsp"><i class="fas fa-clipboard-list"></i>&nbsp; Đặt bàn</a></li>
        <li><a href="consultant_admin.jsp"><i class="fas fa-comment-dots"></i>&nbsp; Tư vấn</a></li>
        <li><a href="contact_admin.jsp"><i class="fas fa-phone"></i>&nbsp; Liên hệ</a></li>
        <li class="has-submenu">
            <a href="#" class="submenu-toggle"><i class="fas fa-utensils"></i>&nbsp; Món ăn <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
            <ul class="submenu">
                <li><a href="dish_admin.jsp" class="active">Tất cả món ăn</a></li>
                <li><a href="dish2_admin.jsp">Danh mục</a></li>
                <li><a href="dish3_admin.jsp">Thương hiệu</a></li>
            </ul>
        </li>
        <!-- Các menu khác giữ nguyên -->
    </ul>
</aside>

<div class="main" id="main">
    <div class="navbar">
        <div class="navbar-title">
            <button id="toggleSidebar"><i class="fas fa-bars"></i></button>
            <a href="admin.jsp">Trang chủ</a>
            <a href="contact.jsp">Liên hệ</a>
        </div>
        <div class="navbar-right">
            <div class="notification-wrapper">
                <i class="fas fa-bell" id="notificationBtn"></i>
                <span class="badge">15</span>
                <div class="notification-box" id="notificationBox">
                    <div class="title">15 Notifications</div>
                    <div class="item"><i class="fas fa-envelope"></i> 4 new messages <span>3 mins</span></div>
                    <div class="item"><i class="fas fa-user-plus"></i> 8 friend requests <span>12 hours</span></div>
                    <div class="item"><i class="fas fa-file-alt"></i> 3 new reports <span>2 days</span></div>
                    <div class="see-all">See All Notifications</div>
                </div>
            </div>
            <i class="fas fa-expand" id="fullscreenBtn"></i>
            <div class="user-info">
                <i class="fas fa-user"></i>
                <span>${userName}</span>
                <a href="${pageContext.request.contextPath}/logout.jsp"><i class="fas fa-power-off"></i> Thoát</a>
            </div>
        </div>
    </div>

    <div class="inner-position">
        <h2>Quản lý nhập/xuất</h2>
        <div class="position-right">
            <a href="intro.jsp">Trang chủ /</a>
            <p>Kho</p>
        </div>
    </div>

    <div class="content">
        <div class="container">
            <div class="buttons">
                <button onclick="showForm('nhap')">Phiếu nhập kho</button>
                <button onclick="showForm('xuat')">Phiếu xuất kho</button>
                <button onclick="window.location.href='history_storage.jsp'">Xem lịch sử</button>
            </div>

            <!-- FORM NHẬP -->
            <form id="form-nhap" class="form-section" method="post" action="${pageContext.request.contextPath}/nhapkho">
                <h2>Phiếu nhập kho</h2>

                <label for="nhap-nguoi">Người thực hiện</label>
                <input type="text" id="nhap-nguoi" name="nguoi_thuc_hien" value="${userName}" required>

                <label for="nhap-ngay">Ngày nhập</label>
                <input type="date" id="nhap-ngay" name="ngay_nhap" required>

                <label for="category-nhap">Chọn danh mục nguyên liệu</label>
                <select id="category-nhap" onchange="loadItems('nhap')">
                    <option value="">-- Chọn danh mục --</option>
                    <option value="kho">Đồ khô</option>
                    <option value="tuoi">Đồ tươi</option>
                    <option value="phache">Pha chế</option>
                </select>

                <div id="items-nhap" class="grid">
                    <c:forEach var="item" items="${nhapItems}">
                        <!-- Thêm các input item tương ứng -->
                    </c:forEach>
                </div>

                <div class="form-footer">
                    <button type="submit">Gửi phiếu nhập</button>
                </div>
            </form>

            <!-- FORM XUẤT -->
            <form id="form-xuat" class="form-section" method="post" action="${pageContext.request.contextPath}/xuatkho">
                <h2>Phiếu xuất kho</h2>

                <label for="xuat-nguoi">Người thực hiện</label>
                <input type="text" id="xuat-nguoi" name="nguoi_thuc_hien" value="${userName}" required>

                <label for="xuat-ngay">Ngày xuất</label>
                <input type="date" id="xuat-ngay" name="ngay_xuat" required>

                <label for="category-xuat">Chọn danh mục nguyên liệu</label>
                <select id="category-xuat" onchange="loadItems('xuat')">
                    <option value="">-- Chọn danh mục --</option>
                    <option value="kho">Đồ khô</option>
                    <option value="tuoi">Đồ tươi</option>
                    <option value="phache">Pha chế</option>
                </select>

                <div id="items-xuat" class="grid">
                    <c:forEach var="item" items="${xuatItems}">
                        <!-- Thêm các input item tương ứng -->
                    </c:forEach>
                </div>

                <div class="form-footer">
                    <button type="submit">Gửi phiếu xuất</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
<script src="${pageContext.request.contextPath}/static/CssTotal/warehouse_admin.js"></script>
</body>
</html>
