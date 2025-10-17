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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/detail_booking.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/admin.css" />
</head>

<body>
    <%@ include file="/WEB-INF/views/partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="/WEB-INF/views/partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Chi tiết đặt bàn</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/admin">Trang chủ /</a>
                <a href="${pageContext.request.contextPath}/admin/booking">Đặt bàn /</a>
                <p>Chi tiết</p>
            </div>
        </div>

        <div class="content">
            <div class="container booking-detail-container">
                <table class="booking-detail-table">
                    <tr>
                        <th>Họ tên:</th>
                        <td><c:out value="${booking.fullName}" /></td>
                    </tr>
                    <tr>
                        <th>Điện thoại:</th>
                        <td><c:out value="${booking.phone}" /></td>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <td><c:out value="${booking.email}" /></td>
                    </tr>
                    <tr>
                        <th>Ngày đặt:</th>
                        <td><c:out value="${booking.date}" /></td>
                    </tr>
                    <tr>
                        <th>Thời gian:</th>
                        <td><c:out value="${booking.time}" /></td>
                    </tr>
                    <tr>
                        <th>Số người:</th>
                        <td><c:out value="${booking.people}" /></td>
                    </tr>
                    <tr>
                        <th>Ghi chú:</th>
                        <td><c:out value="${booking.note}" /></td>
                    </tr>
                    <tr>
                        <th>Trạng thái:</th>
                        <td><c:out value="${booking.status}" /></td>
                    </tr>
                </table>

                <div class="booking-detail-back">
                    <button onclick="window.history.back()">Quay lại</button>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const userInfo = document.getElementById("userInfo");
            const userDropdown = document.getElementById("userDropdown");

            userDropdown.style.display = "none"; // Ẩn trước

            userInfo.addEventListener("click", function (e) {
                e.stopPropagation();
                if (userDropdown.style.display === "none") {
                    userDropdown.style.display = "block";
                } else {
                    userDropdown.style.display = "none";
                }
            });

            // Click ngoài thì đóng dropdown
            document.addEventListener("click", function () {
                userDropdown.style.display = "none";
            });
        });
    </script>
</body>

</html>
