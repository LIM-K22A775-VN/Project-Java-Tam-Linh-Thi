<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>html Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/stylearticle.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css" />
    <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>
    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }

        /* Card món khai vị */
        .blog_item {
            margin-bottom: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s;
        }

        .blog_item:hover {
            transform: translateY(-5px);
        }

        .blog_item h3 {
            padding: 15px 20px 0;
            font-size: 20px;
            color: #333;
        }

        .blog_item img.post-img {
            width: 100%;
            display: block;
        }

        .blog_item p {
            padding: 10px 20px 20px;
            font-size: 16px;
            line-height: 1.6;
            color: #555;
        }

        /* Phần tiêu đề "Khai Vị Đặc Sắc" */
        .blog-main h2 {
            font-size: 28px;
            margin: 40px 0 20px;
            color: #222;
            position: relative;
        }

        .blog-main h2::after {
            content: '';
            width: 60px;
            height: 3px;
            background: #f05a28;
            display: block;
            margin-top: 8px;
        }

        /* Nút phân trang */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .page-btn {
            border: none;
            background: #f5f5f5;
            color: #333;
            padding: 8px 12px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 4px;
            transition: background 0.2s;
        }

        .page-btn.active,
        .page-btn:hover {
            background: #f05a28;
            color: #fff;
        }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ascesss/css/formchuan.css">
</head>

<body>
    <%-- Header --%>
    <jsp:include page="/partials/header.jsp" />
    <jsp:include page="/partials/vitri.jsp" />

    <div class="blog-container">
        <!-- Bài viết chính -->
        <div class="blog-main">
            <h2>Bài viết mới</h2>

            <!-- Các bài viết -->
            <div class="blog_item">
                <div class="post-card">
                    <div class="post-date">
                        <span class="day">19</span>
                        <span class="month">Jun</span>
                    </div>
                    <a href="${pageContext.request.contextPath}/article-detail.jsp?id=123" class="post-link">
                        <img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="Bài viết"
                            class="post-img">
                        <div class="post-meta">
                            <p class="post-date-line">Ngày đăng: 19-06-2024</p>
                            <h3 class="post-title">Mách bạn công thức làm canh cá nấu me thơm ngon đậm vị</h3>
                            <p class="post-desc">
                                Canh cá nấu me là món ăn dân dã, quen thuộc trong mỗi mâm cơm gia đình Việt...
                            </p>
                            <div class="post-tags">
                                <span><i class="fa fa-folder"></i> Thực phẩm nhà hàng</span>
                                <span><i class="fa fa-comment"></i> 30 Bình luận</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Món khai vị đặc sắc -->
            <h2>Khai Vị Đặc Sắc</h2>

            <div class="blog_item">
                <h3>Soup Cà Chua Hải Sản (Âu)</h3>
                <img src="${pageContext.request.contextPath}/static/avatars/media/anh1.jpg"
                    alt="Soup Cà Chua Hải Sản" class="post-img">
                <p>
                    Súp cà chua hải sản là sự hòa quyện tuyệt vời giữa vị chua ngọt thanh mát của cà chua cùng hải sản
                    tươi ngon như tôm, cá, sò, mực...
                </p>
            </div>

            <div class="pagination">
                <button class="page-btn">&lt;</button>
                <button class="page-btn active">1</button>
                <button class="page-btn">2</button>
                <button class="page-btn">&gt;</button>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="blog-sidebar">
            <div class="search-box">
                <input type="text" placeholder="Tìm kiếm từ khóa">
                <button class="search-btn">Tìm kiếm</button>
            </div>

            <div class="category-box">
                <h4>Danh mục</h4>
                <ul>
                    <li>Thực phẩm nhà hàng <span>(1)</span></li>
                    <li>Công thức nấu ăn <span>(4)</span></li>
                    <li>Công nghệ hiện đại <span>(0)</span></li>
                    <li>Sản phẩm <span>(0)</span></li>
                    <li>Cảm hứng <span>(0)</span></li>
                    <li>Chăm sóc sức khỏe <span>(0)</span></li>
                </ul>
            </div>

            <div class="recent-posts">
                <h4>Bài viết gần đây</h4>

                <div class="recent-post">
                    <a href="${pageContext.request.contextPath}/article-detail.jsp?id=456" class="recent-link">
                        <img src="${pageContext.request.contextPath}/static/avatars/media/anh7.jpg" alt="">
                        <div>
                            <p>Hé lộ chìa khóa vàng giúp thiết lập được công thức nấu ăn ngon</p>
                            <span>2024-12-29 08:44:54</span>
                        </div>
                    </a>
                </div>

            </div>
        </div>
    </div>

    <%-- Footer --%>
    <jsp:include page="/template/partials/footer.jsp" />

    <script>
        var userEmail = "<%= session.getAttribute("user_email") != null ? session.getAttribute("user_email") : "" %>";
    </script>

    <script src="${pageContext.request.contextPath}/static/js/tuvan.js"></script>
    <script src="${pageContext.request.contextPath}/static/CssTotal/script.js"></script>

</body>

</html>
