<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/standard_admin.css'/>">
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/detail_booking.css'/>">
</head>
<body>

    <%@ include file="/WEB-INF/views/partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="/WEB-INF/views/partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Chi tiết liên hệ</h2>
            <div class="position-right">
                <a href="admin.jsp">Trang chủ /</a>
                <a href="contact_admin.jsp">Liên hệ /</a>
                <p>Chi tiết</p>
            </div>
        </div>

        <div class="content">
            <div class="container booking-detail-container">
                <table class="booking-detail-table">
                    <tr>
                        <th>ID:</th>
                        <td>${contact.id}</td>
                    </tr>
                    <tr>
                        <th>Họ tên:</th>
                        <td>${contact.hoten}</td>
                    </tr>
                    <tr>
                        <th>Điện thoại:</th>
                        <td>${contact.dienthoai}</td>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <td>${contact.email}</td>
                    </tr>
                    <tr>
                        <th>Tiêu đề:</th>
                        <td>${contact.tieude}</td>
                    </tr>
                    <tr>
                        <th>Nội dung:</th>
                        <td>${contact.noidung}</td>
                    </tr>
                </table>

                <div class="booking-detail-back">
                    <button onclick="window.history.back()">Quay lại</button>
                </div>
            </div>
        </div>
    </div>

    <script src="<c:url value='/static/CssTotal/standard_admin.js'/>"></script>
</body>
</html>
