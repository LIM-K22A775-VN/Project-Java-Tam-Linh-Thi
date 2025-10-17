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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/bin_dish_admin.css"/>
</head>
<body>
    <jsp:include page="partials/sidebar_admin.jsp"/>
    <div class="main" id="main">
        <jsp:include page="partials/navbar_admin.jsp"/>

        <div class="inner-position">
            <h2>Thùng rác danh mục</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>danh mục</p>
            </div>
        </div>

        <div class="content">
            <div class="trash-header">
                <a href="dish2_admin.jsp" class="btn btn-back">⬅ Quay lại danh sách</a>
            </div>
            <div class="table">
                <table class="trash-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Hình</th>
                            <th>Tên danh mục</th>
                            <th>Slug</th>
                            <th>Số lượng</th>
                            <th>Mô tả</th>
                            <th>Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="category" items="${deletedCategories}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td><img src="${pageContext.request.contextPath}/static/avatars/media/${category.image}" width="50"></td>
                                <td>${category.name}</td>
                                <td>${category.slug}</td>
                                <td>${category.quantity}</td>
                                <td>${category.description}</td>
                                <td>
                                    <form action="restoreCategory" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="${category.id}">
                                        <button class="btn btn-success"><i class="fas fa-undo"></i> Khôi phục</button>
                                    </form>
                                    <form action="deleteCategoryForever" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="${category.id}">
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
    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
</body>
</html>
