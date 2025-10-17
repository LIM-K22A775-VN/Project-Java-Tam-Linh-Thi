<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thông tin cá nhân</title>

    <!-- CSS tĩnh -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/profile.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/inner-position.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/ascesss/css/formchuan.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/standard.css">

    <!-- CDN & jQuery -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%= request.getContextPath() %>/CssTotal/standard.js"></script>

    
    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }

        #edit-btn {
            display: block;
            margin: 20px auto;
            background: linear-gradient(135deg, #0050c8, #43a047);
            color: #fff;
            border: none;
            padding: 14px 30px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 12px rgba(0, 80, 200, 0.3);
        }

        #edit-btn:hover {
            background: linear-gradient(135deg, #0040a0, #388e3c);
            transform: translateY(-2px);
        }

        #edit-btn:active {
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 80, 200, 0.4);
        }
    </style>
</head>

<body>
    <c:import url="/partials/header.jsp" />
    
    <div class="mainss">
        <div class="container">
            <h1>Thông tin cá nhân</h1>

            <div class="header-profile">
                <img id="avatar-main" src="<%= request.getContextPath() %>/avatars/<%= request.getAttribute("user_avatar") != null ? request.getAttribute("user_avatar") : "" %>" alt="Avatar" style="cursor: pointer;">
                <div class="info">
                    <h2><%= request.getAttribute("user_username") != null ? request.getAttribute("user_username") : "" %></h2>
                </div>
            </div>

            <form id="profile-form" class="profile-grid" method="POST" action="<%= request.getContextPath() %>/update_profile"
                enctype="multipart/form-data">
                <input type="hidden" name="avatar" id="avatar-hidden-input">
                <input type="file" id="avatar-file-input" accept="image/*" style="display: none;">

                <div class="form-group">
                    <label>Tên người dùng</label>
                    <input type="text" name="username" value="<%= request.getAttribute("user_username") != null ? request.getAttribute("user_username") : "" %>" readonly>
                </div>
                <div class="form-group">
                    <label>Địa chỉ</label>
                    <input type="text" name="address" value="<%= request.getAttribute("user_address") != null ? request.getAttribute("user_address") : "" %>" readonly>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="<%= request.getAttribute("user_email") != null ? request.getAttribute("user_email") : "" %>" readonly>
                </div>
                <div class="form-group">
                    <label>Điện thoại</label>
                    <input type="text" name="phone" value="<%= request.getAttribute("user_phone") != null ? request.getAttribute("user_phone") : "" %>" readonly>
                </div>
                <div class="form-group">
                    <label>Giới tính</label>
                    <input type="text" name="gender" value="<%= request.getAttribute("user_gender") != null ? request.getAttribute("user_gender") : "" %>" readonly>
                </div>
                <div class="form-group">
                    <label>Người dùng</label>
                    <input type="text" name="role" value="<%
                        String role = (String) request.getAttribute("user_role");
                        if("user".equals(role)) { out.print("Khách Hàng"); }
                        else if("admin".equals(role)) { out.print("Quản trị viên"); }
                        else if("agent".equals(role)) { out.print("Nhân viên hỗ trợ"); }
                        else { out.print("Không rõ"); }
                    %>" readonly>
                </div>

                <div class="form-group">
                    <label>Số tiền đã tiêu</label>
                    <input type="text" name="total_spent" value="<%= request.getAttribute("user_total_spent") != null ? String.format("%,.0f", request.getAttribute("user_total_spent")).replace(",", ".") : "" %>" readonly>
                </div>
            </form>

            <button id="edit-btn" type="button">Chỉnh sửa</button>
        </div>
    </div>

    <jsp:include page="/partials/footer.jsp" />

    <script src="<%= request.getContextPath() %>/js/tuvan.js"></script>
    <script>
        const userEmail = "<%= request.getAttribute("user_email") != null ? request.getAttribute("user_email") : "" %>";
    </script>
    <script src="<%= request.getContextPath() %>/CssTotal/profile.js"></script>

    <script>
        const editBtn = document.getElementById('edit-btn');
        const inputs = document.querySelectorAll(
            '#profile-form input:not([name="email"]):not([name="role"]):not([name="total_spent"])'
        );
        const avatarMain = document.getElementById('avatar-main');
        const avatarFileInput = document.getElementById('avatar-file-input');

        let isEditing = false;

        avatarMain.style.pointerEvents = 'none';
        avatarMain.style.cursor = 'default';

        editBtn.addEventListener('click', () => {
            if (!isEditing) {
                inputs.forEach(input => input.removeAttribute('readonly'));
                avatarMain.style.pointerEvents = 'auto';
                avatarMain.style.cursor = 'pointer';
                editBtn.textContent = 'Lưu';
                isEditing = true;
            } else {
                document.getElementById('profile-form').submit();
            }
        });

        avatarMain.addEventListener('click', () => {
            if (isEditing) avatarFileInput.click();
        });

        avatarFileInput.addEventListener('change', () => {
            const file = avatarFileInput.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    avatarMain.src = e.target.result;
                };
                reader.readAsDataURL(file);
                document.getElementById('avatar-hidden-input').value = file.name;
            }
        });
    </script>

     <script>
        var userEmail = "<%= session.getAttribute("user_email") != null ? session.getAttribute("user_email") : "" %>";
    </script>

    <script src="${pageContext.request.contextPath}/static/js/tuvan.js"></script>
    <script src="${pageContext.request.contextPath}/static/CssTotal/script.js"></script>
    <script src="/static/CssTotal/jsreserve.js"></script>
</body>

</html>
