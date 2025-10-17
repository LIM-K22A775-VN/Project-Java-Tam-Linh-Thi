<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>html Page</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/stylelogin.css" />
        <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>

       

        <link rel="stylesheet" href="${pageContext.request.contextPath}/ascesss/css/formchuan.css">

                <!-- CDN & jQuery -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    
    
      <link rel="stylesheet" href="<%= request.getContextPath() %>/static/CssTotal/standard.css" />

    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/ascesss/css/formchuan.css" />

    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }
    </style>
        <!-- CDN & jQuery -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="<%= request.getContextPath() %>/CssTotal/standard.js"></script>

    
    </head>

    <body>
        <jsp:include page="/partials/header.jsp" />

        <div class="container">
            <div class="login-container">
                <h2>Đăng nhập</h2>
                <!-- Đăng nhập QR -->
                <button type="button" class="btn qr-login" id="qr-login-btn">
                    <i class="fa-solid fa-qrcode"></i> Đăng nhập bằng mã QR
                </button>

                <!-- Đăng nhập FaceID -->
                <button type="button" class="btn faceid-login" id="faceid-login-btn">
                    <i class="fa-solid fa-face-smile"></i> Đăng nhập bằng Face ID
                </button>

                <!-- KHU VỰC FaceID -->
                <div id="faceid-section" style="display: none; margin-top: 20px;">
                    <label>Email:</label>
                    <input type="email" id="faceid-email" placeholder="Nhập email đã đăng ký">

                    <br><br>

                    <video id="video" width="320" height="240" autoplay style="border: 1px solid #000;"></video>
                    <br>
                    <button id="snap" class="btn">Chụp ảnh</button>
                    <canvas id="canvas" width="320" height="240" style="display:none; border:1px solid #000;"></canvas>

                    <br><br>
                    <button id="login-faceid" class="btn">Gửi đăng nhập Face ID</button>

                    <p id="faceid-status"></p>
                </div>

                <!-- Khung QR -->
                <div id="qr-reader" style="width:300px; display:none; margin-top:20px;"></div>

                <form action="${pageContext.request.contextPath}/login_intro" method="post">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="ex. name@gmail.com" required>

                    <label for="password">Mật khẩu <a href="${pageContext.request.contextPath}/forgot_password">Quên mật khẩu?</a></label>
                    <input type="password" id="password" name="password" placeholder="******" required>

                    <div class="remember">
                        <input type="checkbox" id="remember">
                        <label for="remember">Ghi nhớ</label>
                    </div>

                    <button type="submit" class="btn login">Đăng nhập</button>
                </form>

                <p class="register">Bạn chưa có tài khoản ? <a href="${pageContext.request.contextPath}/register">Đăng ký</a></p>
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

        <c:if test="${not empty error}">
            <div id="toast-err" class="toast-err">${error}</div>
        </c:if>

        <style>
            /* ... CSS toast giống như trong HTML ... */
        </style>

        <script>
            window.addEventListener('DOMContentLoaded', () => {
                const toast = document.getElementById('toast-err');
                if (toast) {
                    setTimeout(() => {
                        toast.style.transform = 'translateX(120%)';
                        toast.style.opacity = '0';
                    }, 3000);
                }
            });
        </script>

        <!-- QR Code & FaceID JS giữ nguyên -->
        <script src="https://unpkg.com/html5-qrcode"></script>
        <script src="${pageContext.request.contextPath}/static/CssTotal/jslogin.js"></script>

        <c:if test="${not empty success}">
            <div id="toast" class="toast">${success}</div>
        </c:if>

        <script>
            // ... giữ nguyên tất cả JS xử lý QR, FaceID, toast ...
        </script>

             <script>
        var userEmail = "<%= session.getAttribute("user_email") != null ? session.getAttribute("user_email") : "" %>";
    </script>

    <script src="${pageContext.request.contextPath}/static/js/tuvan.js"></script>
    <script src="${pageContext.request.contextPath}/static/CssTotal/script.js"></script>
    </body>

</html>
