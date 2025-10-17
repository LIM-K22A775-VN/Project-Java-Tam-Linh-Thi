<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/partials/header.jsp" %>

<body>
    <%@ include file="/WEB-INF/views/partials/sidebar.jsp" %>

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
            <h2>Thùng rác chủ đề</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/intro.jsp">Trang chủ /</a>
                <p>Chủ đề</p>
            </div>
        </div>

        <div class="content">
            <div class="trash-header">
                <a href="${pageContext.request.contextPath}/theme_admin.jsp" class="btn btn-back">⬅ Quay lại danh sách</a>
            </div>

            <div class="table">
                <table class="trash-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên chủ đề</th>
                            <th>Slug</th>
                            <th>Mô tả</th>
                            <th>Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- Ví dụ dữ liệu tĩnh (sau có thể thay bằng JSTL) --%>
                        <tr>
                            <td>1</td>
                            <td>Công thức nấu ăn</td>
                            <td>Cong-thuc-nau-an</td>
                            <td>Bài viết về cách nấu món ăn</td>
                            <td>
                                <button class="btn btn-success"><i class="fas fa-undo"></i> Khôi phục</button>
                                <button class="btn btn-danger"><i class="fas fa-trash-alt"></i> Xóa vĩnh viễn</button>
                            </td>
                        </tr>

                        <%-- Có thể dùng JSTL để lặp --%>
                        <%-- 
                        <c:forEach var="theme" items="${themeList}">
                            <tr>
                                <td>${theme.id}</td>
                                <td>${theme.name}</td>
                                <td>${theme.slug}</td>
                                <td>${theme.description}</td>
                                <td>
                                    <button class="btn btn-success"><i class="fas fa-undo"></i> Khôi phục</button>
                                    <button class="btn btn-danger"><i class="fas fa-trash-alt"></i> Xóa vĩnh viễn</button>
                                </td>
                            </tr>
                        </c:forEach>
                        --%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/partials/footer.jsp" %>
</body>
</html>
