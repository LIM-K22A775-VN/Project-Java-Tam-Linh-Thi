<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Liên hệ</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/stylecontact.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ascesss/css/formchuan.css" />

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>

    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }

        .toast {
            position: fixed;
            top: 30px;
            right: 30px;
            display: flex;
            align-items: center;
            gap: 12px;
            background: linear-gradient(135deg, #0050c8, #43a047);
            color: #fff;
            padding: 16px 28px;
            border-radius: 20px 5px 20px 5px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
            z-index: 9999999999;
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
</head>

<body>
    <!-- Header -->
    <jsp:include page="/partials/header.jsp" />
    <jsp:include page="/partials/vitri.jsp" />

    <!-- Banner -->
    <div class="banner-body">
        <h1>Túi Xách Hàng Hiệu</h1>
        <p>Chúng tôi luôn sẵn sàng lắng nghe ý kiến của bạn</p>
    </div>

    <!-- Container -->
    <div class="container">
        <!-- Left box -->
        <div class="left-box">
            <h2>Cửa hàng chính</h2>
            <p>Cửa hàng chúng tôi luôn bảo đảm về chất lượng cũng như an toàn thực phẩm.</p>

            <div class="info-item"><i>📍</i> Ngõ 419, Lĩnh Nam, Hà Nội</div>
            <div class="info-item"><i>📧</i> devrestaurant@gmail.com</div>
            <div class="info-item"><i>📞</i> (84)0123.456.789</div>
            <div class="info-item"><i>⏰</i> Các ngày trong tuần 7:00am - 22:00pm</div>
        </div>

        <!-- Right box -->
        <div class="right-box">
            <h2>Để lại thông tin để nhận liên hệ</h2>
            <form action="${pageContext.request.contextPath}/lienhe" method="POST">
                <input type="text" name="username" placeholder="Nhập họ và tên"
                       value="<c:out value='${user.username}' default=''/>" readonly>

                <input type="email" name="email" placeholder="Nhập email của bạn"
                       value="<c:out value='${user.email}' default=''/>" readonly>

                <input type="tel" name="phone" placeholder="Nhập số điện thoại của bạn"
                       value="<c:out value='${user.phone}' default=''/>" readonly>

                <textarea name="message" rows="5" placeholder="Nhập nội dung"></textarea>
                <button type="submit">Gửi thông tin</button>
            </form>
        </div>
    </div>

    <!-- Google Map -->
    <div class="map-section">
        <div class="map-container">
            <div class="view-full-map">
                <a href="https://www.google.com/maps?q=fpt+software+HCM" target="_blank">Xem bản đồ lớn hơn</a>
            </div>

            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.210843415923!2d106.78811507574405!3d10.87001408928739!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752756e0113875%3A0xa405d2b30a3a9e7a!2zRlBUIFNvZnR3YXJlIFRow6BuaCBwaOG7kSBI4buTIENN!5e0!3m2!1svi!2s!4v1719916189472!5m2!1svi!2s"
                allowfullscreen loading="lazy" referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/partials/footer.jsp" />

    <!-- Script tư vấn -->
    <script src="${pageContext.request.contextPath}/static/js/tuvan.js"></script>
    <script src="${pageContext.request.contextPath}/static/CssTotal/script.js"></script>

    <!-- Lấy email người dùng -->
    <script>
        const userEmail = "<c:out value='${sessionScope.user_email}'/>";
    </script>

    <!-- Thông báo -->
    <c:if test="${not empty success}">
        <div id="toast" class="toast">${success}</div>
    </c:if>

    <script>
        window.addEventListener('DOMContentLoaded', () => {
            const toast = document.getElementById('toast');
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
