<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/warehouse_admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/sidebar_staff.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/navbar_admin.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        /* giữ nguyên CSS từ file gốc */
    </style>

    <script>
        // giữ nguyên các function JavaScript từ file gốc
    </script>
</head>

<body>

    <jsp:include page="/WEB-INF/views/partials/sidebar_staff.jsp" />
    <div class="main" id="main">
        <jsp:include page="/WEB-INF/views/partials/navbar_staff.jsp" />

        <div class="inner-position">
            <h2>Xử lý phiếu nhập xuất</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>Phiếu nhập/xuất</p>
            </div>
        </div>

        <h1>Quản lý Nguyên liệu</h1>
        <form id="filterForm" style="display:inline;">
            Từ:
            <input type="date" name="from" style="width: 200px;" id="from_date" value="${from_date}">
            Đến:
            <input type="date" name="to" style="width: 200px;" id="to_date" value="${to_date}">
            <button type="button" class="btn" onclick="applyFilter()">Lọc</button>
        </form>

        <div class="action-buttons">
            <button class="btn" onclick="togglePanel('panel-used')">Nguyên liệu đã tiêu</button>
            <button class="btn" onclick="togglePanel('panel-remaining')">Nguyên liệu còn lại</button>
            <button class="btn" onclick="togglePanel('panel-import')">Nhập kho</button>
            <button class="btn" onclick="togglePanel('panel-export')">Xuất kho</button>
            <button class="btn" onclick="togglePanel('panel-adjust')">Điều chỉnh cuối ngày</button>
        </div>

        <!-- Panel Xuất kho -->
        <div id="panel-export" class="panel">
            <h3>Xuất kho nguyên liệu</h3>
            <div class="table-wrapper">
                <form id="exportForm">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên nguyên liệu</th>
                                <th>Số lượng còn</th>
                                <th>Số lượng xuất</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="ing" items="${remaining_ingredients}">
                                <tr>
                                    <td>
                                        ${ing.IdIngredient}
                                        <input type="hidden" name="id_ingredient_hidden" value="${ing.IdIngredient}">
                                    </td>
                                    <td>${ing.nameIngredient}</td>
                                    <td>${ing.remaining_quantity}</td>
                                    <td><input type="number" name="export_${ing.IdIngredient}" min="0" value="0" style="width:80px;"></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <button type="button" class="btn" onclick="submitExport()">Xác nhận Xuất Kho</button>
                </form>
            </div>
        </div>

        <!-- Bảng đã tiêu -->
        <div id="panel-used" class="panel">
            <h3>Nguyên liệu đã tiêu</h3>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên nguyên liệu</th>
                            <th>Số lượng đã tiêu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${used_ingredients}">
                            <tr>
                                <td>${u.IdIngredient}</td>
                                <td>${u.nameIngredient}</td>
                                <td>${u.used_quantity}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Bảng còn lại -->
        <div id="panel-remaining" class="panel">
            <h3>Nguyên liệu còn lại trong kho</h3>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên nguyên liệu</th>
                            <th>Số lượng còn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="r" items="${remaining_ingredients}">
                            <tr>
                                <td>${r.IdIngredient}</td>
                                <td>${r.nameIngredient}</td>
                                <c:choose>
                                    <c:when test="${r.remaining_quantity < 50}">
                                        <td class="low-stock">${r.remaining_quantity}</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>${r.remaining_quantity}</td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Panel nhập kho -->
        <div id="panel-import" class="panel">
            <h3>Nhập kho nguyên liệu</h3>
            <div class="table-wrapper">
                <form id="importForm">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên nguyên liệu</th>
                                <th>Số lượng còn</th>
                                <th>Số lượng nhập</th>
                                <th>Đơn giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="ing" items="${remaining_ingredients}">
                                <tr>
                                    <td>
                                        ${ing.IdIngredient}
                                        <input type="hidden" name="id_ingredient_hidden" value="${ing.IdIngredient}">
                                    </td>
                                    <td>${ing.nameIngredient}</td>
                                    <td>${ing.remaining_quantity}</td>
                                    <td><input type="number" name="quantity_${ing.IdIngredient}" min="0" value="0" style="width:80px;"></td>
                                    <td><input type="number" name="unit_price_${ing.IdIngredient}" min="0" value="0" style="width:100px;"></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <button type="button" class="btn" onclick="submitImport()">Xác nhận Nhập Kho</button>
                </form>
            </div>
        </div>

        <!-- Panel điều chỉnh cuối ngày -->
        <div id="panel-adjust" class="panel">
            <h3>Điều chỉnh tồn kho cuối ngày</h3>
            <div class="table-wrapper">
                <form id="adjustForm">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên nguyên liệu</th>
                                <th>Đã xuất</th>
                                <th>Thực tế dùng</th>
                                <th>Chênh lệch</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="adj" items="${used_ingredients}">
                                <tr>
                                    <td>
                                        ${adj.IdIngredient}
                                        <input type="hidden" name="id_ingredient_hidden" value="${adj.IdIngredient}">
                                    </td>
                                    <td>${adj.nameIngredient}</td>
                                    <td class="exported">
                                        <c:set var="exp_qty" value="0"/>
                                        <c:forEach var="exp" items="${exported_ingredients}">
                                            <c:if test="${exp.IdIngredient eq adj.IdIngredient}">
                                                <c:set var="exp_qty" value="${exp.exported_quantity}" />
                                            </c:if>
                                        </c:forEach>
                                        ${exp_qty}
                                    </td>
                                    <td><input type="number" name="real_${adj.IdIngredient}" min="0" value="${adj.used_quantity}" onchange="calcDiff(this)" style="width:80px;"></td>
                                    <td class="diff">${exp_qty - adj.used_quantity}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <button type="button" class="btn" onclick="submitAdjust()">Xác nhận Điều chỉnh</button>
                </form>
            </div>
        </div>

        <script>
            // giữ nguyên các function JS (calcDiff, submitExport, submitImport, submitAdjust, applyFilter)
        </script>
    </div>
</body>
</html>
