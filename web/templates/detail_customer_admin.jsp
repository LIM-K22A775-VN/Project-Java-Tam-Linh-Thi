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
            <h2>Thông tin chi tiết</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>Khách hàng</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="detail-header">
                    <div class="btn-group">
                        <form action="<c:url value='/deleteCustomer'/>" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${customer.id}">
                            <button type="submit" class="btn btn-red"><i class="fa fa-trash"></i> Xóa</button>
                        </form>
                        <button class="btn btn-back">
                            <a href="<c:url value='/customer_admin'/>" style="text-decoration: none;color:#fff;">
                                <i class="fa fa-arrow-left"></i> Về danh sách
                            </a>
                        </button>
                    </div>
                </div>

                <table class="detail-table">
                    <thead>
                        <tr>
                            <th style="max-width: 300px;">Tên trường</th>
                            <th>Giá trị</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ID</td>
                            <td>${customer.id}</td>
                        </tr>
                        <tr>
                            <td>Avatar</td>
                            <td>
                                <img src="<c:url value='/static/avatars/media/${customer.avatar}'/>" alt="Ảnh món ăn" class="preview-img" />
                            </td>
                        </tr>
                        <tr>
                            <td>Họ tên</td>
                            <td>${customer.hoten}</td>
                        </tr>
                        <tr>
                            <td>Tên đăng nhập</td>
                            <td>${customer.tendangnhap}</td>
                        </tr>
                        <tr>
                            <td>Ngày sinh</td>
                            <td>${customer.ngaysinh}</td>
                        </tr>
                        <tr>
                            <td>Địa chỉ</td>
                            <td>${customer.diachi}</td>
                        </tr>
                        <tr>
                            <td>Điện thoại</td>
                            <td>${customer.dienthoai}</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>${customer.email}</td>
                        </tr>
                        <tr>
                            <td>Điểm tích lũy</td>
                            <td>${customer.diem}</td>
                        </tr>
                        <tr>
                            <td>Đơn hàng</td>
                            <td><a href="#">${customer.sodonhang}</a></td>
                        </tr>
                        <tr>
                            <td>Trạng thái</td>
                            <td>${customer.trangthai}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="<c:url value='/static/CssTotal/standard_admin.js'/>"></script>
</body>
</html>
