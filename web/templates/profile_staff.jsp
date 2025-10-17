<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Giữ nguyên toàn bộ CSS như HTML gốc */
    </style>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CssTotal/sidebar_staff.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CssTotal/navbar_admin.css">
</head>

<body data-staff-id="<%= request.getAttribute("user_id") != null ? request.getAttribute("user_id") : "" %>">
    <jsp:include page="/partials/sidebar_staff.jsp" />
    <div class="main" id="main">
        <jsp:include page="/partials/navbar_staff.jsp" />

        <div class="content">
            <div class="profile-container">
                <div class="profile-header">
                    <img src="<%= request.getContextPath() %>/avatars/<%= request.getAttribute("user_avatar") != null ? request.getAttribute("user_avatar") : "" %>" alt="Avatar">
                    <h3 id="fullName"><%= request.getAttribute("user_username") != null ? request.getAttribute("user_username") : "" %></h3>

                    <button class="edit-btn">
                        <i class="fas fa-edit"></i> Chỉnh sửa
                    </button>
                    <button class="save-btn" style="display: none;">
                        <i class="fas fa-save"></i> Lưu
                    </button>
                    <button class="cancel-btn" style="display: none;">
                        <i class="fas fa-times"></i> Hủy
                    </button>
                </div>

                <div class="profile-info">
                    <div class="info-item" data-field="fullName">
                        <label>Họ tên</label>
                        <span><%= request.getAttribute("user_username") != null ? request.getAttribute("user_username") : "" %></span>
                    </div>
                    <div class="info-item">
                        <label>Tên đăng nhập</label>
                        <span><%= request.getAttribute("user_email") != null ? request.getAttribute("user_email") : "" %></span>
                    </div>
                    <div class="info-item" data-field="address">
                        <label>Địa chỉ</label>
                        <span><%= request.getAttribute("user_address") != null ? request.getAttribute("user_address") : "Chưa cập nhật" %></span>
                    </div>

                    <div class="info-item" data-field="gender">
                        <label>Giới tính</label>
                        <span><%= request.getAttribute("user_gender") != null ? request.getAttribute("user_gender") : "Chưa cập nhật" %></span>
                    </div>

                    <div class="info-item" data-field="phone">
                        <label>Điện thoại</label>
                        <span><%= request.getAttribute("user_phone") != null ? request.getAttribute("user_phone") : "Chưa cập nhật" %></span>
                    </div>

                    <div class="info-item">
                        <label>Hệ số lương</label>
                        <span><%= request.getAttribute("employee_HeSoLuong") != null ? request.getAttribute("employee_HeSoLuong") : "0.0" %></span>
                    </div>

                    <div class="info-item">
                        <label>Lương</label>
                        <span class="salary">
                            <%
                                Object heSoLuongObj = request.getAttribute("employee_HeSoLuong");
                                if (heSoLuongObj != null) {
                                    double heSoLuong = Double.parseDouble(heSoLuongObj.toString());
                                    out.print(String.format("%,.0f", heSoLuong * 1100000) + " VND");
                                } else {
                                    out.print("Chưa tính");
                                }
                            %>
                        </span>
                    </div>

                    <div class="info-item">
                        <label>Ngày vào làm</label>
                        <span><%= request.getAttribute("employee_NgayVaoLam") != null ? request.getAttribute("employee_NgayVaoLam") : "Chưa cập nhật" %></span>
                    </div>

                    <div class="info-item">
                        <label>Email</label>
                        <span><%= request.getAttribute("user_email") != null ? request.getAttribute("user_email") : "Chưa cập nhật" %></span>
                    </div>

                    <div class="info-item">
                        <label>Quyền</label>
                        <span class="position"><%= request.getAttribute("user_role") != null ? StringUtils.capitalize(request.getAttribute("user_role").toString()) : "" %></span>
                    </div>

                    <div class="info-item">
                        <label>Chức vụ</label>
                        <span><%= request.getAttribute("employee_ChucVu") != null ? request.getAttribute("employee_ChucVu") : "Chưa cập nhật" %></span>
                    </div>

                    <div class="info-item">
                        <label>Đánh giá</label>
                        <span class="rating"><%= request.getAttribute("employee_DanhGia") != null ? request.getAttribute("employee_DanhGia") : "" %></span>
                    </div>

                    <div class="info-item">
                        <label>Ca làm</label>
                        <span><%= request.getAttribute("employee_CaLam") != null ? request.getAttribute("employee_CaLam") : "Chưa sắp lịch" %></span>
                    </div>

                    <div class="info-item">
                        <label>Trạng thái</label>
                        <span class="status-active">Đang hoạt động</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <input type="file" id="avatarInput" accept="image/*" style="display:none">

    <script>
        $(document).ready(function () {
            // Giữ nguyên toàn bộ JS gốc như HTML
        });
    </script>
</body>
</html>
