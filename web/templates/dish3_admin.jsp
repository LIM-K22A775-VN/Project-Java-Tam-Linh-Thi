<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/dish3_admin.css"/>
</head>
<body>
    <%@ include file="/WEB-INF/views/partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="/WEB-INF/views/partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Quản lý thương hiệu</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>Thương hiệu</p>
            </div>
        </div>

        <div class="content">
            <div class="main-container">
                <div class="bin-section">
                    <button class="btn-trash">
                        <a href="bin_dish3_admin.jsp" style="text-decoration: none;color: #fff;">Thùng rác</a>
                    </button>
                </div>

                <div class="container">
                    <div class="form-section">
                        <form action="addBrand" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="brand">Thương hiệu</label>
                                <input type="text" id="brand" name="brandName" required>
                            </div>
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <textarea class="area" id="slug" name="slug" rows="4" cols="10"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="mo-ta">Mô tả</label>
                                <textarea class="area" id="mo-ta" name="description" rows="4" cols="10"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="sap-xep">Sắp xếp</label>
                                <select id="sap-xep" name="order">
                                    <option value="">None</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="hinh">Hình</label>
                                <input type="file" id="hinh" name="imageFile">
                            </div>
                            <div class="form-group">
                                <label for="trang-thai">Trạng thái</label>
                                <select id="trang-thai" name="status">
                                    <option value="0">Chưa xuất bản</option>
                                    <option value="1">Đã xuất bản</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" style="padding: 10px;background-color: #28a745;border-radius: 5px;border: solid 1px rgba(0,0,0,0.5);">
                                    Thêm thương hiệu
                                </button>
                            </div>
                        </form>
                    </div>

                    <div class="table-section">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Hình</th>
                                    <th>Tên thương hiệu</th>
                                    <th>Slug</th>
                                    <th>Số lượng</th>
                                    <th>Mô tả</th>
                                    <th>Chức năng</th>
                                    <th>ID</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="brand" items="${brands}">
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/static/avatars/media/${brand.image}" alt="${brand.name}" style="width:60px;height:60px;">
                                        </td>
                                        <td>${brand.name}</td>
                                        <td>${brand.slug}</td>
                                        <td>${brand.quantity}</td>
                                        <td>${brand.description}</td>
                                        <td class="actions">
                                            <button class="btn-status" title="Trạng thái">
                                                <i class="fa fa-circle"></i>
                                            </button>
                                            <button class="btn-view" title="Xem">
                                                <a href="show_dish3_admin.jsp?id=${brand.id}" style="text-decoration: none;color:#fff;">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                            </button>
                                            <button class="btn-edit" title="Sửa">
                                                <a href="edit_dish3_admin.jsp?id=${brand.id}" style="text-decoration: none;color:#fff;">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                            </button>
                                            <form action="deleteBrand" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${brand.id}">
                                                <button type="submit" class="btn-delete" title="Xóa">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                        <td>${brand.id}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div style="margin-top: 15px; display: flex; justify-content: space-between; align-items: center;">
                            <span>Hiển thị ${pageStart} đến ${pageEnd} của ${totalBrands} thương hiệu</span>
                            <div style="display: flex; gap: 5px;">
                                <button>‹</button>
                                <button class="active">1</button>
                                <button>2</button>
                                <button>›</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>
</body>
</html>
