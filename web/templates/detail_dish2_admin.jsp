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
    <%@ include file="/WEB-INF/views/partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="/WEB-INF/views/partials/navbar_admin.jsp" %>

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
                        <form action="<c:url value='/deleteDish'/>" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${dish.id}">
                            <button class="btn btn-red"><i class="fa fa-trash"></i> Xóa</button>
                        </form>
                        <button class="btn btn-back">
                            <a href="<c:url value='/show_dish_admin'/>" style="text-decoration: none;color:#fff;">
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
                        <tr>
                            <td>ID</td>
                            <td>${dish.id}</td>
                        </tr>
                        <tr>
                            <td>Tên post</td>
                            <td>${dish.tenPost}</td>
                        </tr>
                        <tr>
                            <td>Hình ảnh</td>
                            <td>
                                <img src="<c:url value='/static/avatars/media/${dish.hinhAnh}'/>" alt="Ảnh món ăn" class="preview-img" />
                            </td>
                        </tr>
                        <tr>
                            <td>Slug</td>
                            <td>${dish.slug}</td>
                        </tr>
                        <tr>
                            <td>Thương hiệu</td>
                            <td>${dish.thuongHieu}</td>
                        </tr>
                        <tr>
                            <td>Danh mục</td>
                            <td>${dish.danhMuc}</td>
                        </tr>
                        <tr>
                            <td>Mô tả</td>
                            <td style="line-height: 1.7;">${dish.moTa}</td>
                        </tr>
                        <tr>
                            <td>Nội dung</td>
                            <td class="long-text">${dish.noiDung}</td>
                        </tr>
                        <tr>
                            <td>Created by</td>
                            <td>${dish.createdBy}</td>
                        </tr>
                        <tr>
                            <td>Created At</td>
                            <td>${dish.createdAt}</td>
                        </tr>
                        <tr>
                            <td>Updated by</td>
                            <td>${dish.updatedBy}</td>
                        </tr>
                        <tr>
                            <td>Updated At</td>
                            <td>${dish.updatedAt}</td>
                        </tr>
                        <tr>
                            <td>Loại hình</td>
                            <td>${dish.loaiHinh}</td>
                        </tr>
                        <tr>
                            <td>Trạng thái</td>
                            <td>${dish.trangThai}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="<c:url value='/static/CssTotal/standard_admin.js'/>"></script>
</body>
</html>
