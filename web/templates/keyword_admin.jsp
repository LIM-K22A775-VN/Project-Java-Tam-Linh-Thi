<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang quản trị</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/library_admin.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="partials/sidebar_admin.jsp" />

        <div class="main" id="main">
            <jsp:include page="partials/navbar_admin.jsp" />

            <div class="inner-position">
                <h2>Quản lý từ khóa</h2>
                <div class="position-right">
                    <a href="intro.jsp">Trang chủ /</a>
                    <p>Giao diện</p>
                </div>
            </div>

            <div class="content">
               <div class="main-container">
                    <div class="bin-section">
                        <button class="btn-trash">Thùng rác</button>
                    </div>
                    <div class="container">
                        <div class="form-section">
                            <div class="form-group">
                                <label for="ten">Tên keyword</label>
                                <input type="text" id="ten">
                            </div>
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <input type="text" id="slug">
                            </div>
                            <div class="form-group">
                                <label for="type-word">Loại từ khóa</label>
                                <select id="type-word">
                                    <option>none</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="trang-thai">Trạng thái</label>
                                <select id="trang-thai">
                                    <option>Chưa xuất bản</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button style="padding: 10px;background-color: #28a745;border-radius: 5px;border: solid 1px rgba(0,0,0,0.5);">Thêm từ khóa</button>
                            </div>
                        </div>

                        <div class="table-section">
                            <table>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên</th>
                                        <th>Slug</th>
                                        <th>Loại</th>
                                        <th>Chức năng</th>
                                        <th>ID</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Nếu muốn dynamic, dùng JSTL loop: --%>
                                    <%-- <c:forEach var="keyword" items="${keywords}" varStatus="status"> --%>
                                    <%-- <tr> ... </tr> --%>
                                    <%-- </c:forEach> --%>

                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>Bảo quản đồ tươi</td>
                                        <td>Bao-quan-do-tuoi</td>
                                        <td>Blog</td>
                                        <td class="actions">
                                            <button class="btn-status" title="Trạng thái"><i class="fa fa-circle"></i></button>
                                            <button class="btn-view" title="Xem"><i class="fa fa-eye"></i></button>
                                            <button class="btn-edit" title="Sửa"><i class="fa fa-pen"></i></button>
                                            <button class="btn-delete" title="Xóa"><i class="fa fa-trash"></i></button>
                                        </td>
                                        <td>8</td>
                                    </tr>
                                    <!-- Lặp lại các dòng tĩnh nếu cần -->
                                </tbody>
                            </table>
                            <div style="margin-top: 15px; display: flex; justify-content: space-between; align-items: center;">
                                <span>Showing 1 to 6 of 7 results</span>
                                <div style="display: flex; gap: 5px;">
                                    <button style="padding: 5px 10px; background-color: #e9ecef; color: #333; border: none; border-radius: 3px;">‹</button>
                                    <button style="padding: 5px 10px; background-color: #007bff; color: white; border: none; border-radius: 3px;">1</button>
                                    <button style="padding: 5px 10px; background-color: #e9ecef; color: #333; border: none; border-radius: 3px;">2</button>
                                    <button style="padding: 5px 10px; background-color: #e9ecef; color: #333; border: none; border-radius: 3px;">›</button>
                                </div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </div>
    </body>
    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
</html>
