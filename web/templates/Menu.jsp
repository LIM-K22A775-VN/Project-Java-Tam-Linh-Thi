<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Túi Xách Thời Trang</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

        <!-- CSS -->
        <link rel="stylesheet" href="<c:url value='/static/CssTotal/stylemenu.css'/>" />
        <link rel="stylesheet" href="<c:url value='/static/CssTotal/standard.css'/>" />
        <link rel="stylesheet" href="<c:url value='/static/ascesss/css/formchuan.css'/>">

        <script src="<c:url value='/static/CssTotal/standard.js'/>"></script>

        <style>
            .navbar_right {
                margin-top: -3px;
                justify-content: center;
                align-items: center;
            }
            .bag-card.hidden {
                display: none;
            }

            /* Thông báo không tìm thấy */
            #not-found-message {
                display: none;
                padding: 20px;
                background: linear-gradient(45deg, #6d4c41, #a1887f);
                color: #fff;
                text-align: center;
                font-size: 20px;
                font-weight: bold;
                border-radius: 8px;
                margin-bottom: 20px;
                animation: pulse 1s infinite alternate;
            }
            @keyframes pulse {
                from {
                    transform: scale(1);
                }
                to {
                    transform: scale(1.05);
                }
            }

            /* Toast thông báo */
            .toast {
                position: fixed;
                top: 30px;
                right: 30px;
                display: flex;
                align-items: center;
                gap: 12px;
                background: linear-gradient(135deg, #6d4c41, #a1887f);
                color: #fff;
                padding: 16px 28px;
                border-radius: 20px 5px 20px 5px;
                box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
                z-index: 9999; /* giảm xuống vẫn đủ cao */
                opacity: 0;    /* ẩn mặc định */
                transform: translateX(100%); /* bắt đầu ngoài màn hình */
                transition: transform 0.5s ease, opacity 0.5s ease;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                font-size: 16px;
            }

            .toast i {
                font-size: 18px;
            }
            .icon-btn .fa-heart {
                transition: color 0.3s ease;
            }
            .icon-btn .fa-heart.active {
                color: #b71c1c;
            }

            /* Vùng tổng thể */
            .section-one {
                padding: 50px 90px;
                background-color: #ffffff; /* nền trắng tinh */
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            /* Bố cục chia 2 cột */
            .inner-wrap {
                display: flex;
                gap: 50px;
                align-items: flex-start;
            }

            /* Cột bên trái: bộ lọc */
            .inner-chon {
                flex: 1;
                max-width: 270px;
                background: #fff;
                padding: 25px 20px;
                border-radius: 15px;
                box-shadow: 0 5px 18px rgba(0,0,0,0.08);
                position: sticky;
                top: 80px;
            }

            .inner-chon h3 {
                font-size: 18px;
                margin-bottom: 10px;
                color: #4e342e;
                border-left: 4px solid #8d6e63;
                padding-left: 8px;
            }

            .inner-chon label {
                display: block;
                margin: 5px 0;
                color: #555;
                cursor: pointer;
            }

            .inner-chon input[type="radio"] {
                accent-color: #8d6e63;
                margin-right: 5px;
            }

            /* Lọc theo giá */
            .inner-loc input[type="number"] {
                width: 80px;
                padding: 5px 8px;
                border: 1px solid #ccc;
                border-radius: 6px;
            }

            .inner-loc .button-one {
                margin-top: 8px;
                background: linear-gradient(90deg, #8d6e63, #a1887f);
                color: white;
                border: none;
                padding: 8px 14px;
                border-radius: 8px;
                cursor: pointer;
                transition: 0.3s;
            }

            .inner-loc .button-one:hover {
                background: linear-gradient(90deg, #6d4c41, #8d6e63);
            }

            /* Danh sách túi */
            .inner-danhsach {
                flex: 3;
            }

            /* Thanh đầu */
            .inner-head {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: #fff;
                padding: 14px 18px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.05);
                margin-bottom: 25px;
            }

            .inner-head .inner-find input[type="text"] {
                padding: 8px 12px;
                width: 240px;
                border: 1px solid #ccc;
                border-radius: 8px;
                outline: none;
                transition: 0.3s;
            }

            .inner-head .inner-find input[type="text"]:focus {
                border-color: #8d6e63;
                box-shadow: 0 0 4px rgba(141,110,99,0.3);
            }

            .inner-head .button-two {
                margin-left: 8px;
                padding: 8px 14px;
                background: linear-gradient(90deg, #8d6e63, #a1887f);
                border: none;
                color: white;
                border-radius: 8px;
                cursor: pointer;
                transition: 0.3s;
            }

            .inner-head .button-two:hover {
                background: linear-gradient(90deg, #6d4c41, #8d6e63);
            }

            /* Dropdown */
            .choice select {
                padding: 6px;
                border-radius: 8px;
                border: 1px solid #ccc;
                outline: none;
            }

            /* Lưới sản phẩm */
            .inner-thucdon {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 28px;
            }

            /* Thẻ sản phẩm */
            .bag-card {
                background: #fff;
                border-radius: 16px;
                overflow: hidden;
                box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
                transition: all 0.3s ease;
                display: flex;
                flex-direction: column;
            }

            .bag-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 10px 25px rgba(141,110,99,0.25);
            }

            /* Ảnh sản phẩm */
            .bag-image img {
                width: 100%;
                height: 230px;
                object-fit: cover;
                transition: 0.4s ease;
            }

            .bag-card:hover .bag-image img {
                transform: scale(1.05);
            }

            /* Thông tin */
            .bag-info {
                padding: 15px 18px;
            }

            .bag-name {
                font-size: 18px;
                font-weight: 600;
                color: #3e2723;
                margin-bottom: 5px;
            }

            .bag-tags .tag {
                display: inline-block;
                background: #f3e5f0;
                color: #6d4c41;
                font-size: 13px;
                padding: 4px 8px;
                border-radius: 6px;
                font-weight: 500;
            }

            .bag-category {
                color: #777;
                font-size: 14px;
                margin-top: 4px;
            }

            /* Giá & hành động */
            .bag-action {
                padding: 15px 18px;
                border-top: 1px solid #eee;
            }

            .bag-price {
                margin-bottom: 8px;
            }

            .price-old {
                text-decoration: line-through;
                color: #999;
                font-size: 14px;
            }

            .price-new {
                color: #6d4c41;
                font-weight: bold;
                font-size: 19px;
            }

            /* Nút thêm giỏ hàng */
            .btn-cart {
                background: linear-gradient(90deg, #8d6e63, #a1887f);
                color: #fff;
                border: none;
                padding: 9px 14px;
                border-radius: 8px;
                cursor: pointer;
                transition: 0.3s;
            }

            .btn-cart:hover {
                background: linear-gradient(90deg, #6d4c41, #8d6e63);
            }

            /* Icon yêu thích */
            .icon-btn {
                background: transparent;
                border: none;
                font-size: 20px;
                color: #bbb;
                margin-left: 10px;
                cursor: pointer;
                transition: color 0.3s ease;
            }

            .icon-btn:hover {
                color: #8d6e63;
            }

            .icon-btn .fa-heart.active {
                color: #b71c1c;
            }

            /* Responsive */
            @media (max-width: 992px) {
                .inner-wrap {
                    flex-direction: column;
                }
                .inner-chon {
                    position: static;
                    max-width: 100%;
                }
            }

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
                        <input type="radio" name="danhmuc" value="Túi xách nữ"> Túi xách nữ<br>
                        <input type="radio" name="danhmuc" value="Túi xách nam"> Túi xách nam<br>
                        <input type="radio" name="danhmuc" value="Balo"> Balo<br>
                        <input type="radio" name="danhmuc" value="Ví da"> Ví da<br>
                        <input type="radio" name="danhmuc" value="Túi công sở"> Túi công sở<br>
                        <input type="radio" name="danhmuc" value="Phụ kiện thời trang"> Phụ kiện thời trang<br>
                        <input type="radio" name="danhmuc" value="Khuyến mãi"> Khuyến mãi<br>
                    </div>

                    <div class="inner-thuonghieu">
                        <h3>Thương Hiệu</h3>
                        <input type="radio" name="thuonghieu" value="Tất cả" checked> Tất cả<br>
                        <input type="radio" name="thuonghieu" value="Gucci"> Gucci<br>
                        <input type="radio" name="thuonghieu" value="Louis Vuitton"> Louis Vuitton<br>
                        <input type="radio" name="thuonghieu" value="Chanel"> Chanel<br>
                        <input type="radio" name="thuonghieu" value="Prada"> Prada<br>
                        <input type="radio" name="thuonghieu" value="Dior"> Dior<br>
                    </div>

                    <div class="inner-loc">
                        <h3>Lọc Theo Giá</h3>
                        <input type="number" id="gia_min" placeholder="Từ"> -
                        <input type="number" id="gia_max" placeholder="Đến"><br>
                        <input type="button" class="button button-one" value="Áp Dụng">
                    </div>
                </div>

                <!-- Danh sách túi -->
                <div class="inner-danhsach">
                    <div class="inner-head">
                        <div style="margin-top: 5px;"><c:out value="${fn:length(bags)}"/> Túi Xách</div>
                        <div class="inner-find">
                            <input type="text" id="timkiem" placeholder="Tìm túi xách...">
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

                    <div id="not-found-message">👜 Không tìm thấy túi nào phù hợp! Hãy thử lại 🔍✨</div>

                    <div class="inner-thucdon">
                        <c:forEach var="bag" items="${bags}">
                            <div class="bag-card" data-brand="${bag.brand}">
                                <div class="bag-image">
                                    <img src="<c:url value='/static/avatars/media/${bag.img}'/>" alt="${bag.name}">
                                </div>
                                <div class="bag-info">
                                    <h3 class="bag-name">${bag.name} <span class="label-new">Mới</span></h3>
                                    <div class="bag-tags"><span class="tag">${bag.brand}</span></div>
                                    <div class="bag-category">${bag.category}</div>
                                    <div class="bag-id">ID: ${bag.id}</div> <!-- Thêm dòng này -->
                                </div>
                                <div class="bag-action">
                                    <div class="bag-price">
                                        <span class="price-old"><c:out value="${bag.origPrice}"/> VND</span>
                                        <span class="price-new"><c:out value="${bag.price}"/> VND</span>
                                    </div>
                                    <div class="bag-action-row">


                                        <button class="btn-cart" data-name="${bag.name}" data-id="${bag.id}">
                                            <c:choose>
                                                <c:when test="${bag.inCart}">Đã có trong giỏ hàng </c:when>
                                                <c:otherwise>Thêm vào giỏ hàng</c:otherwise>
                                            </c:choose>
                                        </button>
                                        <div class="bag-icons">
                                            <button class="icon-btn btn-love" data-id="${bag.id}">
                                                <i class="fa fa-heart ${bag.inFavorite ? 'active' : ''}"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/partials/footer.jsp"/>

        <!-- JS -->
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const applyButton = document.querySelector('.button-one');
                const searchButton = document.querySelector('.button-two');
                const searchInput = document.getElementById('timkiem');
                const bagCards = document.querySelectorAll('.bag-card');
                const notFoundMessage = document.getElementById('not-found-message');

                function filterBags() {
                    const danhMuc = document.querySelector('input[name="danhmuc"]:checked').value;
                    const thuongHieu = document.querySelector('input[name="thuonghieu"]:checked').value;
                    const giaMin = parseFloat(document.getElementById('gia_min').value) || 0;
                    const giaMax = parseFloat(document.getElementById('gia_max').value) || Infinity;
                    const keyword = searchInput.value.trim().toLowerCase();

                    let found = false;

                    bagCards.forEach(card => {
                        const category = card.querySelector('.bag-category').textContent.trim();
                        const brand = card.getAttribute('data-brand').trim();
                        const name = card.querySelector('.bag-name').textContent.trim().toLowerCase();
                        const priceText = card.querySelector('.price-new').textContent.replace(/[^\d]/g, '');
                        const price = parseFloat(priceText);

                        const matchDanhMuc = danhMuc === 'Tất cả' || category.includes(danhMuc);
                        const matchThuongHieu = thuongHieu === 'Tất cả' || brand.includes(thuongHieu);
                        const matchGia = price >= giaMin && price <= giaMax;
                        const matchKeyword = keyword === '' || name.includes(keyword);

                        if (matchDanhMuc && matchThuongHieu && matchGia && matchKeyword) {
                            card.classList.remove('hidden');
                            found = true;
                        } else {
                            card.classList.add('hidden');
                        }
                    });

                    notFoundMessage.style.display = found ? 'none' : 'block';
                }

                applyButton.addEventListener('click', filterBags);
                searchButton.addEventListener('click', filterBags);
            });
        </script>

        <script>
            // --- Hàm hiển thị thông báo ---
            function showToast(message) {
                const toast = document.createElement('div');
                toast.className = 'toast';
                toast.textContent = message;

                if (message.toLowerCase().includes("lỗi") || message.toLowerCase().includes("không")) {
                    toast.style.background = 'linear-gradient(135deg, #f44336, #e91e63)';
                }

                document.body.appendChild(toast);

                // Thêm đoạn này để làm toast xuất hiện mượt
                setTimeout(() => {
                    toast.style.opacity = '1';
                    toast.style.transform = 'translateX(0)';
                }, 100); // delay nhẹ để transition hoạt động

                // Ẩn đi sau 2.5 giây
                setTimeout(() => {
                    toast.style.transform = 'translateX(120%)';
                    toast.style.opacity = '0';
                }, 2500);

                // Xóa khỏi DOM sau 4 giây
                setTimeout(() => {
                    toast.remove();
                }, 4000);
            }

            document.addEventListener('click', e => {
                if (e.target.closest('.btn-love')) {
                    const btn = e.target.closest('.btn-love');
                    const heart = btn.querySelector('i');
                    const idBag = btn.dataset.id; // Lấy ID túi

                    // Nếu đang active thì gỡ khỏi yêu thích, ngược lại thì thêm
                    const isActive = heart.classList.contains('active');
                    const url = isActive
                            ? '${pageContext.request.contextPath}/remove_from_favorite'
                            : '${pageContext.request.contextPath}/add_to_favorite';

                    fetch(url, {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({idBag}) // Gửi IdBag, không phải name
                    })
                            .then(res => res.json())
                            .then(data => {
                                // Đổi trạng thái trái tim
                                heart.classList.toggle('active');
                                showToast(data.message);
                            })
                            .catch(() => showToast("Lỗi khi xử lý yêu thích"));
                }


                if (e.target.closest('.btn-cart')) {
                    const btn = e.target.closest('.btn-cart');
                    const name = btn.dataset.name;
                    const idBag = btn.dataset.id;  // lấy IdBag
                    const isInCart = btn.textContent.includes('Đã có');
                    const url = isInCart ? '${pageContext.request.contextPath}/remove_from_cart' : '${pageContext.request.contextPath}/add_to_cart';

                    fetch(url, {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({idBag}) // gửi IdBag thay vì name
                    })
                            .then(res => res.json())
                            .then(data => {
                                btn.textContent = isInCart ? 'Thêm vào giỏ hàng' : 'Đã có trong giỏ hàng';
                                showToast(data.message);
                            }).catch(() => showToast('Lỗi!'));
                }
            });




        </script>

        <script src="<c:url value='/static/js/tuvan.js'/>"></script>
        <script>const userEmail = "${sessionScope.user.email}";</script>
    </body>
</html>
