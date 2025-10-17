<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý liên hệ</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&family=Poppins:wght@500;700&display=swap" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        .contact-card {
            transition: all 0.3s ease;
            width: 32%;
            background-color: #f0f0f0;
        }

        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .contact-card h3 {
            color: #007BFF;
        }

        .contact-card p:not(:last-child) {
            color: #333;
        }

        .contact-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            max-height: 70vh;
            overflow-y: auto;
            padding-right: 10px;
            padding-bottom: 40px;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
        }

        .text-2xl {
            text-align: center;
        }

        .filter-row {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        #search,
        .status-select {
            background-color: #f0f0f0;
        }

        .inner-text {
            font-weight: bold;
            font-size: 24px;
        }

        /* Toast */
        .toast {
            position: fixed;
            top: 30px;
            right: 30px;
            display: flex;
            align-items: center;
            gap: 12px;
            background: linear-gradient(135deg, #0050c8, #43a047);
            color: #fff;
            padding: 16px 28px;
            border-radius: 20px 5px 20px 5px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
            z-index: 9999999999;
            opacity: 0;
            transform: translateX(120%);
            transition: transform 0.5s ease, opacity 0.5s ease;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 16px;
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .toast.show {
            opacity: 1;
            transform: translateX(0);
        }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/sidebar_staff.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/navbar_admin.css">
</head>

<body>

    <jsp:include page="partials/sidebar_staff.jsp" />

    <div class="main" id="main">
        <jsp:include page="partials/navbar_staff.jsp" />

        <div class="inner-position">
            <h2 class="inner-text">Quản lý liên hệ</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/intro_qc">Trang chủ /</a>
                <p>Quản lý liên hệ</p>
            </div>
        </div>

        <div class="container max-w-7xl mx-auto p-4">
            <h2 class="text-2xl font-bold text-gray-800 mb-4">Danh sách liên hệ</h2>

            <div class="contact-list">
                <c:forEach var="contact" items="${contacts}">
                    <div class="contact-card p-6 rounded-lg shadow-md" data-id="${contact.idContact}">
                        <div class="flex justify-between items-center mb-4">
                            <h3 class="text-lg font-semibold">
                                <c:out value="${contact.userName != null ? contact.userName : 'Chưa có tên'}"/>
                            </h3>

                            <select class="status-select border rounded px-2 py-1 text-sm"
                                <c:if test="${contact.status eq 'Đã liên hệ'}">disabled</c:if>>
                                
                                <option value="Đang chờ xử lý"
                                    <c:if test="${contact.status eq 'Đang chờ xử lý'}">selected</c:if>>
                                    Đang chờ xử lý
                                </option>

                                <option value="Đã liên hệ"
                                    <c:if test="${contact.status eq 'Đã liên hệ'}">selected</c:if>>
                                    Đã liên hệ
                                </option>
                            </select>
                        </div>

                        <p><i class="fas fa-phone mr-2"></i><c:out value="${contact.phone}" /></p>
                        <p><i class="fas fa-envelope mr-2"></i><c:out value="${contact.email}" /></p>
                        <p class="mt-2"><i class="fas fa-comment mr-2"></i><c:out value="${contact.message}" /></p>

                        <p class="text-gray-500 text-sm mt-2">
                            <i class="fas fa-info-circle mr-2"></i>
                            <c:choose>
                                <c:when test="${contact.status eq 'Đang chờ xử lý'}">Chưa liên hệ với khách hàng</c:when>
                                <c:when test="${contact.status eq 'Đã liên hệ'}">Đã liên hệ với khách hàng</c:when>
                                <c:otherwise>Không xác định</c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- Toast -->
    <div id="toast" class="toast" style="display:none;">
        <span id="toast-message"></span>
    </div>

    <script>
        function showToast(message) {
            const toast = document.getElementById('toast');
            const msgSpan = document.getElementById('toast-message');
            msgSpan.textContent = message;
            toast.classList.add('show');
            toast.style.display = 'flex';
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }

        // Cập nhật trạng thái liên hệ
        $(document).on("change", ".status-select", function () {
            const newStatus = $(this).val();
            const card = $(this).closest(".contact-card");
            const contactId = card.data("id");

            const statusInfo = {
                "Đang chờ xử lý": "Chưa liên hệ với khách hàng",
                "Đã liên hệ": "Đã liên hệ với khách hàng"
            }[newStatus] || "";

            // Cập nhật mô tả trạng thái
            card.find("p:last").html(`<i class="fas fa-info-circle mr-2"></i>${statusInfo}`);

            // Gửi yêu cầu POST tới servlet update
            $.post("${pageContext.request.contextPath}/api/update-contact-status", {
                id: contactId,
                status: newStatus
            })
                .done(function () {
                    showToast("Cập nhật trạng thái thành công");
                })
                .fail(function (xhr, status, error) {
                    showToast("Lỗi khi cập nhật trạng thái!");
                    console.error("Lỗi:", error);
                });
        });
    </script>

</body>
</html>
