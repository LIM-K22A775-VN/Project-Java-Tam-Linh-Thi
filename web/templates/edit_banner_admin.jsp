<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>

    <!-- CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/edit_dish_admin.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
</head>
<body>

    <%-- Sidebar (có thể tách thành file include riêng) --%>
    <%@ include file="partials/sidebar.jsp" %>

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
                    <span>${sessionScope.username}</span>
                    <a href="logout.jsp"><i class="fas fa-power-off"></i> Thoát</a>
                </div>
            </div>
        </div>

        <div class="inner-position">
            <h2>Sửa banner</h2>
            <div class="position-right">
                <a href="admin.jsp">Trang chủ /</a>
                <p>Banner</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="form-header">
                    <button type="submit" form="editBannerForm" class="btn-save">
                        <i class="fa fa-save"></i> Lưu
                    </button>
                    <button class="btn-back">
                        <a href="banner_admin.jsp" style="text-decoration: none;color: #fff;">
                            <i class="fa fa-arrow-left"></i> Về danh sách
                        </a>
                    </button>
                </div>

                <%-- Form gửi đến Servlet để cập nhật banner --%>
                <form id="editBannerForm" action="${pageContext.request.contextPath}/EditBannerServlet" method="post" enctype="multipart/form-data">
                    <div class="form-grid">
                        <div>
                            <div class="form-group">
                                <label for="name">Tên banner</label>
                                <input type="text" id="name" name="name" value="${banner.name}" placeholder="Nhập tên banner">
                            </div>

                            <div class="form-group">
                                <label for="lienket">Liên kết</label>
                                <input type="text" id="lienket" name="link" value="${banner.link}" placeholder="Nhập liên kết">
                            </div>

                            <div class="form-group">
                                <label for="desc">Mô tả</label>
                                <textarea id="desc" name="description" placeholder="Nhập mô tả banner">${banner.description}</textarea>
                            </div>
                        </div>

                        <div>
                            <div class="form-group">
                                <label for="position">Vị trí</label>
                                <select id="position" name="position">
                                    <option value="Trang chủ" ${banner.position == 'Trang chủ' ? 'selected' : ''}>Trang chủ</option>
                                    <option value="Giới thiệu" ${banner.position == 'Giới thiệu' ? 'selected' : ''}>Giới thiệu</option>
                                </select>
                            </div>

                            <div class="form-group form-image" style="height: 60px;">
                                <label>Hình</label>
                                <input type="file" name="image">
                                <c:if test="${not empty banner.imagePath}">
                                    <div style="margin-top:10px;">
                                        <img src="${pageContext.request.contextPath}/uploads/${banner.imagePath}" alt="Banner hiện tại" style="width:150px;height:auto;border-radius:4px;">
                                    </div>
                                </c:if>
                            </div>

                            <div class="form-group">
                                <label for="status">Trạng thái</label>
                                <select id="status" name="status">
                                    <option value="draft" ${banner.status == 'draft' ? 'selected' : ''}>Chưa xuất bản</option>
                                    <option value="published" ${banner.status == 'published' ? 'selected' : ''}>Đã xuất bản</option>
                                    <option value="hidden" ${banner.status == 'hidden' ? 'selected' : ''}>Ẩn</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

<script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
<script>
    // Nếu bạn muốn giữ phần Quill thì vẫn có thể dùng (nếu sau này có mô tả dài)
    const Font = Quill.import('formats/font');
    Font.whitelist = ['sans-serif', 'serif', 'monospace', 'roboto', 'source-sans', 'arial', 'georgia'];
    Quill.register(Font, true);

    const quill = new Quill('#contentEditor', {
        theme: 'snow',
        modules: {
            toolbar: [
                [{ 'font': Font.whitelist }],
                [{ 'header': [1, 2, false] }],
                ['bold', 'italic', 'underline'],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                [{ 'align': [] }],
                ['link', 'image']
            ]
        }
    });

    quill.on('text-change', function() {
        document.getElementById('contentInput').value = quill.root.innerHTML;
    });
</script>
</body>
</html>
