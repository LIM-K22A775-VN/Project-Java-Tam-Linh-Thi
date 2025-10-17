<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/standard_admin.css'/>">
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/detail_dish_admin.css'/>">
</head>

<body>
    <%-- Thanh bên trái (sidebar) --%>
    <aside class="sidebar" id="sidebar">
        <div class="brand">
            <i class="fas fa-smile"></i>
            <span style="font-style: italic; font-weight: 600;">AdminLTE 4</span>
        </div>
        <ul>
            <li><a href="<c:url value='/order_admin.jsp'/>"><i class="fas fa-shopping-bag"></i>&nbsp; Đơn hàng</a></li>
            <li><a href="<c:url value='/booking_admin.jsp'/>"><i class="fas fa-clipboard-list"></i>&nbsp; Đặt bàn</a></li>
            <li><a href="<c:url value='/consultant_admin.jsp'/>"><i class="fas fa-comment-dots"></i>&nbsp; Tư vấn</a></li>
            <li><a href="<c:url value='/contact_admin.jsp'/>"><i class="fas fa-phone"></i>&nbsp; Liên hệ</a></li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-utensils"></i>&nbsp; Món ăn <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="<c:url value='/dish_admin.jsp'/>" class="active">Tất cả món ăn</a></li>
                    <li><a href="<c:url value='/dish2_admin.jsp'/>">Danh mục</a></li>
                    <li><a href="<c:url value='/dish3_admin.jsp'/>">Thương hiệu</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-newspaper"></i>&nbsp; Bài viết <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="<c:url value='/article_admin.jsp'/>" class="active">Tất cả bài viết</a></li>
                    <li><a href="<c:url value='/theme_admin.jsp'/>">Chủ đề</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-warehouse"></i>&nbsp; Quản lý kho <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="#" class="active">Thực phẩm đông lạnh</a></li>
                    <li><a href="#">Đồ tươi</a></li>
                    <li><a href="#">Pha chế</a></li>
                    <li><a href="<c:url value='/storage4_admin.jsp'/>">Đồ khô</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-palette"></i>&nbsp; Giao diện <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="<c:url value='/menu_admin.jsp'/>" class="active">Menu</a></li>
                    <li><a href="<c:url value='/banner_admin.jsp'/>">Banner</a></li>
                    <li><a href="<c:url value='/library_admin.jsp'/>">Thư viện ảnh</a></li>
                    <li><a href="<c:url value='/keyword_admin.jsp'/>">Từ khóa</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-users"></i>&nbsp; Thành Viên <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="<c:url value='/member_admin.jsp'/>" class="active">Tất cả thành viên</a></li>
                    <li><a href="#">Thêm thành viên</a></li>
                    <li><a href="<c:url value='/staff_admin.jsp'/>">Nhân viên</a></li>
                </ul>
            </li>
        </ul>
    </aside>

    <%-- Nội dung chính --%>
    <div class="main" id="main">
        <div class="navbar">
            <div class="navbar-title">
                <button id="toggleSidebar"><i class="fas fa-bars"></i></button>
                <a href="<c:url value='/admin.jsp'/>">Trang chủ</a>
                <a href="<c:url value='/contact.jsp'/>">Liên hệ</a>
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
                    <span>${sessionScope.username}</span>
                    <a href="<c:url value='/intro.jsp'/>"><i class="fas fa-power-off"></i> Thoát</a>
                </div>
            </div>
        </div>

        <div class="inner-position">
            <h2>Chi tiết sản phẩm</h2>
            <div class="position-right">
                <a href="<c:url value='/intro.jsp'/>">Trang chủ /</a>
                <p>Sản phẩm</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="detail-header">
                    <div class="btn-group">
                        <form action="<c:url value='/deleteDish3'/>" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${dish.id}">
                            <button class="btn btn-red"><i class="fa fa-trash"></i> Xóa</button>
                        </form>
                        <button class="btn btn-back">
                            <a href="<c:url value='/show_dish3_admin.jsp'/>" style="text-decoration: none;color:#fff;">
                                <i class="fa fa-arrow-left"></i> Về danh sách
                            </a>
                        </button>
                    </div>
                </div>

                <table class="detail-table">
                    <thead>
                        <tr>
                            <th style="min-width: 300px;">Tên trường</th>
                            <th>Giá trị</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>ID</td><td>${dish.id}</td></tr>
                        <tr><td>Tên post</td><td>${dish.tenPost}</td></tr>
                        <tr>
                            <td>Hình ảnh</td>
                            <td>
                                <img src="<c:url value='/static/avatars/media/${dish.hinhAnh}'/>" alt="Ảnh món ăn" class="preview-img"/>
                            </td>
                        </tr>
                        <tr><td>Slug</td><td>${dish.slug}</td></tr>
                        <tr><td>Thương hiệu</td><td>${dish.thuongHieu}</td></tr>
                        <tr><td>Danh mục</td><td>${dish.danhMuc}</td></tr>
                        <tr><td>Mô tả</td><td style="line-height: 1.7;">${dish.moTa}</td></tr>
                        <tr><td>Nội dung</td><td class="long-text">${dish.noiDung}</td></tr>
                        <tr><td>Created by</td><td>${dish.createdBy}</td></tr>
                        <tr><td>Created At</td><td>${dish.createdAt}</td></tr>
                        <tr><td>Updated by</td><td>${dish.updatedBy}</td></tr>
                        <tr><td>Updated At</td><td>${dish.updatedAt}</td></tr>
                        <tr><td>Loại hình</td><td>${dish.loaiHinh}</td></tr>
                        <tr><td>Trạng thái</td><td>${dish.trangThai}</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="<c:url value='/static/CssTotal/standard_admin.js'/>"></script>
</body>
</html>
