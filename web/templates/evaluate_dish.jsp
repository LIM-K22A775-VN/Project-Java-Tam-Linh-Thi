<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/evaluate_dish.css'/>" />
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/inner-position.css'/>" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
    <link rel="stylesheet" href="<c:url value='/ascesss/css/formchuan.css'/>" />

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/views/partials/header.jsp" %>
    <%@ include file="/WEB-INF/views/partials/vitri.jsp" %>

    <div class="food-review-container">
        <div class="food-header">
            <h2>${food_name}</h2>
            <img src="<c:url value='/static/avatars/media/${img}'/>" alt="${food_name}">
        </div>

        <div class="food-body">
            <form id="review-form">
                <label>Đánh giá của bạn:</label>
                <div class="stars">
                    <input type="radio" id="star5" name="rating" value="5" <c:if test="${rating == 5}">checked</c:if>><label for="star5">★</label>
                    <input type="radio" id="star4" name="rating" value="4" <c:if test="${rating == 4}">checked</c:if>><label for="star4">★</label>
                    <input type="radio" id="star3" name="rating" value="3" <c:if test="${rating == 3}">checked</c:if>><label for="star3">★</label>
                    <input type="radio" id="star2" name="rating" value="2" <c:if test="${rating == 2}">checked</c:if>><label for="star2">★</label>
                    <input type="radio" id="star1" name="rating" value="1" <c:if test="${rating == 1}">checked</c:if>><label for="star1">★</label>
                </div>

                <label for="comment">Nhận xét của bạn:</label>
                <textarea id="comment" name="comment" rows="4"
                    placeholder="Hãy chia sẻ cảm nhận của bạn...">${comment}</textarea>

                <!-- Hidden input để biết món nào + user nào -->
                <input type="hidden" name="food_id" value="${food_id}">
                <input type="hidden" name="order_id" value="${order_id}">

                <button type="submit" class="submit-btn">✨ Gửi đánh giá</button>
            </form>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/partials/footer.jsp" %>

    <!-- JS tư vấn -->
    <script src="<c:url value='/static/js/tuvan.js'/>"></script>

    <script>
        const userEmail = "${sessionScope.user_email}";
    </script>

    <script>
        $(document).ready(function () {
            $('#review-form').submit(function (e) {
                e.preventDefault();

                const formData = $(this).serialize();

                $.ajax({
                    url: '<c:url value="/danhgia"/>',
                    method: 'POST',
                    data: formData,
                    success: function (response) {
                        launchFireworks();
                        alert('🎉 Cảm ơn bạn đã đánh giá!');
                    },
                    error: function () {
                        alert('Gửi đánh giá thất bại, hãy thử lại!');
                    }
                });
            });

            function launchFireworks() {
                const duration = 2 * 1000;
                const end = Date.now() + duration;

                (function frame() {
                    confetti({
                        particleCount: 5,
                        angle: 60,
                        spread: 55,
                        origin: { x: 0 }
                    });
                    confetti({
                        particleCount: 5,
                        angle: 120,
                        spread: 55,
                        origin: { x: 1 }
                    });

                    if (Date.now() < end) {
                        requestAnimationFrame(frame);
                    }
                }());
            }
        });
    </script>

    <!-- Confetti JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>
</body>
</html>
