<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang quản trị</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../static/CssTotal/standard_admin.css"/>
        <link rel="stylesheet" href="../static/CssTotal/bin_dish_admin.css"/>
    </head>
    <body>
        <aside class="sidebar" id="sidebar">
            <div class="brand">
                <i class="fas fa-smile"></i>
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
                        <li><a href="dish_admin.jsp">Tất cả món ăn</a></li>
                        <li><a href="dish2_admin.jsp">Danh mục</a></li>
                        <li><a href="dish3_admin.jsp">Thương hiệu</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-newspaper"></i>&nbsp; Bài viết <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="article_admin.jsp">Tất cả bài viết</a></li>
                        <li><a href="theme_admin.jsp">Chủ đề</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-warehouse"></i>&nbsp; Quản lý kho <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="#">Thực phẩm đông lạnh</a></li>
                        <li><a href="#">Đồ tươi</a></li>
                        <li><a href="#">Pha chế</a></li>
                        <li><a href="storage4_admin.jsp">Đồ khô</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-palette"></i>&nbsp; Giao diện <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="menu_admin.jsp">Menu</a></li>
                        <li><a href="banner_admin.jsp">Banner</a></li>
                        <li><a href="library_admin.jsp">Thư viện ảnh</a></li>
                        <li><a href="keyword_admin.jsp">Từ khóa</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-users"></i>&nbsp; Thành Viên <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="member_admin.jsp">Tất cả thành viên</a></li>
                        <li><a href="#">Thêm thành viên</a></li>
                        <li><a href="staff_admin.jsp">Nhân viên</a></li>
                    </ul>
                </li>
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
                        <span>Phan Linh</span>
                        <a href="intro.jsp"><i class="fas fa-power-off"></i> Thoát</a>
                    </div>
                </div>
            </div>

            <div class="inner-position">
                <h2>Thùng rác thành viên</h2>
                <div class="position-right">
                    <a href="intro.jsp">Trang chủ /</a>
                    <p>Thành viên</p>
                </div>
            </div>

            <div class="content">
                <div class="trash-header">
                    <a href="member_admin.jsp" class="btn btn-back">⬅ Quay lại danh sách</a>
                </div>
                <div class="table">
                    <table class="trash-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Hình</th>
                                <th>Họ tên</th>
                                <th>Tên đăng nhập</th>
                                <th>Điện thoại</th>
                                <th>Email</th>
                                <th>Quyền</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Lặp qua danh sách thành viên bị xóa -->
                            <c:forEach var="member" items="${deletedMembers}">
                                <tr>
                                    <td>${member.id}</td>
                                    <td><img src="../static/avatars/media/${member.image}" alt="Thành viên" width="50"></td>
                                    <td>${member.fullName}</td>
                                    <td>${member.username}</td>
                                    <td>${member.phone}</td>
                                    <td>${member.email}</td>
                                    <td>${member.role}</td>
                                    <td>
                                        <form action="RestoreMemberServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${member.id}">
                                            <button class="btn btn-success"><i class="fas fa-undo"></i> Khôi phục</button>
                                        </form>
                                        <form action="DeleteMemberServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${member.id}">
                                            <button class="btn btn-danger"><i class="fas fa-trash-alt"></i> Xóa vĩnh viễn</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script src="../static/CssTotal/standard_admin.js"></script>    
</html>
