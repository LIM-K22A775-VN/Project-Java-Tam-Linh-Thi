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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/detail_dish_admin.css"/>
</head>

<body>
    <%@ include file="/WEB-INF/views/partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="/WEB-INF/views/partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Chi tiết bài viết</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/intro.jsp">Trang chủ /</a>
                <p>Bài viết</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="detail-header">
                    <div class="btn-group">
                        <form action="${pageContext.request.contextPath}/deleteArticle" method="post">
                            <input type="hidden" name="id" value="${article.id}">
                            <button type="submit" class="btn btn-red"><i class="fa fa-trash"></i> Xóa</button>
                        </form>

                        <button class="btn btn-back">
                            <a href="${pageContext.request.contextPath}/show_theme_admin.jsp" style="text-decoration:none; color:#fff;">
                                <i class="fa fa-arrow-left"></i> Về danh sách
                            </a>
                        </button>
                    </div>
                </div>

                <table class="detail-table">
                    <thead>
                        <tr>
                            <th style="min-width:300px;">Tên trường</th>
                            <th>Giá trị</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>ID</td><td>${article.id}</td></tr>
                        <tr><td>Tiêu đề</td><td>${article.title}</td></tr>
                        <tr><td>Mô tả</td><td>${article.description}</td></tr>
                        <tr><td>Chủ đề</td><td>${article.topic}</td></tr>
                        <tr><td>Loại</td><td>${article.type}</td></tr>
                        <tr>
                            <td>Nội dung</td>
                            <td><c:out value="${article.content}" escapeXml="false"/></td>
                        </tr>

                        <tr>
                            <td>Hình ảnh</td>
                            <td>
                                <c:forEach var="img" items="${article.images}">
                                    <img src="${pageContext.request.contextPath}/static/avatars/media/${img}" 
                                         alt="Ảnh món ăn" class="preview-img"/>
                                </c:forEach>
                            </td>
                        </tr>

                        <tr><td>Created by</td><td>${article.createdBy}</td></tr>
                        <tr><td>Created At</td><td>${article.createdAt}</td></tr>
                        <tr><td>Updated by</td><td>${article.updatedBy}</td></tr>
                        <tr><td>Updated At</td><td>${article.updatedAt}</td></tr>
                        <tr><td>Loại hình</td><td>${article.category}</td></tr>
                        <tr><td>Trạng thái</td><td>${article.status}</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
</body>
</html>
