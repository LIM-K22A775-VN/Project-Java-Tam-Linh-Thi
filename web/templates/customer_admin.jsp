<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/member_admin.css">
</head>

<body>
    <aside class="sidebar" id="sidebar">
        <div class="brand">
            <i class="fas fa-smile"></i>
            <span style="font-style: italic; font-weight: 600;">AdminLTE 4</span>
        </div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/order_admin.jsp"><i class="fas fa-shopping-bag"></i>&nbsp; Đơn hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/booking_admin.jsp"><i class="fas fa-clipboard-list"></i>&nbsp; Đặt bàn</a></li>
            <li><a href="${pageContext.request.contextPath}/consultant_admin.jsp"><i class="fas fa-comment-dots"></i>&nbsp; Tư vấn</a></li>
            <li><a href="${pageContext.request.contextPath}/contact_admin.jsp"><i class="fas fa-phone"></i>&nbsp; Liên hệ</a></li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-utensils"></i>&nbsp; Món ăn <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="${pageContext.request.contextPath}/dish_admin.jsp" class="active">Tất cả món ăn</a></li>
                    <li><a href="${pageContext.request.contextPath}/dish2_admin.jsp">Danh mục</a></li>
                    <li><a href="${pageContext.request.contextPath}/dish3_admin.jsp">Thương hiệu</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-newspaper"></i>&nbsp; Bài viết <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="${pageContext.request.contextPath}/article_admin.jsp" class="active">Tất cả bài viết</a></li>
                    <li><a href="${pageContext.request.contextPath}/theme_admin.jsp">Chủ đề</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-warehouse"></i>&nbsp; Quản lý kho <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="#" class="active">Thực phẩm đông lạnh</a></li>
                    <li><a href="#">Đồ tươi</a></li>
                    <li><a href="#">Pha chế</a></li>
                    <li><a href="${pageContext.request.contextPath}/storage4_admin.jsp">Đồ khô</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-palette"></i>&nbsp; Giao diện <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="${pageContext.request.contextPath}/menu_admin.jsp" class="active">Menu</a></li>
                    <li><a href="${pageContext.request.contextPath}/banner_admin.jsp">Banner</a></li>
                    <li><a href="${pageContext.request.contextPath}/library_admin.jsp">Thư viện ảnh</a></li>
                    <li><a href="${pageContext.request.contextPath}/keyword_admin.jsp">Từ khóa</a></li>
                </ul>
            </li>

            <li class="has-submenu">
                <a href="#" class="submenu-toggle"><i class="fas fa-users"></i>&nbsp; Thành Viên <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                <ul class="submenu">
                    <li><a href="${pageContext.request.contextPath}/member_admin.jsp" class="active">Tất cả thành viên</a></li>
                    <li><a href="#">Thêm thành viên</a></li>
                    <li><a href="${pageContext.request.contextPath}/staff_admin.jsp">Nhân viên</a></li>
                </ul>
            </li>
        </ul>
    </aside>

    <div class="main" id="main">
        <div class="navbar">
            <div class="navbar-title">
                <button id="toggleSidebar"><i class="fas fa-bars"></i></button>
                <a href="${pageContext.request.contextPath}/admin.jsp">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/contact.jsp">Liên hệ</a>
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
                    <a href="${pageContext.request.contextPath}/intro.jsp"><i class="fas fa-power-off"></i> Thoát</a>
                </div>
            </div>
        </div>

        <div class="inner-position">
            <h2>Quản lý khách hàng</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/intro.jsp">Trang chủ /</a>
                <p>Khách hàng</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="filter-bar">
                    <p>Lọc theo:</p>
                    <select>
                        <option>Trạng thái tài khoản</option>
                        <option>Vô hiệu hóa</option>
                        <option>Đang hoạt động</option>
                    </select>
                    <button class="btn-trash">
                        <a href="${pageContext.request.contextPath}/bin_customer_admin.jsp" style="text-decoration: none; color: #fff;">
                            <i class="fa fa-trash"></i> Thùng rác
                        </a>
                    </button>
                </div>

                <div class="table">
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Hình</th>
                                <th>Họ tên</th>
                                <th>Tên đăng nhập</th>
                                <th>Giới tính</th>
                                <th>Điện thoại</th>
                                <th>Email</th>
                                <th>Điểm tích lũy</th>
                                <th>Đơn hàng</th>
                                <th>Chức năng</th>
                                <th>ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="member" items="${members}">
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td><img src="${pageContext.request.contextPath}/static/avatars/media/${member.image}" alt="Hình"></td>
                                    <td>${member.fullName}</td>
                                    <td>${member.username}</td>
                                    <td>${member.gender}</td>
                                    <td>${member.phone}</td>
                                    <td>${member.email}</td>
                                    <td>${member.points}</td>
                                    <td>${member.orders}</td>
                                    <td class="actions">
                                        <button class="btn-status" title="Trạng thái"><i class="fa fa-circle"></i></button>
                                        <button class="btn-view" title="Xem">
                                            <a href="${pageContext.request.contextPath}/detail_customer_admin.jsp?id=${member.id}" style="text-decoration: none; color: #fff;">
                                                <i class="fa fa-eye"></i>
                                            </a>
                                        </button>
                                        <button class="btn-delete" title="Xóa"><i class="fa fa-trash"></i></button>
                                    </td>
                                    <td>${member.id}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div style="margin-top: 15px; display: flex; justify-content: space-between; align-items: center;">
                        <span>Hiển thị 1 đến 6 của 7 kết quả</span>
                        <div style="display: flex; gap: 5px;">
                            <button style="padding: 5px 10px; background-color: #e9ecef; border: none;">‹</button>
                            <button style="padding: 5px 10px; background-color: #007bff; color: white; border: none;">1</button>
                            <button style="padding: 5px 10px; background-color: #e9ecef; border: none;">2</button>
                            <button style="padding: 5px 10px; background-color: #e9ecef; border: none;">›</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
</body>
</html>
