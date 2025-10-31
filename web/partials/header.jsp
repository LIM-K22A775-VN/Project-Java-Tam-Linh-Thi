<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- ✅ CHAT TƯ VẤN -->
<div class="support-widget">
    <div class="support-header hidden">Chuyên viên tư vấn</div>

    <div class="support-body">
        <div class="chat-button-wrapper">
            <div class="chat-tooltip">Chuyên gia tư vấn đang sẵn sàng</div>
            <button id="open-chat" class="chat-icon-btn">
                <i class="fa-brands fa-facebook-messenger"></i>
            </button>
        </div>

        <div class="chat-area hidden" id="chat-area">
            <div class="messages" id="messages"></div>
            <textarea id="chat-input" placeholder="Nhập tin nhắn..."></textarea>
            <div style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 10px;">
                <button id="clear-chat">Xóa tất cả</button>
                <button id="send-chat">Gửi</button>
            </div>
        </div>
    </div>

    <button id="close-chat" class="close-chat hidden">×</button>
</div>

<!-- ✅ HEADER CHUNG -->
<header class="header">
    <img class="logo" src="<c:url value='/static/avatars/media/logo2.png' />" alt="logo" />

    <div class="navbar">
        <div class="navbar_item"><a href="<c:url value='/templates/intro.jsp' />">Trang chủ</a></div>
        <div class="navbar_item"><a href="<c:url value='/templates/refarral.jsp' />">Giới thiệu</a></div>
        <div class="navbar_item"><a href="<c:url value='/Menu' />">Sản Phẩm</a></div>
        <div class="navbar_item"><a href="<c:url value='/article' />">Bài viết</a></div>
        <div class="navbar_item"><a href="<c:url value='/templates/gallery.jsp' />">Hình ảnh</a></div>
        <div class="navbar_item"><a href="<c:url value='/templates/contact.jsp' />">Liên hệ</a></div>
    </div>

    <div class="navbar_right">
        <div class="navbar_item navbar_item_right">
            <a href="<c:url value='/templates/reserve.jsp' />">
                <i class="fa-solid fa-calendar-check navbar_icon"></i>
                Đặt bàn
            </a>
        </div>

        <!-- ✅ Dropdown tài khoản -->
        <div class="navbar_item navbar_item_right account-dropdown" id="accountDropdown">
            <div class="account-toggle" onclick="toggleDropdown()" style="display: flex; align-items: center;">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <div style="display: flex; align-items: center; gap: 8px;">
                            <img src="<c:url value='/static/avatars/${sessionScope.user.avatar}' />"
                                 alt="Avatar"
                                 style="width: 27px; height: 27px; border-radius: 50%; object-fit: cover;">
                            <span>${sessionScope.user.username}</span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <i class="fa-solid fa-user navbar_icon"></i> Tài khoản
                    </c:otherwise>
                </c:choose>
            </div>

            <ul class="dropdown-menu" id="dropdownMenu">
                <li><i class="fa-solid fa-user"></i> <a href="<c:url value='/templates/profile.jsp' />">Hồ sơ</a></li>
                <li><i class="fa-solid fa-calendar-check"></i> <a href="<c:url value='/templates/reserve.jsp' />">Đặt bàn</a></li>
                <li><i class="fa-solid fa-box"></i> <a href="<c:url value='/templates/order.jsp' />">Đơn hàng</a></li>
                <li><i class="fa-solid fa-gift"></i> <a href="<c:url value='/templates/customer_point.jsp' />">Đổi thưởng</a></li>
                <li><i class="fa-solid fa-heart"></i> <a href="<c:url value='/templates/favorite.jsp' />">Yêu thích</a></li>

                <!-- ✅ Chỉ hiện logout khi đã có user -->
                <c:if test="${not empty sessionScope.user}">
                    <li>
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <a href="${pageContext.request.contextPath}/log_out">Đăng xuất</a>
                    </li>
                </c:if>
            </ul>
        </div>

        <div class="navbar_item navbar_item_right">
            <a href="<c:url value='Cart.jsp' />">
                <i class="fa-solid fa-cart-shopping navbar_icon"></i>
                Giỏ hàng
            </a>
        </div>
    </div>

    <!-- ✅ Script kiểm tra đăng nhập -->
    <script>
        const contextPath = "<%= request.getContextPath() %>";
        const userId = "<%= (session.getAttribute("user") != null) ? ((model.User)session.getAttribute("user")).getIdUser() : "" %>";

        document.addEventListener("DOMContentLoaded", function () {
            if (!userId) {
                const allLinks = document.querySelectorAll("a");
                allLinks.forEach(link => {
                    if (!link.pathname.includes(contextPath + "/login") &&
                        !link.pathname.includes(contextPath + "/register")) {
                        link.addEventListener("click", function (e) {
                            e.preventDefault();
                            alert("Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục!");
                            window.location.href = contextPath + "/login";
                        });
                    }
                });

                const bookBtn = document.querySelector(".button_form");
                if (bookBtn) {
                    bookBtn.addEventListener("click", function (e) {
                        e.preventDefault();
                        alert("Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục!");
                        window.location.href = contextPath + "/login";
                    });
                }
            }
        });
    </script>
</header>
