<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8">
  <title>QR Thanh toán</title>
</head>

<body>
  <h1>🧾 Quét mã QR để thanh toán bằng ${payment_method.toUpperCase()}</h1>

  <img src="/static/qr_${order_id}.png" alt="QR Code" style="width: 200px;">
  <p><strong>Tên:</strong> ${name}</p>
  <p><strong>Ngân Hàng:</strong> ${payment_method}</p>
  <p><strong>Số điện thoại (STK):</strong> ${phone}</p>
  <p><strong>Số tiền:</strong> ${total} VND</p>

  <p><a href="${url}">🔗 Hoặc bấm vào đây nếu không quét được</a></p>

  <h2>Danh sách món đã chọn:</h2>
  <ul>
    <c:forEach var="item" items="${items}">
      <li>${item.name} - SL: ${item.qty}</li>
      <li>${item.idFood}, ${item.qty}, ${item.unitPrice}</li>
    </c:forEach>
  </ul>

  <p><strong>Mã giảm giá:</strong> 
    <c:choose>
      <c:when test="${not empty discount_code}">
        ${discount_code}
      </c:when>
      <c:otherwise>Không có</c:otherwise>
    </c:choose>
  </p>

  <a href="/fake_payment/${order_id}?total=${total}&name=${name}&phone=${phone}" target="_blank">qqqqqqqqqqqqqqqqqqqqqqqq</a>

  <script>
    const orderId = "${order_id}";
    const items = JSON.parse('${itemsJson}'); // itemsJson là chuỗi JSON bạn cần truyền từ Servlet

    setInterval(() => {
      fetch(`/check_payment_status/${orderId}`)
        .then(res => res.text())
        .then(status => {
          console.log("STATUS:", status);
          if (status === "paid") {
            fetch('/save_order_items', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                credentials: 'include',
                body: JSON.stringify({
                  order_id: orderId,
                  items: items,
                  total: '${total}',
                  discount_code: '${discount_code}',
                  phone: '${phone}'
                })
              })
              .then(res => res.json())
              .then(data => {
                if (data.success) {
                  window.location.href = `/intro?order_id=${orderId}`;
                } else {
                  alert('Lưu đơn hàng thất bại!');
                }
              })
              .catch(err => console.error('Lỗi lưu đơn hàng:', err));
          }
        });
    }, 3000);
  </script>
</body>

</html>
