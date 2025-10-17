<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AllFood</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css"/>
    <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>
</head>

<body>
    <!-- Header -->
    <jsp:include page="/WEB-INF/views/partials/header.jsp"/>

    <div class="inner-position">
        <p>Bạn đang ở đây: =></p>
        <a href="intro.jsp">Trang chủ =></a>
        <span style="color: black;margin-left: 1px;">Chi tiết món ăn</span>
    </div>

    <div class="container">
        <div class="main-content">

            <!-- Chi tiết món ăn -->
            <div class="dish">
                <div>
                    <img class="dish_img" src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="Cơm sườn nướng" >
                    <br>
                    <a href="#" class="favorite">
                        <div class="dish_favorite">
                            <i class="fa-solid fa-heart"></i>
                            Thêm vào yêu thích
                        </div>                     
                    </a>
                </div>

                <div class="details">
                    <h2>Cơm sườn nướng</h2>
                    <p class="price">-3% 65.000 VND <del>75.000 VND</del></p>
                    <p>Cơm sườn nướng sẽ gay ăn cùng nước chấm ngậy tí, ăn cùng dưa chua, dưa muối sẽ rất ngon miệng.</p>
                    <div class="quantity">
                        số lượng: 
                        <button>-</button>
                        <span>1</span>
                        <button>+</button>
                    </div>
                    <div class="actions">
                        <button class="add-to-cart">Thêm vào giỏ hàng</button>
                        <button class="order-now">
                            <a style="text-decoration: none;color: #fff;" href="reserve.jsp">Đặt bàn ngay</a>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Tabs mô tả - đánh giá - chính sách -->
            <div class="tab-section">
                <div class="tabs">
                    <button class="tab-btn active" data-tab="description">Mô tả món ăn</button>
                    <button class="tab-btn" data-tab="reviews">Đánh giá</button>
                    <button class="tab-btn" data-tab="policy">Chính sách</button>
                </div>

                <div class="tab-divider"></div>

                <div class="tab-content active" id="description">
                    <h3>Sơ lược món ăn:</h3>
                    <br>
                    <p>Cơm sườn nướng là món ăn quen thuộc mang đậm hương vị truyền thống Việt Nam. 
                        Sườn heo được ướp đậm đà với tỏi, sả, nước mắm, mật ong rồi nướng trên than 
                        hồng đến khi chín vàng, thơm phức. Ăn kèm cơm trắng dẻo, dưa chua và nước mắm
                        chua ngọt pha theo công thức riêng, món ăn mang lại sự cân bằng tuyệt vời giữa vị béo, 
                        mặn, ngọt và chua. Một chút mỡ hành và tóp mỡ giòn tạo điểm nhấn hấp dẫn, khiến thực khách
                        nhớ mãi ngay từ lần đầu thưởng thức.</p>
                </div>

                <div class="tab-content" id="reviews">
                    <h3>Đánh giá sản phẩm</h3>
                    <div class="rating-filter">
                        <span>Lọc đánh giá:</span>
                        <button>★★★★★</button>
                        <button>★★★★☆</button>
                        <button>★★★☆☆</button>
                        <button>★★☆☆☆</button>
                        <button>★☆☆☆☆</button>
                        <button>Tất cả</button>
                    </div>
                    <div class="review-summary">
                        <strong>Tổng quan đánh giá</strong>
                        <p class="score">0/5</p>
                        <p>Chưa có đánh giá nào. Hãy là người đầu tiên đánh giá!</p>
                    </div>
                    <p>Đánh giá chất lượng sản phẩm:</p>
                    <div class="star-rating">
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="5">&#9733;</span>
                    </div>

                    <div class="feedback-section">
                        <label for="user-feedback">Góp ý của bạn:</label>
                        <textarea id="user-feedback" placeholder="Nhập đánh giá của bạn..."></textarea>
                        <button class="submit-feedback">Gửi đánh giá</button>
                    </div>
                </div>

                <div class="tab-content" id="policy">
                    <h3>Chính sách sản phẩm:</h3>
                    <br>
                    <ul class="policy-list">
                        <li><a href="#">Chính sách bảo mật</a></li>
                        <li><a href="#">Chính sách an toàn thực phẩm</a></li>
                        <li><a href="#">Chính sách vận chuyển</a></li>
                        <li><a href="#">Chính sách sử dụng</a></li>
                    </ul>
                </div>
            </div>

            <!-- Sản phẩm cùng loại -->
            <div class="new-dishes-section">
                <h2>Sản phẩm cùng loại</h2>
                <div class="new-dishes-scroll" id="newDishesScroll">
                    <c:forEach var="food" items="${relatedFoods}">
                        <div class="food-item">
                            <img src="${food.image}" alt="${food.name}">
                            <p>${food.discount}% ${food.price} VND <span>${food.oldPrice} VND</span></p>
                            <button class="detail-btn">Xem chi tiết</button>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- Sidebar -->
        <jsp:include page="/WEB-INF/views/partials/sidebar.jsp"/>
    </div>

    <!-- Icon chat -->
    <div class="chat-fixed-icons">
        <div class="chat-icon message-icon">
            <a class="chat" href="https://www.facebook.com/giacs.aos.121" target="_blank">
                <i class="fa-brands fa-facebook-messenger"></i>
                <div class="chat-tooltip">Chuyên gia tư vấn đang sẵn sàng</div>
            </a>
        </div>

        <div class="chat-icon instagram-icon">
            <a class="chat" href="https://www.instagram.com/linhnef.30__/" target="_blank">
                <i class="fa-brands fa-instagram"></i>
            </a>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/partials/footer.jsp"/>

    <script src="${pageContext.request.contextPath}/static/CssTotal/script.js"></script>
</body>
</html>
