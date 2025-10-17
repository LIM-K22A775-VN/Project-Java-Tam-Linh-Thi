<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang quản trị</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/dish_admin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/admin.css" />
    <style>
        td.editable input {
            width: 100%;
            box-sizing: border-box;
            padding: 4px 8px;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <%@ include file="/WEB-INF/views/partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="/WEB-INF/views/partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Quản lý sản phẩm</h2>
            <div class="position-right">
                <a href="${pageContext.request.contextPath}/admin">Trang chủ /</a>
                <p>Sản phẩm</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="filter-bar">
                    <p>Lọc theo:</p>
                    <input type="text" placeholder="Tìm kiếm sản phẩm..." />
                    <select id="categoryFilter">
                        <option value="">Tất cả danh mục</option>
                        <option value="Khai vị">Khai vị</option>
                        <option value="Món chính">Món chính</option>
                        <option value="Canh-Tiềm-Súp">Canh-Tiềm-Súp</option>
                        <option value="Cơm-Mì-Cháo">Cơm-Mì-Cháo</option>
                        <option value="Bánh tráng miệng">Bánh tráng miệng</option>
                        <option value="Đồ uống">Đồ uống</option>
                    </select>

                    <select id="brandFilter">
                        <option value="">Tất cả thương hiệu</option>
                        <option value="Món Âu">Món Âu</option>
                        <option value="Món Ý">Món Ý</option>
                        <option value="Món Nhật">Món Nhật</option>
                        <option value="Món Việt">Món Việt</option>
                    </select>

                    <button class="btn-search"><i class="fa fa-search"></i> Tìm kiếm</button>
                </div>

                <div class="table">
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Hình</th>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Danh mục</th>
                                <th>Thương hiệu</th>
                                <th>Giá gốc</th>
                                <th>Giá khuyến mại</th>
                                <th style="min-width: 200px;">Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="f" items="${foods}">
                                <tr>
                                    <td><input type="checkbox" class="review-checkbox" /></td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/static/avatars/media/${f.image}" alt="Món ăn" style="width: 50px;" />
                                    </td>
                                    <td>${f.id}</td>
                                    <td class="editable">${f.name}</td>
                                    <td class="editable">${f.category}</td>
                                    <td class="editable">${f.brand}</td>
                                    <td class="editable">${f.origPrice}</td>
                                    <td class="editable">${f.salePrice}</td>
                                    <td class="actions">
                                        <button class="btn-status" title="Trạng thái">
                                            <i class="fa fa-circle"></i>
                                        </button>
                                        <button class="btn-view" title="Xem">
                                            <a href="${pageContext.request.contextPath}/detail_dish_admin?id=${f.id}" style="text-decoration: none; color: #fff;">
                                                <i class="fa fa-eye"></i>
                                            </a>
                                        </button>
                                        <button class="btn-edit" title="Sửa"><i class="fa fa-pen"></i></button>
                                        <button class="btn-save" title="Lưu" style="display: none;"><i class="fa fa-save"></i></button>
                                        <form action="${pageContext.request.contextPath}/deleteFood" method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${f.id}">
                                            <button type="submit" class="btn-delete" title="Xóa">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div style="margin-top: 15px; display: flex; justify-content: space-between; align-items: center;">
                        <span>Hiển thị 1 đến ${foods.size()} món ăn</span>
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

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard_admin.js"></script>

    <script>
        document.querySelectorAll('.btn-edit').forEach(btn => {
            btn.addEventListener('click', function () {
                const row = btn.closest('tr');
                row.querySelectorAll('.editable').forEach(cell => {
                    const text = cell.innerText.trim();
                    cell.innerHTML = `<input type="text" value="${text}" />`;
                });
                btn.style.display = 'none';
                row.querySelector('.btn-save').style.display = 'inline-block';
            });
        });

        document.querySelectorAll('.btn-save').forEach(btn => {
            btn.addEventListener('click', function () {
                const row = btn.closest('tr');
                const idFood = row.querySelector('td:nth-child(3)').innerText.trim();

                const cells = row.querySelectorAll('.editable');
                const nameFood = cells[0].querySelector('input').value;
                const category = cells[1].querySelector('input').value;
                const brand = cells[2].querySelector('input').value;
                const origPrice = cells[3].querySelector('input').value;
                const salePrice = cells[4].querySelector('input').value;

                fetch('${pageContext.request.contextPath}/updateFood', {
                    method: 'POST',
                    headers: {'Content-Type': 'application/json'},
                    body: JSON.stringify({
                        id: idFood,
                        name: nameFood,
                        category: category,
                        brand: brand,
                        origPrice: origPrice,
                        salePrice: salePrice
                    })
                })
                .then(res => res.json())
                .then(data => {
                    if (data.status === 'success') {
                        cells[0].innerHTML = nameFood;
                        cells[1].innerHTML = category;
                        cells[2].innerHTML = brand;
                        cells[3].innerHTML = origPrice;
                        cells[4].innerHTML = salePrice;

                        btn.style.display = 'none';
                        row.querySelector('.btn-edit').style.display = 'inline-block';
                        alert('Cập nhật thành công!');
                    } else {
                        alert('Lỗi: ' + data.error);
                    }
                });
            });
        });
    </script>
</body>
</html>
