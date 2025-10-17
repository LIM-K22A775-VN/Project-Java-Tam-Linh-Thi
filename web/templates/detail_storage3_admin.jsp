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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/contact_admin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/booking_admin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/admin.css" />
</head>

<body>

    <%@ include file="/WEB-INF/views/partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="/WEB-INF/views/partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Quản lý liên hệ</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/admin">Trang chủ /</a>
                <p>Liên hệ</p>
            </div>
        </div>

        <div class="content">
            <div class="container">

                <div class="selection">
                    <label for="filter">Lọc theo:</label>
                    <select id="filter" name="filter">
                        <option value="all">Tất cả</option>
                        <option value="pending">Đang chờ xử lý</option>
                        <option value="confirmed">Đã liên hệ</option>
                    </select>
                    <button class="btn-select" value="find">Lọc</button>
                </div>

                <table id="ordersTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Id_User</th>
                            <th>Họ tên</th>
                            <th>Điện thoại</th>
                            <th>Email</th>
                            <th>Nội dung</th>
                            <th>Tình trạng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${contacts}">
                            <tr>
                                <td>${c.idContact}</td>
                                <td>${c.idUser}</td>
                                <td>${c.userName}</td>
                                <td>${c.phone}</td>
                                <td>${c.email}</td>
                                <td>${c.message}</td>
                                <td>${c.status}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const filterBtn = document.querySelector(".btn-select");
            const filterSelect = document.getElementById("filter");
            const rows = document.querySelectorAll("#ordersTable tbody tr");

            filterBtn.addEventListener("click", function () {
                const filterValue = filterSelect.value;

                rows.forEach(row => {
                    const statusCell = row.querySelector("td:nth-child(7)");
                    const statusText = statusCell ? statusCell.textContent.trim() : "";

                    if (filterValue === "all" || statusText === getStatusText(filterValue)) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });
            });

            function getStatusText(value) {
                switch (value) {
                    case "pending": return "Đang chờ xử lý";
                    case "confirmed": return "Đã liên hệ";
                    default: return "";
                }
            }
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const userInfo = document.getElementById("userInfo");
            const userDropdown = document.getElementById("userDropdown");

            userDropdown.style.display = "none"; // Ẩn trước

            userInfo.addEventListener("click", function (e) {
                e.stopPropagation(); // Ngăn lan ra ngoài
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

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
</body>

</html>
