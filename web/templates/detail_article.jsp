<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết bài viết</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/detail_article.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css"/>
    <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>
</head>

<body>
<header class="header">
    <img class="logo" src="${pageContext.request.contextPath}/static/avatars/media/logo2.png" alt="logo"/>
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
            <a href="reserve.jsp">
                <i class="fa-solid fa-calendar-check navbar_icon"></i> Đặt bàn
            </a>
        </div>

        <div class="navbar_item navbar_item_right account-dropdown" id="accountDropdown">
            <div class="account-toggle" onclick="toggleDropdown()">
                <i class="fa-solid fa-user navbar_icon"></i> Tài khoản
            </div>
            <ul class="dropdown-menu" id="dropdownMenu">
                <li><i class="fa-solid fa-user"></i> <a href="#">Hồ sơ</a></li>
                <li><i class="fa-solid fa-calendar-check"></i> <a href="reserve.jsp">Đặt bàn</a></li>
                <li><i class="fa-solid fa-box"></i> <a href="order.jsp">Đơn hàng</a></li>
                <li><i class="fa-solid fa-heart"></i> <a href="favorite.jsp">Yêu thích</a></li>
                <li><i class="fa-solid fa-right-from-bracket"></i> <a href="login.jsp">Đăng xuất</a></li>
            </ul>
        </div>

        <div class="navbar_item navbar_item_right">
            <a href="Cart.jsp">
                <i class="fa-solid fa-cart-shopping navbar_icon"></i> Giỏ hàng
            </a>
        </div>
    </div>
</header>

<div class="inner-position">
    <p>Bạn đang ở đây: =></p>
    <a href="intro.jsp">Trang chủ =></a>
    <a href="article.jsp">Bài viết =></a>
    <span style="color: black;margin-left: 1px;">Chi tiết bài viết</span>
</div>

<div class="blog-container">
    <div class="blog-main">
        <h2>Bí quyết làm bánh flan mịn căng mềm mượt đẹp như hoa hậu</h2>
        <p class="intro_content">
            Với bí quyết làm bánh flan này, bạn sẽ có món bánh flan ngon đẹp chưa từng thấy!
            Để làm bánh flan bạn cần làm 2 phần: caramel và bánh flan. Dưới đây là nguyên liệu và cách làm từng phần.
        </p>

        <!-- PHẦN I -->
        <div class="blog_item">
            <h3>I. Phần caramel</h3>
            <p><strong>Nguyên liệu:</strong><br>
                – 180g đường<br>
                – 100-120ml nước<br>
                – 1/2 quả chanh (lọc lấy nước cốt, bỏ hạt)
            </p>
            <p><strong>Cách làm:</strong><br>
                Cho đường và nước vào nồi, lắc nhẹ cho đều. Đun lửa vừa để đường tan hoàn toàn.<br>
                Khi đường chuyển màu cánh gián, cho nước cốt chanh vào, khuấy đều.<br>
                Thêm 2 thìa cà phê nước lọc, rồi tắt bếp.<br>
                Đổ caramel vào đáy khuôn flan.
            </p>
            <div class="item_img">
                <img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt=""/>
                <img src="${pageContext.request.contextPath}/static/avatars/media/2.jpg" alt=""/>
            </div>
        </div>

        <!-- PHẦN II -->
        <div class="blog_item">
            <h3>II. Phần bánh flan</h3>
            <p><strong>Nguyên liệu:</strong><br>
                – 6 quả trứng gà to<br>
                – 6 lòng đỏ trứng gà to<br>
                – 120g đường<br>
                – 350ml whipping cream<br>
                – 800ml sữa tươi không đường<br>
                – 6ml tinh chất vanilla
            </p>
            <p><strong>Cách làm:</strong><br>
                1. Đun ấm hỗn hợp sữa và whipping cream (không sôi).<br>
                2. Đánh tan trứng, đường, vanilla rồi từ từ đổ hỗn hợp sữa vào.<br>
                3. Lọc qua rây, đổ vào khuôn đã có caramel.
            </p>
            <div class="item_img">
                <img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt=""/>
                <img src="${pageContext.request.contextPath}/static/avatars/media/2.jpg" alt=""/>
            </div>
        </div>

        <!-- PHẦN III -->
        <div class="blog_item">
            <h3>III. Cách hấp hoặc nướng bánh flan</h3>
            <p><strong>Hấp cách thủy:</strong><br>
                – Đun nước sôi, để lửa nhỏ, cho flan vào hấp cách thủy.<br>
                – Lót khăn dưới vung để tránh nước rơi vào mặt bánh.<br>
                – Hấp 30–35 phút, xiên tăm không dính là chín.
            </p>
            <p><strong>Nướng cách thủy:</strong><br>
                – Làm nóng lò ở 150°C.<br>
                – Lót khăn, đặt khuôn vào khay nước sôi.<br>
                – Nướng 150–160°C trong 30–40 phút.
            </p>
        </div>
    </div>

    <!-- Sidebar -->
    <div class="blog-sidebar">
        <div class="recent-posts">
            <h4>Có thể bạn quan tâm</h4>

            <div class="recent-post">
                <a href="article-detail.jsp?id=456" class="recent-link">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="">
                    <div>
                        <p>Hé lộ chìa khóa vàng giúp thiết lập công thức nấu ăn ngon</p>
                        <span>2024-12-29 08:44:54</span>
                    </div>
                </a>
            </div>

            <c:forEach var="i" begin="1" end="5">
                <div class="recent-post">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="">
                    <div>
                        <p>1001 món ngon mỗi ngày - Giải quyết vấn đề “Hôm nay ăn gì?”</p>
                        <span>2025-06-29 15:55:37</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Bình luận -->
