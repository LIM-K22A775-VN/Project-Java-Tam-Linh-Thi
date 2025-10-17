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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/add_article_admin.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
</head>
<body>

    <%-- Sidebar có thể tách thành file riêng, ví dụ include --%>
    <%@ include file="partials/sidebar.jsp" %>

    <div class="main" id="main">
        <%-- Thanh điều hướng --%>
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
            <h2>Sửa bài viết</h2>
            <div class="position-right">
                <a href="admin.jsp">Trang chủ /</a>
                <p>Bài viết</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="form-header">
                    <button type="submit" form="editForm" class="btn-save">
                        <i class="fa-solid fa-floppy-disk" style="vertical-align: middle; margin-right: 6px;"></i> Sửa
                    </button>
                    <button class="btn-back">
                        <a href="article_admin.jsp" style="text-decoration: none;color: #fff;">
                            <i class="fa fa-arrow-left" style="vertical-align: middle; margin-right: 6px;"></i> Về danh sách
                        </a>
                    </button>
                </div>

                <%-- Form gửi đến Servlet để xử lý cập nhật --%>
                <form id="editForm" action="${pageContext.request.contextPath}/EditArticleServlet" method="post" enctype="multipart/form-data">
                    <div class="form-grid">
                        <div>
                            <div class="form-group">
                                <label for="name">Tiêu đề</label>
                                <input type="text" id="name" name="title" value="${article.title}" placeholder="Nhập tiêu đề">
                            </div>

                            <div class="form-group">
                                <label for="mo-ta">Mô tả</label>
                                <textarea id="mo-ta" name="description" placeholder="Nhập mô tả sản phẩm">${article.description}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="chu-de">Chủ đề</label>
                                <input type="text" id="chu-de" name="topic" value="${article.topic}" placeholder="Nhập chủ đề">
                            </div>

                            <div class="form-group">
                                <label for="loai">Loại</label>
                                <input type="text" id="loai" name="type" value="${article.type}" placeholder="Nhập loại bài viết">
                            </div>

                            <div class="form-group">
                                <label for="contentEditor">Nội dung</label>
                                <div id="contentEditor">${article.content}</div>
                                <input type="hidden" name="content" id="contentInput">
                            </div>
                        </div>

                        <div>
                            <div class="form-group form-image">
                                <label>Hình</label>
                                <input type="file" name="image">
                            </div>

                            <div class="form-group">
                                <label><input type="checkbox" id="newProduct" name="isNew" ${article.isNew ? "checked" : ""}> Sản phẩm mới</label>
                            </div>

                            <div class="form-group">
                                <label for="status">Trạng thái</label>
                                <select id="status" name="status">
                                    <option value="draft" ${article.status == 'draft' ? 'selected' : ''}>Chưa xuất bản</option>
                                    <option value="published" ${article.status == 'published' ? 'selected' : ''}>Đã xuất bản</option>
                                    <option value="hidden" ${article.status == 'hidden' ? 'selected' : ''}>Ẩn</option>
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
