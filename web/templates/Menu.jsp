<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8">
  <title>Thực Đơn</title>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/static/CssTotal/stylemenu.css'/>" />
  <link rel="stylesheet" href="<c:url value='/static/CssTotal/standard.css'/>" />
  <link rel="stylesheet" href="<c:url value='/static/ascesss/css/formchuan.css'/>">

  <script src="<c:url value='/static/CssTotal/standard.js'/>"></script>

  <style>
    .navbar_right { margin-top: -3px; justify-content: center; align-items: center; }
    .food-card.hidden { display: none; }
    #not-found-message { display: none; padding: 20px; background: linear-gradient(45deg, #ff416c, #ff4b2b); color: #fff; text-align: center; font-size: 20px; font-weight: bold; border-radius: 8px; margin-bottom: 20px; animation: pulse 1s infinite alternate; }
    @keyframes pulse { from { transform: scale(1); } to { transform: scale(1.05); } }
    .toast { position: fixed; top: 30px; right: 30px; display: flex; align-items: center; gap: 12px; background: linear-gradient(135deg, #0050c8, #43a047); color: #fff; padding: 16px 28px; border-radius: 20px 5px 20px 5px; box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25); z-index: 9999999999; opacity: 1; transform: translateX(0); transition: transform 1.5s ease-in-out, opacity 1.5s ease-in-out; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 16px; backdrop-filter: blur(4px); border: 1px solid rgba(255, 255, 255, 0.3); }
    .toast i { font-size: 18px; }
    .icon-btn .fa-heart { transition: color 0.3s ease; }
    .icon-btn .fa-heart.active { color: red; }
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
          <input type="radio" name="danhmuc" value="Canh-Tiềm-Súp"> Canh-Tiềm-Súp<br>
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
          <div style="margin-top: 5px;"><c:out value="${fn:length(foods)}"/> Món Ăn</div>
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

        <div id="not-found-message">🧐 Không tìm thấy món nào phù hợp! Hãy thử lại 🔍✨</div>

        <div class="inner-thucdon">
          <c:forEach var="food" items="${foods}">
            <div class="food-card" data-brand="${food.brand}">
              <div class="food-image">
                <img src="<c:url value='/static/avatars/media/${food.img}'/>" alt="${food.name}">
              </div>
              <div class="food-info">
                <h3 class="food-name">${food.name} <span class="label-new">Mới</span></h3>
                <div class="food-slug"><c:out value="${fn:toLowerCase(food.name).replace(' ','-')}"/></div>
                <div class="food-tags"><span class="tag">${food.brand}</span></div>
                <div class="food-category">${food.category}</div>
              </div>
              <div class="food-action">
                <div class="food-price">
                  <span class="price-old"><c:out value="${food.orig_price}"/> VND</span>
                  <span class="price-new"><c:out value="${food.price}"/> VND</span>
                </div>
                <div class="food-action-row">
                  <button class="btn-cart" data-name="${food.name}">
                    <c:choose>
                      <c:when test="${food.in_cart}">Đã có trong giỏ hàng</c:when>
                      <c:otherwise>Thêm vào giỏ hàng</c:otherwise>
                    </c:choose>
                  </button>
                  <div class="food-icons">
                    <button class="icon-btn btn-love" data-name="${food.name}">
                      <i class="fa fa-heart <c:if test='${food.in_favorite}'>active</c:if>'"></i>
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

  <!-- JS: Lọc, yêu thích, giỏ hàng, tư vấn -->
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const applyButton = document.querySelector('.button-one');
      const searchButton = document.querySelector('.button-two');
      const searchInput = document.getElementById('timkiem');
      const foodCards = document.querySelectorAll('.food-card');
      const notFoundMessage = document.getElementById('not-found-message');

      function filterFoods() {
        const danhMuc = document.querySelector('input[name="danhmuc"]:checked').value;
        const thuongHieu = document.querySelector('input[name="thuonghieu"]:checked').value;
        const giaMin = parseFloat(document.getElementById('gia_min').value) || 0;
        const giaMax = parseFloat(document.getElementById('gia_max').value) || Infinity;
        const keyword = searchInput.value.trim().toLowerCase();

        let found = false;

        foodCards.forEach(card => {
          const category = card.querySelector('.food-category').textContent.trim();
          const brand = card.getAttribute('data-brand').trim();
          const name = card.querySelector('.food-name').textContent.trim().toLowerCase();
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

      applyButton.addEventListener('click', filterFoods);
      searchButton.addEventListener('click', filterFoods);
    });
  </script>

  <script>
    function showToast(message) {
      const oldToast = document.getElementById('toast');
      if (oldToast) oldToast.remove();
      const toast = document.createElement('div');
      toast.id = 'toast';
      toast.className = 'toast';
      toast.innerHTML = `<i class="fa fa-check-circle"></i> ${message}`;
      document.body.appendChild(toast);
      setTimeout(() => { toast.style.transform = 'translateX(120%)'; toast.style.opacity = '0'; setTimeout(() => toast.remove(), 1500); }, 3000);
    }

    document.addEventListener('DOMContentLoaded', () => {
      const loveButtons = document.querySelectorAll('.btn-love');
      loveButtons.forEach(btn => {
        btn.addEventListener('click', () => {
          const heartIcon = btn.querySelector('i');
          const foodName = btn.getAttribute('data-name');
          const isActive = heartIcon.classList.contains('active');
          const url = isActive ? '/remove_from_favorite' : '/add_to_favorite';

          fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ name: foodName })
          }).then(res => res.json()).then(data => {
            showToast(data.message);
            heartIcon.classList.toggle('active');
          }).catch(err => { console.error(err); showToast('Lỗi!'); });
        });
      });

      const cartButtons = document.querySelectorAll('.btn-cart');
      cartButtons.forEach(btn => {
        btn.addEventListener('click', () => {
          const foodName = btn.getAttribute('data-name');
          const isInCart = btn.textContent.includes('Đã có');

          const url = isInCart ? '/remove_from_cart' : '/add_to_cart';
          fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ name: foodName })
          }).then(res => res.json()).then(data => {
            showToast(data.message);
            if (data.status === 'success') btn.textContent = isInCart ? 'Thêm vào giỏ hàng' : 'Đã có trong giỏ hàng';
          }).catch(err => { console.error(err); showToast('Lỗi!'); });
        });
      });
    });
  </script>

  <script src="<c:url value='/static/js/tuvan.js'/>"></script>
  <script> const userEmail = "${sessionScope.user_email}"; </script>

</body>
</html>
