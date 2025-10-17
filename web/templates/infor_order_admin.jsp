<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang quản trị</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/info_order_admin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/sidebar_staff.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/navbar_admin.css" />
</head>

<body>
    <jsp:include page="partials/sidebar_admin.jsp" />
    <div class="main" id="main">
        <jsp:include page="partials/navbar_admin.jsp" />

        <div class="inner-position">
            <h2>Quản lý đơn hàng</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <a href="order_admin.jsp">Đơn hàng /</a>
                <p>Chi tiết đơn hàng</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="order-info-box">
                    <h2>Thông tin đơn hàng</h2>
                    
                    <div class="info-grid">
                        <p><strong>Họ tên:</strong> ${order.userName}</p>
                        <p><strong>Điện thoại:</strong> ${order.order_phone}</p>
                        <p><strong>Địa chỉ:</strong> ${order.address}</p>
                        <p><strong>Ghi chú:</strong> ${order.note}</p>
                        <p><strong>Ngày tạo:</strong>
                            <c:choose>
                                <c:when test="${not empty order.timeOrder}">
                                    <fmt:formatDate value="${order.timeOrder}" pattern="HH:mm dd/MM/yyyy"/>
                                </c:when>
                                <c:otherwise>
                                    Không có dữ liệu
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>

                <div class="product-detail-box">
                    <h2>Chi tiết sản phẩm</h2>
                    <table class="product-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Hình</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${items}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td><img src="${pageContext.request.contextPath}/static/avatars/media/${item.Image}" alt="${item.nameFood}"></td>
                                    <td>${item.nameFood}</td>
                                    <td><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="VNĐ"/></td>
                                    <td>${item.quantity}</td>
                                    <td><fmt:formatNumber value="${item.price * item.quantity}" type="currency" currencySymbol="VNĐ"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>

</html>
