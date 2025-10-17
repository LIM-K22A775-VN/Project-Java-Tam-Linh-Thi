<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/admin.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/export_storage.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>

    <%-- Sidebar --%>
    <aside class="sidebar" id="sidebar">
        <div class="brand"><i class="fas fa-smile"></i> 
            <span style="font-style: italic; font-weight: 600;">AdminLTE 4</span>
        </div>
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

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-newspaper"></i>&nbsp; Bài viết <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="article_admin.jsp" class="active">Tất cả bài viết</a></li>
                    <li><a href="theme_admin.jsp">Chủ đề</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-warehouse"></i>&nbsp; Quản lý kho <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="#" class="active">Thực phẩm đông lạnh</a></li>
                    <li><a href="#">Đồ tươi</a></li>
                    <li><a href="#">Pha chế</a></li>
                    <li><a href="storage4_admin.jsp">Đồ khô</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-palette"></i>&nbsp; Giao diện <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="menu_admin.jsp" class="active">Menu</a></li>
                    <li><a href="banner_admin.jsp">Banner</a></li>
                    <li><a href="library_admin.jsp">Thư viện ảnh</a></li>
                    <li><a href="keyword_admin.jsp">Từ khóa</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-users"></i>&nbsp; Thành Viên <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="member_admin.jsp" class="active">Tất cả thành viên</a></li>
                    <li><a href="#">Thêm thành viên</a></li>
                    <li><a href="staff_admin.jsp">Nhân viên</a></li>
                </ul>
            </li>
        </ul>
    </aside>

    <%-- Main content --%>
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
                    <span>${sessionScope.username != null ? sessionScope.username : "Phan Linh"}</span>
                    <a href="intro.jsp"><i class="fas fa-power-off"></i> Thoát</a>
                </div>
            </div>
        </div>

        <div class="inner-position">
            <h2>Chi tiết phiếu xuất</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>Xem lịch sử</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="nav">
                    <h2>Thông tin phiếu</h2>
                    <button class="return">
                        <a href="history_storage.jsp" style="text-decoration: none;color:#fff;">Quay lại</a>
                    </button>
                </div>

                <%-- Thông tin phiếu nhập --%>
                <div class="info-section">
                    <p><strong>ID phiếu nhập:</strong> <%= request.getAttribute("idPhieu") != null ? request.getAttribute("idPhieu") : "PN001" %></p>
                    <p><strong>Người thực hiện:</strong> <%= request.getAttribute("nguoiThucHien") != null ? request.getAttribute("nguoiThucHien") : "Nguyễn Văn A" %></p>
                    <p><strong>Ngày nhập:</strong> <%= request.getAttribute("ngayNhap") != null ? request.getAttribute("ngayNhap") : "2025-07-09" %></p>
                </div>

                <%-- Bảng nguyên liệu --%>
                <table>
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên nguyên liệu</th>
                            <th>Số lượng</th>
                            <th>Đơn vị</th>
                            <th>Giá trung bình</th>
                            <th>Loại</th>
                            <th>Hạn sử dụng</th>
                            <th>Ghi chú</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            java.util.List<String[]> nguyenLieu = (java.util.List<String[]>) request.getAttribute("nguyenLieu");
                            if (nguyenLieu != null) {
                                int i = 1;
                                for (String[] n : nguyenLieu) {
                        %>
                            <tr>
                                <td><%= i++ %></td>
                                <td><%= n[0] %></td>
                                <td><%= n[1] %></td>
                                <td><%= n[2] %></td>
                                <td><%= n[3] %></td>
                                <td><%= n[4] %></td>
                                <td><%= n[5] %></td>
                                <td><%= n[6] %></td>
                            </tr>
                        <% 
                                }
                            } else {
                        %>
                            <tr>
                                <td>1</td>
                                <td>Gạo</td>
                                <td>50</td>
                                <td>kg</td>
                                <td>10.000đ</td>
                                <td>Đồ khô</td>
                                <td>2025-08-01</td>
                                <td>Loại ST25</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Mì tôm</td>
                                <td>100</td>
                                <td>gói</td>
                                <td>5.000đ</td>
                                <td>Đồ khô</td>
                                <td>2026-01-01</td>
                                <td>Thùng 30 gói</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
</body>
</html>
