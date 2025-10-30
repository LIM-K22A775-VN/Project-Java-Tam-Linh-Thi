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
                    <h3>Cửa hàng Túi Xách</h3>
                    <p>Chuyên cung cấp các mẫu túi xách thời trang cao cấp, đa dạng phong cách từ thanh lịch đến năng động.</p>
                    <p>Chất liệu được chọn lọc kỹ lưỡng, đường may tinh tế và thiết kế hiện đại — mang đến cho bạn sự tự tin và đẳng cấp trong từng chi tiết.</p>
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
