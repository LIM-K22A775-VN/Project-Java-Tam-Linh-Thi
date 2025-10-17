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
                <h2>Quản lý thư viện</h2>
                <div class="position-right">
                    <a href="intro.jsp">Trang chủ /</a>
                    <p>Giao diện</p>
                </div>
            </div>

            <div class="content">
                <div class="main-container">
                    <div class="bin-section">
                        <button class="btn-trash">
                            <a href="bin_library_admin.jsp" style="text-decoration: none;color:#fff;">
                                Thùng rác
                            </a>
                        </button>
                    </div>

                    <div class="container">
                        <div class="form-section">
                            <div class="form-group">
                                <label for="ten">Tên image</label>
                                <input type="text" id="ten">
                            </div>
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <input type="text" id="slug">
                            </div>
                            <div class="form-group">
                                <label for="Mota">Mô tả</label>
                                <input type="text" id="Mota">
                            </div>
                            <div class="form-group">
                                <label for="hinh">Hình</label>
                                <input type="file" id="hinh">
                            </div>
                            <div class="form-group">
                                <label for="trang-thai">Trạng thái</label>
                                <select id="trang-thai">
                                    <option>Chưa xuất bản</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button style="padding: 10px;background-color: #28a745;border-radius: 5px;border: solid 1px rgba(0,0,0,0.5);">Thêm ảnh</button>
                            </div>
                        </div>

                        <div class="table-section">
                            <table>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Hình</th>
                                        <th>Tên ảnh</th>
                                        <th>Slug</th>
                                        <th>Mô tả</th>
                                        <th>Chức năng</th>
                                        <th>ID</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Nếu dynamic, dùng JSTL: <c:forEach var="img" items="${images}"> --%>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td><img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="food1"></td>
                                        <td>Ảnh 8</td>
                                        <td>Anh-8</td>
                                        <td>Ảnh món ăn</td>
                                        <td class="actions">
                                            <button class="btn-status" title="Trạng thái"><i class="fa fa-circle"></i></button>
                                            <button class="btn-view" title="Xem">
                                                <a href="detail_library_admin.jsp" style="text-decoration: none;color:#fff;">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                            </button>
                                            <button class="btn-edit" title="Sửa">
                                                <a href="edit_library_admin.jsp" style="text-decoration: none;color:#fff;">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                            </button>
                                            <button class="btn-delete" title="Xóa"><i class="fa fa-trash"></i></button>
                                        </td>
                                        <td>8</td>
                                    </tr>
                                    <!-- Lặp thêm các dòng khác nếu cần -->
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
