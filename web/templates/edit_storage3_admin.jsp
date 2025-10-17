<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>

    <!-- Liên kết CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/static/CssTotal/standard_admin.css'/>">
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/edit_dish_admin.css'/>">

    <!-- Thư viện QuillJS -->
    <script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
</head>

<body>
    <!-- Thanh bên -->
    <jsp:include page="/WEB-INF/views/partials/sidebar_admin.jsp" />

    <div class="main" id="main">
        <!-- Thanh điều hướng -->
        <jsp:include page="/WEB-INF/views/partials/navbar_admin.jsp" />

        <div class="inner-position">
            <h2>Sửa nguyên liệu</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>Pha chế</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="form-header">
                    <button class="btn-save"><i class="fa fa-save"></i> Lưu</button>
                    <button class="btn-back">
                        <a href="storage3_admin.jsp" style="text-decoration: none; color: #fff;">
                            <i class="fa fa-arrow-left"></i> Về danh sách
                        </a>
                    </button>
                </div>

                <form action="updateIngredient" method="post">
                    <div class="form-grid">
                        <!-- Cột trái -->
                        <div>
                            <div class="form-group">
                                <label for="ten">Tên nguyên liệu</label>
                                <input type="text" id="ten" name="ten" value="${ingredient.ten}">
                            </div>

                            <div class="form-group">
                                <label for="soluong">Số lượng</label>
                                <input type="number" id="soluong" name="soluong" value="${ingredient.soluong}">
                            </div>

                            <div class="form-group">
                                <label for="canhbao">Ngưỡng cảnh báo</label>
                                <input type="number" id="canhbao" name="canhbao" value="${ingredient.canhbao}">
                            </div>

                            <div class="form-group">
                                <label for="price">Giá nhập trung bình</label>
                                <input type="number" id="price" name="price" value="${ingredient.price}">
                            </div>

                            <div class="form-group">
                                <label for="datenh">Ngày nhập</label>
                                <input type="date" id="datenh" name="datenh" value="${ingredient.datenh}">
                            </div>

                            <div class="form-group">
                                <label for="datee">Hạn sử dụng</label>
                                <input type="date" id="datee" name="datee" value="${ingredient.datee}">
                            </div>
                        </div>

                        <!-- Cột phải -->
                        <div>
                            <div class="form-group">
                                <label for="donvi">Đơn vị</label>
                                <select id="donvi" name="donvi">
                                    <option value="kg" ${ingredient.donvi == 'kg' ? 'selected' : ''}>kg</option>
                                    <option value="gói" ${ingredient.donvi == 'gói' ? 'selected' : ''}>gói</option>
                                    <option value="chai" ${ingredient.donvi == 'chai' ? 'selected' : ''}>chai</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="ghichu">Ghi chú</label>
                                <textarea id="ghichu" name="ghichu" rows="5">${ingredient.ghichu}</textarea>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="<c:url value='/static/CssTotal/standard_admin.js'/>"></script>

    <script>
        const Font = Quill.import('formats/font');
        Font.whitelist = ['sans-serif', 'serif', 'monospace', 'roboto', 'source-sans', 'arial', 'georgia'];
        Quill.register(Font, true);

        const quill = new Quill('#contentEditor', {
            theme: 'snow',
            modules: {
                toolbar: [
                    [{ 'font': Font.whitelist }],
                    [{ 'header': [1, 2, false] }],
                    ['bold', 'italic', 'underline'],
                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                    [{ 'align': [] }],
                    ['link', 'image']
                ]
            }
        });

        quill.on('text-change', function () {
            document.getElementById('contentInput').value = quill.root.innerHTML;
        });
    </script>
</body>
</html>
