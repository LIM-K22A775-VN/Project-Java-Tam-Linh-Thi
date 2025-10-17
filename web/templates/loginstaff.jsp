<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/login_admin.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="main" id="main">
        <div class="content">
            <div class="container">
                <div class="login-container">
                    <h2>Đăng nhập</h2>
                    <button class="btn facebook"><i class="fa-brands fa-facebook-f"></i> Đăng nhập với FaceBook</button>
                    <button class="btn google"><i class="fa-brands fa-google"></i> Đăng nhập với Google</button>

                    <form id="loginForm" action="${pageContext.request.contextPath}/admin_login" method="post">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="ex. name@gmail.com" required>

                        <label for="password">Mật khẩu <a href="${pageContext.request.contextPath}/forget_admin.jsp">Quên mật khẩu?</a></label>
                        <input type="password" id="password" name="password" placeholder="******" required>

                        <div class="remember">
                            <input type="checkbox" id="remember" name="remember">
                            <label for="remember">Ghi nhớ</label>
                        </div>

                        <button type="submit" class="btn login">Đăng nhập</button>
                    </form>

                    <p class="register">Bạn chưa có tài khoản ? <a href="${pageContext.request.contextPath}/signup_admin.jsp">Đăng ký</a></p>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("loginForm").addEventListener("submit", function(e) {
            // Nếu bạn muốn xử lý bằng servlet, không cần JS này
            // e.preventDefault();
            // localStorage.setItem("isLoggedIn", "true");
            // localStorage.setItem("username", "Phan Linh");
            // window.location.href = "${pageContext.request.contextPath}/dashboard_staff.jsp";
        });
    </script>
</body>
</html>
