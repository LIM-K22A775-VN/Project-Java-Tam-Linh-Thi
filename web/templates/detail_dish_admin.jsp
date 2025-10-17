<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <h2>Chi tiết sản phẩm</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/intro.jsp">Trang chủ /</a>
                <p>Sản phẩm</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="detail-header">
                    <div class="btn-group">
                        <button class="btn btn-back">
                            <a href="${pageContext.request.contextPath}/dish_admin.jsp" style="text-decoration: none; color: #fff;">
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
                            <td>${food[0]}</td>
                        </tr>
                        <tr>
                            <td>Tên post</td>
                            <td>${food[1]}</td>
                        </tr>
                        <tr>
                            <td>Hình ảnh</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/avatars/media/${food[2]}" alt="Món ăn" style="width: 50px;" />
                            </td>
                        </tr>
                        <tr>
                            <td>Thương hiệu</td>
                            <td>${food[3]}</td>
                        </tr>
                        <tr>
                            <td>Danh mục</td>
                            <td>${food[4]}</td>
                        </tr>
                        <tr>
                            <td>Giá gốc</td>
                            <td>${food[5]}</td>
                        </tr>
                        <tr>
                            <td>Giá khuyến mại</td>
                            <td>${food[6]}</td>
                        </tr>
                        <tr>
                            <td>Mô tả</td>
                            <td style="line-height: 1.7;">${food[7]}</td>
                        </tr>
                        <tr>
                            <td>Đánh giá trung bình</td>
                            <td>${avg_rating}</td>
                        </tr>
                        <tr>
                            <td>Tổng số bán</td>
                            <td>${total_sold}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

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
