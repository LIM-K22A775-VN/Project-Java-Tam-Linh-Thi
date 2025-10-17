<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>

    <!-- CSS tĩnh -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CssTotal/stylepayment2.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CssTotal/inner-position.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CssTotal/refarral.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CssTotal/standard.css" />
    <script src="<%= request.getContextPath() %>/CssTotal/standard.js"></script>
    
    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>

    <jsp:include page="/partials/header.jsp" />
    <jsp:include page="/partials/vitri.jsp" />

    <div class="container">
        <div class="login-container">
            <form action="<%= request.getContextPath() %>/confirm_booking_online" method="POST">

                <label>Họ tên:</label>
                <input type="text" id="name" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>" readonly>

                <label>Email:</label>
                <input type="email" id="email" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" readonly>

                <label>Số điện thoại:</label>
                <input type="text" id="phone" name="phone" value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>" readonly>

                <label>Mã giảm giá:</label>
                <input type="text" id="discount_code" name="discount_code" value="<%= request.getAttribute("discount_code") != null ? request.getAttribute("discount_code") : "" %>" readonly>

                <input type="text" value="<%= request.getAttribute("grand_total") != null ? String.format("%,.0f", (Double)request.getAttribute("grand_total")) + " VND" : "" %>" readonly>

                <input type="hidden" name="total" value="<%= request.getAttribute("grand_total") != null ? request.getAttribute("grand_total") : 0 %>">

                <input type="hidden" name="items" value='<%= request.getAttribute("itemsJson") != null ? request.getAttribute("itemsJson") : "[]" %>'>

                <div class="payment-method">
                    <h2>Chọn phương thức thanh toán</h2>
                    <div class="payment-options">
                        <label class="payment-option">
                            <input type="radio" name="payment" value="momo">
                            <img src="<%= request.getContextPath() %>/avatars/media/momo.png" alt="MoMo">
                            <span>MoMo</span>
                        </label>

                        <label class="payment-option">
                            <input type="radio" name="payment" value="atm" checked>
                            <img src="<%= request.getContextPath() %>/avatars/media/atm.png" alt="ATM">
                            <span>ATM</span>
                        </label>

                        <label class="payment-option">
                            <input type="radio" name="payment" value="zalopay">
                            <img src="<%= request.getContextPath() %>/avatars/media/zalo.png" alt="ZaloPay">
                            <span>ZaloPay</span>
                        </label>

                        <label class="payment-option">
                            <input type="radio" name="payment" value="applepay">
                            <img src="<%= request.getContextPath() %>/avatars/media/apple.png" alt="ApplePay">
                            <span>ApplePay</span>
                        </label>

                        <label class="payment-option">
                            <input type="radio" name="payment" value="vnpay">
                            <img src="<%= request.getContextPath() %>/avatars/media/vnpay.jpg" alt="VNPay">
                            <span>VNPAY</span>
                        </label>

                        <label class="payment-option">
                            <input type="radio" name="payment" value="vietinbank">
                            <img src="<%= request.getContextPath() %>/avatars/media/vietinbank.jpg" alt="VietinBank">
                            <span>VietinBank</span>
                        </label>

                    </div>
                </div>
                <button type="submit" class="btn confirm">Xác nhận</button>
            </form>
        </div>
    </div>

    <div id="qrPopup" class="popup hidden">
        <div class="popup-content">
            <h2>🔒 Vui lòng quét mã QR để thanh toán</h2>
            <img id="qrImage" src="<%= request.getContextPath() %>/avatars/media/qrpay.jpg" alt="QR Code"
                style="width: 250px; margin: 20px 0;">
            <br>
            <button onclick="closeQrPopup()">Đóng</button>
        </div>
    </div>

    <jsp:include page="/partials/footer.jsp" />

    <script>
        function closeQrPopup() {
            document.getElementById("qrPopup").classList.add("hidden");
        }
    </script>

    <script src="<%= request.getContextPath() %>/CssTotal/jssignup.js"></script>
    <script src="<%= request.getContextPath() %>/js/tuvan.js"></script>
    <script>
        const userEmail = "<%= session.getAttribute("user_email") != null ? session.getAttribute("user_email") : "" %>";
    </script>
</body>

</html>
