<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS tĩnh dùng JSTL để tạo URL tương đối -->
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/main.css' />">
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/standard.css' />">

    <!-- CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css">

    <!-- Nếu cần JS -->
    <%-- <script src="<c:url value='/static/CssTotal/js.js' />"></script> --%>
</head>

<body>
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <h3>Nhà hàng Lẩu 3 Tay anh BÌNH TÂM LINH gây dựng</h3>
                <p>Nhà hàng chuyên về các món lẩu ngon nhất tại Hà Nội, chuyên về các món ăn chuẩn hương vị thuần Việt.</p>
                <p>Thực phẩm tươi sống là yếu tố hàng đầu trong việc chế biến món ăn, Quy Khắc chắc chắn sẽ làm hài lòng
                    quý khách với những món ăn đậm đà hương vị.</p>
            </div>

            <div class="footer-right">
                <h3>Thông tin liên hệ</h3>
                <p><i class="fas fa-map-marker-alt"></i> Địa chỉ: Lĩnh Nam, Hà Nội</p>
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
</body>

</html>
