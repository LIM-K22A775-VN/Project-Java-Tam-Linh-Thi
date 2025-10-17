<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết hóa đơn</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        .content {
            padding: 20px;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 100%;
            margin: 0 auto;
            border: solid 1px rgba(0, 0, 0, 0.5);
        }

        .order-info {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }

        .order-info p {
            margin: 5px 0;
            color: #333;
            font-size: 16px;
        }

        .order-info p strong {
            color: #2c3e50;
        }

        .details-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .details-table th, .details-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        .details-table th {
            background-color: #3498db;
            color: #fff;
            font-weight: 600;
        }

        .details-table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .item-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
        }

        .total-amount {
            font-weight: 600;
            color: #e74c3c;
            font-size: 18px;
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .back-btn:hover {
            background-color: #2980b9;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .order-info p {
                font-size: 14px;
            }

            .details-table th, .details-table td {
                padding: 8px;
                font-size: 14px;
            }

            .item-image {
                width: 40px;
                height: 40px;
            }

            .back-btn {
                padding: 8px 15px;
                font-size: 14px;
            }
        }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css">
</head>

<body>
    <%@ include file="/WEB-INF/views/partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="/WEB-INF/views/partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Chi tiết hóa đơn</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/admin">Trang chủ /</a>
                <p>Hóa đơn</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="order-info">
                    <p><strong>Mã hóa đơn:</strong> HD${order[0]}</p>
                    <p><strong>Loại đơn hàng:</strong> ${order[1]}</p>
                    <p><strong>Phương thức thanh toán:</strong> 
                        <c:choose>
                            <c:when test="${not empty order[2]}">${order[2]}</c:when>
                            <c:otherwise>Không xác định</c:otherwise>
                        </c:choose>
                    </p>
                    <p><strong>Tổng tiền:</strong> 
                        <span class="total-amount">
                            <fmt:formatNumber value="${order[3]}" type="number" maxFractionDigits="0"/> VND
                        </span>
                    </p>
                    <p><strong>Ngày tạo:</strong> 
                        <c:out value="${order[4] != null ? order[4] : 'Không xác định'}" />
                    </p>
                </div>

                <table class="details-table" id="order-items">
                    <thead>
                        <tr>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${items}">
                            <tr>
                                <td><img src="${pageContext.request.contextPath}/static/avatars/media/${item[0]}" class="item-image" alt="${item[1]}"></td>
                                <td>${item[1]}</td>
                                <td><fmt:formatNumber value="${item[2]}" type="number" maxFractionDigits="0"/> VND</td>
                                <td>${item[3]}</td>
                                <td><fmt:formatNumber value="${item[4]}" type="number" maxFractionDigits="0"/> VND</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <a href="javascript:history.back()" class="back-btn">Quay lại</a>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
