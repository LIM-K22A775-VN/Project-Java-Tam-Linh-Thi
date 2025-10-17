<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thực Đơn</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/stylemenu.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ascesss/css/formchuan.css" />

    <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>

    <style>
        .navbar_right { margin-top: -3px; justify-content: center; align-items: center; }
        .food-card.hidden { display: none; }
        #not-found-message { display: none; padding: 20px; background: linear-gradient(45deg, #ff416c, #ff4b2b); color: #fff; text-align: center; font-size: 20px; font-weight: bold; border-radius: 8px; margin-bottom: 20px; animation: pulse 1s infinite alternate; }
        @keyframes pulse { from { transform: scale(1); } to { transform: scale(1.05); } }
        .toast { position: fixed; top: 30px; right: 30px; display: flex; align-items: center; gap: 12px; background: linear-gradient(135deg, #0050c8, #43a047); color: #fff; padding: 16px 28px; border-radius: 20px 5px 20px 5px; box-shadow: 0 12px 30px rgba(0,0,0,0.25); z-index: 9999999999; opacity:1; transform: translateX(0); transition: transform 1.5s ease-in-out, opacity 1.5s ease-in-out; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size:16px; backdrop-filter: blur(4px); border:1px solid rgba(255,255,255,0.3);}
        .toast i { font-size:18px; }
        .icon-btn .fa-heart { transition: color 0.3s ease; }
        .icon-btn .fa-heart.active { color:red; }
    </style>
</head>
<body>

<jsp:include page="/partials/header.jsp" />
<jsp:include page="/partials/vitri.jsp" />

<div class="section-one">
    <div class="inner-wrap">

        <!-- Bộ lọc -->
        <div class="inner-chon">
            <div class="inner-danhmuc">
                <h3>Danh Mục</h3>
                <input type="radio" name="danhmuc" value="Tất cả" checked> Tất cả<br>
                <input type="radio" name="danhmuc" value="Khai vị"> Khai vị<br>
                <input type="radio" name="danhmuc" value="Món chính"> Món chính<br>
                <input type="radio" name="danhmuc" value="Canh-Tiêm-Súp"> Canh-Tiêm-Súp<br>
                <input type="radio" name="danhmuc" value="Cơm-Mì-Cháo"> Cơm-Mì-Cháo<br>
                <input type="radio" name="danhmuc" value="Bánh tráng miệng"> Bánh tráng miệng<br>
                <input type="radio" name="danhmuc" value="Đồ uống"> Đồ uống<br>
            </div>

            <div class="inner-thuonghieu">
                <h3>Thương Hiệu</h3>
                <input type="radio" name="thuonghieu" value="Tất cả" checked> Tất cả<br>
                <input type="radio" name="thuonghieu" value="Món Âu"> Món Âu<br>
                <input type="radio" name="thuonghieu" value="Món Ý"> Món Ý<br>
                <input type="radio" name="thuonghieu" value="Món Nhật"> Món Nhật<br>
                <input type="radio" name="thuonghieu" value="Món Việt"> Món Việt<br>
            </div>

            <div class="inner-loc">
                <h3>Lọc Theo Giá</h3>
                <input type="number" id="gia_min" placeholder="Từ"> -
                <input type="number" id="gia_max" placeholder="Đến"><br>
                <input type="button" class="button button-one" value="Áp Dụng">
            </div>
        </div>

        <!-- Danh sách món -->
        <div class="inner-danhsach">
            <div class="inner-head">
                <div style="margin-top: 5px;">
                    <c:choose>
                        <c:when test="${not empty foods}">
                            ${foods.size()} Món Ăn
                        </c:when>
                        <c:otherwise>
                            0 Món Ăn
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="inner-find">
                    <input type="text" id="timkiem" placeholder="Tìm món ăn">
                    <input type="button" class="button button-two" value="Tìm">
                </div>
                <div class="choice">
                    <select class="section">
                        <option value="macdinh">Mặc Định</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                    <i class="fa-solid fa-list"></i>
                    <i class="fa-solid fa-list-check"></i>
                </div>
            </div>

            <!-- THÔNG BÁO KHÔNG TÌM THẤY -->
            <div id="not-found-message">
                🧐 Không tìm thấy món nào phù hợp! Hãy thử lại 🔍✨
            </div>

            <div class="inner-thucdon">
                <c:choose>
                    <c:when test="${not empty foods}">
                        <c:forEach var="food" items="${foods}">
                            <c:if test="${not empty food.name and not empty food.img}">
                                <div class="food-card" data-brand="${food.brand}">
                                    <div class="food-image">
                                        <img src="${pageContext.request.contextPath}/static/avatars/media/${food.img}" alt="${food.name}">
                                    </div>
                                    <div class="food-info">
                                        <h3 class="food-name">
                                            ${food.name} <span class="label-new">Mới</span>
                                        </h3>
                                        <div class="food-slug">${fn:replace(fn:toLowerCase(food.name),' ','-')}</div>
                                        <div class="food-tags">
                                            <span class="tag">Đã xác minh</span>
                                            <span class="tag">Số lượng: 75</span>
                                            <span class="tag">3 Đánh giá</span>
                                            <span class="tag">${food.brand}</span>
                                        </div>
                                        <p class="food-desc">
                                            Salad rau mùa sốt cam là sự lựa chọn tuyệt vời cho các tín đồ yêu eat clean.
                                        </p>
                                        <div class="food-category">${food.category}</div>
                                    </div>
                                    <div class="food-action">
                                        <div class="food-price">
                                            <span class="price-old">${food.orig_price}</span>
                                            <span class="price-new">${food.price}</span>
                                        </div>

                                        <div class="food-action-row">
                                            <button class="btn-cart">Thêm vào giỏ hàng</button>
                                            <div class="food-icons">
                                                <button class="icon-btn">
                                                    <a href="dish_detail.jsp" style="color:black;">
                                                        <i class="fa fa-eye"></i>
                                                    </a>
                                                </button>
                                                <button class="icon-btn btn-love" data-name="${food.name}">
                                                    <i class="fa fa-heart ${food.inFavorite ? 'active' : ''}"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>Danh sách món trống. Hãy kiểm tra lại dữ liệu từ server.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/partials/footer.jsp" />

<!-- JS Lọc và Yêu thích -->
<script src="${pageContext.request.contextPath}/static/js/menu_filter.js"></script>
<script src="${pageContext.request.contextPath}/static/js/favorite.js"></script>

</body>
</html>
