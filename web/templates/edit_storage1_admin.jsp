<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/edit_dish_admin.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
</head>

<body>
    <%@ include file="partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Sửa nguyên liệu</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>Đồ tươi</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="form-header">
                    <button type="submit" form="ingredientForm" class="btn-save"><i class="fa fa-save"></i> Lưu</button>
                    <button class="btn-back">
                        <a href="storage1_admin.jsp" style="text-decoration: none; color: #fff;">
                            <i class="fa fa-arrow-left"></i> Về danh sách
                        </a>
                    </button>
                </div>

                <form id="ingredientForm" action="EditIngredientServlet" method="post">
                    <div class="form-grid">
                        <!-- CỘT TRÁI -->
                        <div>
                            <div class="form-group">
                                <label for="ten">Tên nguyên liệu</label>
                                <input type="text" id="ten" name="ten" value="<%= request.getAttribute("ten") != null ? request.getAttribute("ten") : "" %>">
                            </div>

                            <div class="form-group">
                                <label for="soluong">Số lượng</label>
                                <input type="number" id="soluong" name="soluong" value="<%= request.getAttribute("soluong") != null ? request.getAttribute("soluong") : "" %>">
                            </div>

                            <div class="form-group">
                                <label for="canhbao">Ngưỡng cảnh báo</label>
                                <input type="number" id="canhbao" name="canhbao" value="<%= request.getAttribute("canhbao") != null ? request.getAttribute("canhbao") : "" %>">
                            </div>

                            <div class="form-group">
                                <label for="price">Giá nhập trung bình</label>
                                <input type="number" id="price" name="price" value="<%= request.getAttribute("price") != null ? request.getAttribute("price") : "" %>">
                            </div>

                            <div class="form-group">
                                <label for="datenh">Ngày nhập</label>
                                <input type="date" id="datenh" name="datenh" value="<%= request.getAttribute("datenh") != null ? request.getAttribute("datenh") : "" %>">
                            </div>

                            <div class="form-group">
                                <label for="datee">Hạn sử dụng</label>
                                <input type="date" id="datee" name="datee" value="<%= request.getAttribute("datee") != null ? request.getAttribute("datee") : "" %>">
                            </div>
                        </div>

                        <!-- CỘT PHẢI -->
                        <div>
                            <div class="form-group">
                                <label for="donvi">Đơn vị</label>
                                <select id="donvi" name="donvi">
                                    <option value="kg">kg</option>
                                    <option value="gói">gói</option>
                                    <option value="chai">chai</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="ghichu">Ghi chú</label>
                                <textarea id="ghichu" name="ghichu" rows="5"><%= request.getAttribute("ghichu") != null ? request.getAttribute("ghichu") : "" %></textarea>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>

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

        quill.on('text-change', function() {
            document.getElementById('contentInput').value = quill.root.innerHTML;
        });
    </script>
</body>
</html>
