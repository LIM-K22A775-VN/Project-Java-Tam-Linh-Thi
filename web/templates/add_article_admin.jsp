<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm bài viết</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/standard_admin.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/add_article_admin.css'/>"/>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
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
        <li class="has-submenu">
            <a href="#" class="submenu-toggle"><i class="fas fa-newspaper"></i>&nbsp; Bài viết <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
            <ul class="submenu">
                <li><a href="article_admin.jsp" class="active">Tất cả bài viết</a></li>
                <li><a href="theme_admin.jsp">Chủ đề</a></li>
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
            <div class="user-info">
                <i class="fas fa-user"></i>
                <span>${sessionScope.user_name}</span>
                <a href="logout.jsp"><i class="fas fa-power-off"></i> Thoát</a>
            </div>
        </div>
    </div>

    <div class="inner-position">
        <h2>Thêm bài viết</h2>
        <div class="position-right">
            <a href="intro.jsp">Trang chủ /</a>
            <p>bài viết</p>
        </div>
    </div>

    <div class="content">
        <div class="container">
            <div class="form-header">
                <button class="btn-save" onclick="document.getElementById('articleForm').submit();">
                    <i class="fa-solid fa-square-plus" style="margin-right:6px;"></i> Thêm
                </button>
                <button class="btn-back">
                    <a href="article_admin.jsp" style="text-decoration: none;color: #fff;">
                        <i class="fa fa-arrow-left" style="margin-right:6px;"></i> Về danh sách
                    </a>
                </button>
            </div>

            <form id="articleForm" action="AddArticleServlet" method="post" enctype="multipart/form-data">
                <div class="form-grid">
                    <div>
                        <div class="form-group">
                            <label for="ID">ID</label>
                            <input type="text" id="ID" name="id" placeholder="Nhập ID">
                        </div>
                        <div class="form-group">
                            <label for="name">Tiêu đề</label>
                            <input type="text" id="name" name="title" placeholder="Nhập tiêu đề">
                        </div>
                        <div class="form-group">
                            <label for="mo-ta">Mô tả</label>
                            <textarea id="mo-ta" name="description" placeholder="Nhập mô tả sản phẩm"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="chu-de">Chủ đề</label>
                            <input type="text" id="chu-de" name="topic" placeholder="Nhập chủ đề">
                        </div>
                        <div class="form-group">
                            <label for="loai">Loại</label>
                            <input type="text" id="loai" name="type" placeholder="Nhập loại bài viết">
                        </div>
                        <div class="form-group">
                            <label for="contentEditor">Nội dung</label>
                            <div id="contentEditor"></div>
                            <input type="hidden" name="content" id="contentInput">
                        </div>
                    </div>

                    <div>
                        <div class="form-group form-image">
                            <label>Hình</label>
                            <input type="file" name="image">
                        </div>
                        <div class="form-group">
                            <label><input type="checkbox" id="newProduct" name="newProduct"> Sản phẩm mới</label>
                        </div>
                        <div class="form-group">
                            <label for="status">Trạng thái</label>
                            <select id="status" name="status">
                                <option value="draft">Chưa xuất bản</option>
                                <option value="published">Đã xuất bản</option>
                                <option value="hidden">Ẩn</option>
                            </select>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="<c:url value='/static/CssTotal/standard_admin.js'/>"></script>
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
