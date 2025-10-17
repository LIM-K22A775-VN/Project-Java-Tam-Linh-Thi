<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
</head>

<body>

    <div class="container">
        <div class="login-container">
            <h2>💳 Xác nhận thanh toán đặt bàn</h2>
            <h2><strong style="color:#f60">Số tiền:</strong> 500.000 VND</h2>
            <form action="<%= request.getContextPath() %>/confirm_booking" method="POST">
                
                <label>Họ tên:</label>
                <input type="text" id="name" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>" readonly>

                <label>Email:</label>
                <input type="email" id="email" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" readonly>

                <label>Số điện thoại:</label>
                <input type="text" id="phone" name="phone" value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>" readonly>

                <label>Số người:</label>
                <input type="number" id="number" name="people" value="<%= request.getAttribute("people") != null ? request.getAttribute("people") : "" %>" readonly>

                <label>Ngày:</label>
                <input type="date" id="date" name="date" value="<%= request.getAttribute("date") != null ? request.getAttribute("date") : "" %>" readonly>

                <label>Giờ:</label>
                <input type="time" id="time" name="time" value="<%= request.getAttribute("time") != null ? request.getAttribute("time") : "" %>" readonly>

                <label>Ghi chú:</label>
                <textarea id="note" name="notes" readonly><%= request.getAttribute("notes") != null ? request.getAttribute("notes") : "" %></textarea>

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

    <script>
        function closeQrPopup() {
            document.getElementById("qrPopup").classList.add("hidden");
        }
    </script>

    <script src="<%= request.getContextPath() %>/CssTotal/jssignup.js"></script>
</body>

</html>
