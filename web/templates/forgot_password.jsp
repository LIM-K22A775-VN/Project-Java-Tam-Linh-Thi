<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/standard.css'/>" />
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/stylesignup.css'/>" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
    <script src="<c:url value='/static/CssTotal/standard.js'/>"></script>
    <script src="<c:url value='/static/CssTotal/jssignup.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/static/ascesss/css/formchuan.css'/>">
    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>
    <%-- Include header JSP --%>
    <jsp:include page="partials/header.jsp" />

    <div class="inner-position">
        <p>Bạn đang ở đây: =></p>
        <a href="<c:url value='/intro'/>">Trang chủ =></a>
        <span style="color: black;margin-left: 1px;">Đăng ký</span>
    </div>

    <div class="container">
        <div class="login-container">
            <h2>Quên mật khẩu</h2>
            <form action="<c:url value='/send-otp'/>" method="post">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="ex. name@gmail.com" required>
                <button type="submit" class="btn login">Gửi OTP</button>
            </form>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <h3>Nhà hàng Lẩu Hột Ty Hưu Trung Thạnh</h3>
                <p>Nhà hàng chuyên về các món lẩu ngon nhất tại Thành phố Hải Phòng, chuyên về các món ăn chuẩn hương vị thuần Việt.</p>
                <p>Thực phẩm tươi sống là yếu tố hàng đầu trong việc chế biến món ăn, Quy Khắc chắc chắn sẽ làm hài lòng quý khách với những món ăn đậm đà hương vị.</p>
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

    <%-- Toast hiển thị lỗi nếu có --%>
    <c:if test="${not empty error}">
        <div class="toast">
            <i class="fa-solid fa-circle-exclamation"></i> ${error}
        </div>
    </c:if>

    <style>
        .toast {
            position: fixed;
            top: 30px;
            right: 30px;
            display: flex;
            align-items: center;
            gap: 12px;
            background: linear-gradient(135deg, #c80000, #d32f2f);
            color: #fff;
            padding: 16px 28px;
            border-radius: 20px 5px 20px 5px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
            z-index: 9999;
            opacity: 1;
            transform: translateX(0);
            transition: transform 1.5s ease-in-out, opacity 1.5s ease-in-out;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 16px;
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .toast i {
            font-size: 18px;
        }
    </style>

    <script>
        window.addEventListener('DOMContentLoaded', () => {
            const toast = document.querySelector('.toast');
            if (toast) {
                setTimeout(() => {
                    toast.style.transform = 'translateX(120%)';
                    toast.style.opacity = '0';
                }, 3000);
            }
        });
    </script>

</body>
</html>
