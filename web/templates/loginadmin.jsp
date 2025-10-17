<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang quản trị</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/styleloginadmin.css"/>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <h2>Trang quản trị</h2>
            <form action="${pageContext.request.contextPath}/admin_login" method="post">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="ex. name@gmail.com" required>

                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" placeholder="******" required>

                <button type="submit" class="btn login">Đăng nhập</button>
            </form>
        </div>
    </div>
</body>
</html>
