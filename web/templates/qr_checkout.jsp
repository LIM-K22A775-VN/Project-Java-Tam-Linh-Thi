<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <title>Xác nhận thanh toán</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            text-align: center;
        }

        .qr-box {
            margin-top: 20px;
        }

        .info {
            margin: 20px auto;
            width: 300px;
            text-align: left;
        }

        .info p {
            margin: 4px 0;
        }

        .items {
            margin-top: 20px;
            text-align: left;
            display: inline-block;
        }

        .items ul {
            padding-left: 20px;
        }
    </style>
</head>

<body>
    <h1>🧾 Quét mã QR để thanh toán</h1>
    <div class="qr-box">
        <img src="<%= request.getContextPath() %>/static/qr_<%= request.getAttribute("order_id") != null ? request.getAttribute("order_id") : "" %>.png" 
             alt="QR Code" style="width: 400px;">
    </div>
    <div class="info">
        <p><strong>Tổng tiền:</strong> <%= request.getAttribute("total") != null ? request.getAttribute("total") : "" %> VNĐ</p>
        <p><strong>Phương thức:</strong> <%= request.getAttribute("payment_method") != null ? request.getAttribute("payment_method") : "" %></p>
        <p><%= request.getAttribute("booking_id") != null ? request.getAttribute("booking_id") : "" %></p>
        <p><%= request.getAttribute("order_id") != null ? request.getAttribute("order_id") : "" %></p>
    </div>
    <div class="items">
        <h3>Chi tiết món:</h3>
        <ul>
            <c:forEach var="item" items="${items}">
                <li>${item.nameFood} x ${item.quantity} (${item.price} VNĐ)</li>
                <li>${item.idFood}</li>
                <li><%= request.getAttribute("booking_id") != null ? request.getAttribute("booking_id") : "" %></li>
            </c:forEach>
        </ul>
    </div>

    <script>
        const orderId = "<%= request.getAttribute("order_id") != null ? request.getAttribute("order_id") : "" %>";
        const items = <%= request.getAttribute("items_json") != null ? request.getAttribute("items_json") : "[]" %>;
        const total = "<%= request.getAttribute("total") != null ? request.getAttribute("total") : "" %>";
        const bookingId = "<%= request.getAttribute("booking_id") != null ? request.getAttribute("booking_id") : "" %>";

        setInterval(() => {
            fetch(`/check_payment_status/${orderId}`)
                .then(res => res.text())
                .then(status => {
                    if (status === "paid") {
                        fetch('/save_order_items_counter', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json'
                                },
                                body: JSON.stringify({
                                    items: items,
                                    total: total,
                                    id_table: bookingId
                                })
                            })
                            .then(res => res.json())
                            .then(data => {
                                if (data.success) {
                                    if (bookingId) {
                                        window.location.href = `/hoadon/${data.order_id}?type=booking`;
                                    } else {
                                        window.location.href = `/hoadon/${data.order_id}`;
                                    }
                                } else {
                                    alert("Lưu đơn thất bại: " + data.message);
                                }
                            })
                            .catch(err => {
                                console.error('Lỗi lưu đơn:', err);
                            });
                    }
                });
        }, 3000);
    </script>
</body>
</html>
