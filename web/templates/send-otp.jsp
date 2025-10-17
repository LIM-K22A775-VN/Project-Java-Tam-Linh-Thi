<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký / Xác nhận OTP</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/standard.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/stylesignup.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css"/>
    <script src="<%= request.getContextPath() %>/static/CssTotal/standard.js"></script>
</head>
<body>
<header class="header">
    <img class="logo" src="<%= request.getContextPath() %>/static/avatars/media/logo2.png" alt="logo"/>
    <div class="navbar">
        <div class="navbar_item"><a href="intro.jsp">Trang chủ</a></div>
        <div class="navbar_item"><a href="refarral.jsp">Giới thiệu</a></div>
        <div class="navbar_item"><a href="Menu.jsp">Thực đơn</a></div>
        <div class="navbar_item"><a href="article.jsp">Bài viết</a></div>
        <div class="navbar_item"><a href="gallery.jsp">Hình ảnh</a></div>
        <div class="navbar_item"><a href="contact.jsp">Liên hệ</a></div>
    </div>
    <div class="navbar_right">
        <div class="navbar_item navbar_item_right">
            <a href="reserve.jsp"><i class="fa-solid fa-calendar-check navbar_icon"></i>Đặt bàn</a>
        </div>
        <div class="navbar_item navbar_item_right account-dropdown" id="accountDropdown">
            <div class="account-toggle" onclick="toggleDropdown()">
                <i class="fa-solid fa-user navbar_icon"></i> Tài khoản
            </div>
            <ul class="dropdown-menu" id="dropdownMenu">
                <li><i class="fa-solid fa-user"></i><a href="#">Hồ sơ</a></li>
                <li><i class="fa-solid fa-calendar-check"></i><a href="reserve.jsp">Đặt bàn</a></li>
                <li><i class="fa-solid fa-box"></i><a href="order.jsp">Đơn hàng</a></li>
                <li><i class="fa-solid fa-heart"></i><a href="favorite.jsp">Yêu thích</a></li>
                <li><i class="fa-solid fa-right-from-bracket"></i><a href="login.jsp">Đăng xuất</a></li>
            </ul>
        </div>
        <div class="navbar_item navbar_item_right">
            <a href="Cart.jsp"><i class="fa-solid fa-cart-shopping navbar_icon"></i>Giỏ hàng</a>
        </div>
    </div>
</header>

<div class="inner-position">
    <p>Bạn đang ở đây: =></p>
    <a href="intro.jsp">Trang chủ =></a>
    <span style="color: black;margin-left: 1px;">Đăng ký</span>
</div>

<div class="container">
    <div class="login-container">
        <h2>Xác nhận OTP</h2>
        <form action="<%= request.getContextPath() %>/verify-otp" method="post">
            <label for="otp">Mã OTP</label>
            <input type="text" id="otp" name="otp" placeholder="Nhập mã OTP" required>
            <button type="submit" class="btn login">Xác nhận</button>
        </form>
    </div>
</div>

<div class="chat-fixed-icons">
    <div class="chat-icon message-icon">
        <a class="chat" href="https://www.facebook.com/giacs.aos.121" target="_blank">
            <i class="fa-brands fa-facebook-messenger"></i>
            <div class="chat-tooltip">Chuyên gia tư vấn đang sẵn sàng</div>
        </a>
    </div>
    <div class="chat-icon instagram-icon">
        <a class="chat" href="https://www.instagram.com/linhnef.30__/" target="_blank">
            <i class="fa-brands fa-instagram"></i>
        </a>
    </div>
</div>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-left">
            <h3>Nhà hàng Lẩu Hột Ty Hưu Trung Thạnh</h3>
            <p>Nhà hàng chuyên về các món lẩu ngon nhất tại Thành phố Hải Phòng, chuẩn hương vị thuần Việt.</p>
            <p>Thực phẩm tươi sống là yếu tố hàng đầu trong việc chế biến món ăn, chắc chắn làm hài lòng quý khách.</p>
        </div>
        <div class="footer-right">
            <h3>Thông tin liên hệ</h3>
            <p><i class="fas fa-map-marker-alt"></i> Địa chỉ: Hà Đông, Hà Nội</p>
            <p><i class="fas fa-phone"></i> Điện thoại: 0999999999</p>
            <p><i class="fas fa-envelope"></i> Email: dabc@gmail.com</p>
            <button class="footer-book-now">Đặt bàn ngay</button>
            <div class="footer-social">
                <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="tel:0999999999"><i class="fas fa-phone"></i></a>
                <a href="https://www.pinterest.com/" target="_blank"><i class="fab fa-pinterest-p"></i></a>
                <a href="https://plus.google.com/" target="_blank"><i class="fab fa-google-plus-g"></i></a>
            </div>
        </div>
    </div>
</footer>

<script src="<%= request.getContextPath() %>/static/CssTotal/jssignup.js"></script>
</body>
</html>
