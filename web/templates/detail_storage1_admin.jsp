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
            <h2>Chi tiết nguyên liệu</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/intro.jsp">Trang chủ /</a>
                <p>Đồ đông lạnh</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="detail-header">
                    <div class="btn-group">
                        <form action="${pageContext.request.contextPath}/deleteStorage" method="post">
                            <input type="hidden" name="id" value="${storage.id}">
                            <button type="submit" class="btn btn-red"><i class="fa fa-trash"></i> Xóa</button>
                        </form>

                        <button class="btn btn-back">
                            <a href="${pageContext.request.contextPath}/storage2_admin.jsp"
                               style="text-decoration:none;color:#fff;">
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
                        <tr><td>ID</td><td>${storage.id}</td></tr>
                        <tr><td>Tên nguyên liệu</td><td>${storage.tenNguyenLieu}</td></tr>
                        <tr><td>Số lượng</td><td>${storage.soLuong}</td></tr>
                        <tr><td>Loại</td><td>${storage.loai}</td></tr>
                        <tr><td>Giá nhập trung bình</td><td>${storage.giaNhapTrungBinh}</td></tr>
                        <tr><td>Ngưỡng cảnh báo</td><td>${storage.nguongCanhBao}</td></tr>
                        <tr><td>Đơn vị</td><td>${storage.donVi}</td></tr>
                        <tr><td>Ghi chú</td><td>${storage.ghiChu}</td></tr>
                        <tr><td>Ngày nhập</td><td>${storage.ngayNhap}</td></tr>
                        <tr><td>Hạn sử dụng</td><td>${storage.hanSuDung}</td></tr>
                        <tr><td>Tình trạng</td><td>${storage.tinhTrang}</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
</body>
</html>
