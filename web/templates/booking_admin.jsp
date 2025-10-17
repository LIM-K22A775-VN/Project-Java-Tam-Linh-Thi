<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/booking_admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/admin.css">
</head>

<body>

    <%@ include file="/WEB-INF/views/partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="/WEB-INF/views/partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Quản lý đặt bàn</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/admin.jsp">Trang chủ /</a>
                <p>Đặt bàn</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="selection">
                    <form method="get" action="${pageContext.request.contextPath}/booking_admin" style="display: inline;">
                        <label for="filter">Lọc theo:</label>
                        <select id="filter" name="status">
                            <option value="">Tất cả</option>
                            <option value="Đã đặt bàn">Đã đặt bàn</option>
                            <option value="Đã thanh toán">Đã thanh toán</option>
                            <option value="Đã huỷ">Đã huỷ</option>
                        </select>
                        <button class="btn-select" type="button" onclick="filterTable()">Lọc</button>
                    </form>
                </div>

                <div class="table">
                    <table border="1" cellspacing="0" cellpadding="8">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Họ tên</th>
                                <th>Điện thoại</th>
                                <th>Email</th>
                                <th>Ngày đặt</th>
                                <th>Thời gian</th>
                                <th>Trạng thái</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${bookings}" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${b.userName}</td>
                                    <td>${b.phone}</td>
                                    <td>${b.email}</td>
                                    <td>
                                        <c:if test="${not empty b.createdAt}">
                                            <fmt:formatDate value="${b.createdAt}" pattern="dd/MM/yyyy" />
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${not empty b.time}">
                                            <fmt:formatDate value="${b.time}" pattern="HH:mm" />
                                        </c:if>
                                    </td>
                                    <td>${b.status}</td>
                                    <td class="actions" style="min-width: 210px;">
                                        <form action="${pageContext.request.contextPath}/detail_booking" method="post" style="display:inline;">
                                            <input type="hidden" name="IdTable" value="${b.idTable}">
                                            <button type="submit" class="btn-view" title="Xem">
                                                <i class="fa fa-eye"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div style="margin-top: 15px; display: flex; justify-content: space-between; align-items: center;">
                        <span>Showing 1 to 6 of 7 results</span>
                        <div style="display: flex; gap: 5px;">
                            <button style="padding: 5px 10px; background-color: #e9ecef; color: #333; border: none; border-radius: 3px;">‹</button>
                            <button style="padding: 5px 10px; background-color: #007bff; color: white; border: none; border-radius: 3px;">1</button>
                            <button style="padding: 5px 10px; background-color: #e9ecef; color: #333; border: none; border-radius: 3px;">2</button>
                            <button style="padding: 5px 10px; background-color: #e9ecef; color: #333; border: none; border-radius: 3px;">›</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function filterTable() {
            const filter = document.getElementById('filter').value;
            const table = document.querySelector('.table tbody');
            const rows = table.querySelectorAll('tr');

            rows.forEach(row => {
                const statusCell = row.querySelectorAll('td')[6];
                if (!statusCell) return;

                const status = statusCell.textContent.trim();
                if (filter === '' || status === filter) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const userInfo = document.getElementById("userInfo");
            const userDropdown = document.getElementById("userDropdown");

            userDropdown.style.display = "none";

            userInfo.addEventListener("click", function (e) {
                e.stopPropagation();
                if (userDropdown.style.display === "none") {
                    userDropdown.style.display = "block";
                } else {
                    userDropdown.style.display = "none";
                }
            });

            document.addEventListener("click", function () {
                userDropdown.style.display = "none";
            });
        });
    </script>
</body>
</html>
