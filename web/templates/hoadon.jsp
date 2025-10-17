<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <title>Hóa Đơn Bán Hàng</title>
    <style>
        body {
            font-family: 'Courier New', Courier, monospace;
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            color: #000;
            border: 1px dashed #333;
        }

        h1,
        h2,
        h3,
        p {
            text-align: center;
            margin: 4px 0;
        }

        .info {
            font-size: 14px;
            text-align: left;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            margin-bottom: 10px;
        }

        th,
        td {
            border-bottom: 1px dashed #333;
            padding: 4px;
            text-align: right;
        }

        th:first-child,
        td:first-child {
            text-align: left;
        }

        .total {
            font-weight: bold;
            text-align: right;
            margin-top: 10px;
            font-size: 16px;
        }

        .footer {
            text-align: center;
            font-size: 12px;
            margin-top: 20px;
        }

        .print-btn,
        .back-btn {
            display: block;
            width: 100%;
            background: #333;
            color: #fff;
            border: none;
            padding: 10px 0px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            text-align: center;
            text-decoration: none;
        }

        .print-btn:hover,
        .back-btn:hover {
            background: #000;
        }

        .download-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 13px;
        }
    </style>
</head>

<body>
    <h1>Khách Sạn Năm Sao</h1>
    <p>Lĩnh Nam, Hà Nội</p>
    <p>HÓA ĐƠN BÁN HÀNG</p>
    <div class="info">
        <p>Mã đơn: <strong>${order_id}</strong></p>
        <p>Ngày: ${now}</p>
    </div>

    <table>
        <thead>
            <tr>
                <th>Tên món</th>
                <th>SL</th>
                <th>Đơn giá</th>
                <th>Thành tiền</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${cart}">
                <tr>
                    <td>${item.nameFood}</td>
                    <td>${item.quantity}</td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty item.price}">
                                <%= NumberFormat.getInstance(new Locale("vi","VN")).format(item.getPrice()) %>
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty item.price and not empty item.quantity}">
                                <%= NumberFormat.getInstance(new Locale("vi","VN")).format(item.getPrice() * item.getQuantity()) %>
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="total">TỔNG TIỀN: 
        <%= NumberFormat.getInstance(new Locale("vi","VN")).format(total) %> VNĐ
    </div>

    <a class="download-link" href="${file_path}" target="_blank">📄 Tải file hóa đơn TXT</a>
    <button class="print-btn" onclick="window.print()">🖨️ In hóa đơn</button>
    <a class="back-btn" href="/staff_order.jsp">⬅️ Quay về trang quản trị</a>

    <div class="footer">
        Xin cảm ơn quý khách!<br />
        Hẹn gặp lại!
    </div>
</body>

</html>
