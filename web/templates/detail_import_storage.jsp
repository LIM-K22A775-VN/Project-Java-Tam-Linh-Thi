<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang quản trị</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/admin.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/import_storage.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
    </head>
    <body>

        <%@ include file="partials/sidebar_admin.jsp" %>

        <div class="main" id="main">
            <%@ include file="partials/navbar_admin.jsp" %>

            <div class="inner-position">
                <h2>Chi tiết phiếu nhập</h2>
                <div class="position-right">
                    <a href="intro.jsp">Trang chủ /</a>
                    <p>Xem lịch sử</p>
                </div>
            </div>

            <div class="content">

                <div class="container">
                    <div class="nav">
                        <h2>Thông tin phiếu</h2>
                        <button class="return">
                            <a href="history_storage.jsp" style="text-decoration: none;color:#fff;">Quay lại</a>
                        </button>
                    </div>

                    <!-- Thông tin phiếu -->
                    <div class="info-section">
                        <p><strong>ID phiếu nhập:</strong> ${phieu.id}</p>
                        <p><strong>Người thực hiện:</strong> ${phieu.nguoiThucHien}</p>
                        <p><strong>Ngày nhập:</strong> ${phieu.ngayNhap}</p>
                    </div>

                    <!-- Bảng nguyên liệu -->
                    <table>
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Tên nguyên liệu</th>
                                <th>Số lượng</th>
                                <th>Đơn vị</th>
                                <th>Giá nhập</th>
                                <th>Loại</th>
                                <th>Hạn sử dụng</th>
                                <th>Ghi chú</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="nl" items="${danhSachNguyenLieu}" varStatus="stt">
                                <tr>
                                    <td>${stt.index + 1}</td>
                                    <td>${nl.ten}</td>
                                    <td>${nl.soLuong}</td>
                                    <td>${nl.donVi}</td>
                                    <td>${nl.giaNhap}</td>
                                    <td>${nl.loai}</td>
                                    <td>${nl.hanSuDung}</td>
                                    <td>${nl.ghiChu}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

        <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
    </body>
</html>