<div class="comment-container">
    <div class="comment-heading">
        <i class="fa-solid fa-comment-dots"></i>
        <span>Bình Luận (33)</span>
    </div>

    <div class="comment-form">
        <div class="comment-user-avatar">
            <img src="https://i.imgur.com/Uz4F4kz.png" alt="User Avatar">
        </div>
        <div class="comment-inputs">
            <textarea placeholder="Tham gia thảo luận"></textarea>
            <input type="text" placeholder="👤 Tên*">
            <input type="email" placeholder="✉️ Email*">
            <button class="submit-btn">Đăng bình luận</button>
        </div>
    </div>

    <h3 class="comment-count">2 GÓP Ý</h3>

    <div class="comment pinned">
        <img class="avatar" src="https://i.imgur.com/Uz4F4kz.png" alt="avatar">
        <div class="comment-content">
            <div class="comment-header">
                <span class="username admin">ADMIN</span>
                <span class="time">3 tháng trước</span>
                <i class="fa-solid fa-thumbtack pin-icon"></i>
            </div>
            <p class="comment-text">Chúc bạn đọc bài vui vẻ</p>
            <div class="comment-footer">
                <span class="author-badge">Tác giả</span>
                <a href="#" class="reply-link"><i class="fa-solid fa-reply"></i> Trả lời</a>
            </div>
        </div>
    </div>

    <div class="comment">
        <img class="avatar" src="https://i.imgur.com/J8zk9eW.png" alt="avatar">
        <div class="comment-content">
            <div class="comment-header">
                <span class="username">chúa toxic</span>
                <span class="time">1 tháng trước</span>
            </div>
            <p class="comment-text">mình làm theo mà có được đâu shop bịp</p>
            <div class="comment-footer">
                <a href="#" class="reply-link"><i class="fa-solid fa-reply"></i> Trả lời</a>
            </div>
        </div>
    </div>
</div>

<!-- Icon cố định -->
<div class="chat-fixed-icons">
    <div class="chat-icon message-icon">
        <a class="chat" href="https://www.facebook.com/giacs.aos.121" target="target">
            <i class="fa-brands fa-facebook-messenger"></i>
            <div class="chat-tooltip">Chuyên gia tư vấn đang sẵn sàng</div>
        </a>
    </div>

    <div class="chat-icon instagram-icon">
        <a class="chat" href="https://www.instagram.com/linhnef.30__/" target="target">
            <i class="fa-brands fa-instagram"></i>
        </a>
    </div>
</div>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-left">
            <h3>Nhà hàng Lẩu Hột Ty Hưu Trung Thạnh</h3>
            <p>Nhà hàng chuyên về các món lẩu ngon nhất tại Thành phố Hải Phòng, chuẩn hương vị thuần Việt.</p>
            <p>Thực phẩm tươi sống là yếu tố hàng đầu trong việc chế biến món ăn.</p>
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
</body>
</html>
