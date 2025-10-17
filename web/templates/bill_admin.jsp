<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý hóa đơn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css">
    <style>
        .content { padding: 20px; }
        .container { background-color: #fff; padding: 20px; border-radius: 10px; border: solid 1px rgba(0,0,0,0.5); }
        .orders-table { width: 100%; border-collapse: collapse; border: 1px solid #ddd; }
        .orders-table th, .orders-table td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        .orders-table th { background-color: #f4f4f4; font-weight: 600; color: #333; }
        .orders-table tr:hover { background-color: #f9f9f9; }
        .action-buttons a { color: #3498db; text-decoration: none; font-size: 16px; margin-right: 10px; }
        .action-buttons a:hover { color: #2980b9; }
        .total-amount { font-weight: 600; color: #2ecc71; }
        @media (max-width: 768px) {
            .orders-table th, .orders-table td { padding: 8px; font-size: 14px; }
            .action-buttons a { font-size: 14px; }
        }
    </style>
</head>

<body>

<jsp:include page="partials/sidebar_admin.jsp"/>
<div class="main" id="main">
    <jsp:include page="partials/navbar_admin.jsp"/>

    <div class="inner-position">
        <h2>Quản lý hóa đơn</h2>
        <div class="position-right">
            <a href="intro.jsp">Trang chủ /</a>
            <p>Hóa đơn</p>
        </div>
    </div>

    <div class="content">
        <div class="container">
            <h2 style="text-align: center; margin-bottom: 15px;">Danh sách hóa đơn</h2>
            <table class="orders-table" border="solid 1px black">
                <thead>
                    <tr>
                        <th>Mã hóa đơn</th>
                        <th>Loại đơn hàng</th>
                        <th>Tổng tiền</th>
                        <th>Ngày tạo</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bill" items="${bills}">
                        <tr>
                            <td>#HD${bill.id}</td>
                            <td>${bill.type}</td>
                            <td class="total-amount">
                                ${bill.total != null ? bill.total : 0} VND
                            </td>
                            <td>${bill.date}</td>
                            <td class="action-buttons">
                                <a href="detail_bill.jsp?order_id=${bill.id}&order_type=${bill.type}" title="Xem chi tiết">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#sidebar").load("sidebar_admin.jsp?v=" + Math.random(), function (response, status, xhr) {
            if (status == "error") {
                console.error("Lỗi khi tải sidebar_admin.jsp: " + xhr.status + " " + xhr.statusText);
            }
        });
        $("#navbar").load("navbar_admin.jsp?v=" + Math.random(), function (response, status, xhr) {
            if (status == "error") {
                console.error("Lỗi khi tải navbar_admin.jsp: " + xhr.status + " " + xhr.statusText);
            } else {
                $.getScript("${pageContext.request.contextPath}/static/CssTotal/navbar_admin.js");
            }
        });
    });

    document.addEventListener("DOMContentLoaded", function () {
        const userInfo = document.getElementById("userInfo");
        const userDropdown = document.getElementById("userDropdown");

        if(userDropdown) userDropdown.style.display = "none";

        if(userInfo){
            userInfo.addEventListener("click", function (e) {
                e.stopPropagation();
                if (userDropdown.style.display === "none") {
                    userDropdown.style.display = "block";
                } else {
                    userDropdown.style.display = "none";
                }
            });
        }

        document.addEventListener("click", function () {
            if(userDropdown) userDropdown.style.display = "none";
        });
    });
</script>

</body>
</html>
