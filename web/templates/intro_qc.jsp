<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Túi Xách</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/main.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
        <script src="${pageContext.request.contextPath}/static/CssTotal/js.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css" />
        <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>
        <style>
            .food-section h2 {
                margin-top: 20px;
            }
            .register-form {
                width: 100%;
                height: 500px;
                background-image: url(${pageContext.request.contextPath}/static/avatars/media/backfood.jpg);
                object-fit: cover;
                background-size: cover;
                background-position: center;
                padding: 30px;
            }
            .navbar_right {
                margin-top: -3px;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>

    <body>

        <header class="header">
            <img class="logo" src="${pageContext.request.contextPath}/static/avatars/media/logo2.png" alt="logo" />
            <div class="navbar">
                <div class="navbar_item"><a href="trangchu.jsp">Trang chủ</a></div>
                <div class="navbar_item"><a href="refarral.jsp">Giới thiệu</a></div>
                <div class="navbar_item"><a href="Menu.jsp">Sản Phẩm</a></div>
                <div class="navbar_item"><a href="article.jsp">Bài viết</a></div>
                <div class="navbar_item"><a href="gallery.jsp">Hình ảnh</a></div>
                <div class="navbar_item"><a href="contact.jsp">Liên hệ</a></div>
            </div>
            <div class="navbar_right">
                <div class="navbar_item navbar_item_right"><a href="reserve.jsp"><i class="fa-solid fa-calendar-check navbar_icon"></i>Đặt bàn</a></div>
                <div class="navbar_item navbar_item_right">
                    <a href="${pageContext.request.contextPath}/login">
                        <i class="fa-solid fa-right-to-bracket navbar_icon"></i>Đăng Nhập
                    </a>
                </div>
                <div class="navbar_item navbar_item_right">
                    <a href="${pageContext.request.contextPath}/register">
                        <i class="fa-solid fa-user-plus navbar_icon"></i>Đăng Ký
                    </a>
                </div>

                <div class="navbar_item navbar_item_right"><a href="Cart.jsp"><i class="fa-solid fa-cart-shopping navbar_icon"></i>Giỏ hàng</a></div>
            </div>
        </header>

        <!-- Banner và các section khác giữ nguyên, chỉ thay đường dẫn image và js/css bằng EL -->
        <div class="banner">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="Ảnh 1"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/static/avatars/media/5.jpg" alt="Ảnh 2"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="Ảnh 3"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="Ảnh 4"></div>
                    <div class="swiper-slide"><img src="${pageContext.request.contextPath}/static/avatars/media/5.jpg" alt="Ảnh 5"></div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>

        <div class="service-promises">
            <div class="promise-item">
                <div class="promise-icon">
                    <i class="fa-solid fa-truck-fast"></i>
                </div>
                <div class="promise-text">
                    <h4>Miễn phí vận chuyển</h4>
                    <p>Cho đơn hàng từ 500k</p>
                </div>
            </div>
            <div class="promise-item">
                <div class="promise-icon">
                    <i class="fa-solid fa-hand-holding-heart"></i>
                </div>
                <div class="promise-text">
                    <h4>Bảo hiểm sản phẩm</h4>
                    <p>Đảm chất lượng túi xách</p>
                </div>
            </div>
            <div class="promise-item">
                <div class="promise-icon">
                    <i class="fa-solid fa-qrcode"></i>
                </div>
                <div class="promise-text">
                    <h4>Thanh toán COD</h4>
                    <p>Hoặc thanh toán quét mã QR</p>
                </div>
            </div>
            <div class="promise-item">
                <div class="promise-icon">
                    <i class="fa-solid fa-shield-halved"></i>
                </div>
                <div class="promise-text">
                    <h4>Bảo mật thông tin</h4>
                    <p>Đảm bảo thông tin khách hàng</p>
                </div>
            </div>
        </div>
        <div class="food-suggestion">
            <div class="food-title">Mua Túi Gì Hôm Nay</div>
            <input type="text" class="food-input-box" placeholder="Tìm kiếm">
            <div class="food-options">
                <button class="food-option-btn">Tùy chọn</button>
                <button class="food-option-btn">Túi xách da cao cấp</button>
                <button class="food-option-btn">Túi tote canvas</button>
                <button class="food-option-btn">Túi đeo chéo mini</button>
                <button class="food-option-btn">Túi cầm tay dự tiệc</button>
                <button class="food-option-btn">Balo thời trang nữ</button>
                <button class="food-option-btn">Túi đeo vai Hàn Quốc</button>
                <button class="food-option-btn">Túi công sở da bò</button>

            </div>
        </div>
        <div class="intro-standard">
            <div class="standard-text">

                <h3>T_L_T_Restaurant</h3>
                <p>
                    Tôn vinh vẻ đẹp thanh lịch và đẳng cấp qua từng chiếc túi xách được chế tác tinh xảo. 
                    Mỗi sản phẩm của chúng tôi không chỉ là phụ kiện, mà là tuyên ngôn phong cách dành cho người phụ nữ hiện đại — 
                    sang trọng, tự tin và khác biệt.
                </p>

                <div class="grid-container">
                    <div class="grid-item">
                        <i class="fas fa-user"></i>
                        <p>Đầu bếp chuyên nghiệp</p>
                    </div>
                    <div class="grid-item">
                        <i class="fas fa-utensils"></i>
                        <p>Ăn uống sinh thái xanh</p>
                    </div>
                    <div class="grid-item">
                        <i class="fas fa-utensils"></i>
                        <p>Thực đơn phong phú</p>
                    </div>
                    <div class="grid-item">
                        <i class="fas fa-user-friends"></i>
                        <p>Khách hàng lưu ý đổi</p>
                    </div>
                </div>
            </div>
            <div class="standard-img">
                <img src="${pageContext.request.contextPath}/static/avatars/media/chef2.jpg" alt="alt" />
            </div>
        </div>
        <div class="food-section">
            <h2>Một số sản phẩm túi sách phổ biến của nhà hàng</h2>
            <div class="filter-buttons">
                <button class="filter-btn active" data-category="all">Tất cả</button>
                <button class="filter-btn" data-category="main">Túi xách tay</button>
                <button class="filter-btn" data-category="soup">Túi đeo vai</button>
                <button class="filter-btn" data-category="dessert">Túi đeo chéo</button>
                <button class="filter-btn" data-category="drink">Túi cầm tay</button>
                <button class="filter-btn" data-category="other">Balo thời trang</button>
            </div>
            <div class="food-grid" id="foodGrid">

            </div>
        </div>
        <div class="new-dishes-section">
            <h2>Những sản phẩm mới</h2>
            <div class="new-dishes-scroll" id="newDishesScroll">
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="Salad rau muống sợi cam">
                    <p>-24% 68.000 VND <span>89.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/3.jpg" alt="Gỏi táo hoa chuối">
                    <p>-11% 120.000 VND <span>135.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/3.jpg" alt="Sụn gà xóc muối Tứ Ninh">
                    <p>-18% 135.000 VND <span>165.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/4.jpg" alt="Nem lụi nướng mỡ">
                    <p>-12% 158.000 VND <span>179.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/5.jpg" alt="Mì spaghetti sốt kem nấm">
                    <p>-29% 99.000 VND <span>140.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/6.jpg" alt="Cơm chiên hải sản">
                    <p>-25% 90.000 VND <span>120.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/anh1.jpg" alt="Salad rau muống sợi cam">
                    <p>-24% 68.000 VND <span>89.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/anh2.jpg" alt="Gỏi táo hoa chuối">
                    <p>-11% 120.000 VND <span>135.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/anh3.jpg" alt="Sụn gà xóc muối Tứ Ninh">
                    <p>-18% 135.000 VND <span>165.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
                <div class="food-item">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/anh4.jpg" alt="Nem lụi nướng mỡ">
                    <p>-12% 158.000 VND <span>179.000 VND</span></p>
                    <button class="detail-btn">Xem chi tiết</button>
                </div>
            </div>
        </div>
        <div class="register-form">
            <h3>Đặt túi xách</h3>
            <h2>Lên lịch xem túi trực tiếp  </h2>
            <div id="form-container">
                <div class="form-group">
                    <input type="text" placeholder="Tên của bạn">
                </div>
                <div class="form-group">
                    <input type="email" placeholder="Email của bạn">
                </div>
                <div class="form-group">
                    <input type="tel" placeholder="Số điện thoại">
                </div>
                <div class="form-group">
                    <input type="number" placeholder="Số người">
                </div>
                <div class="date-group">
                    <input type="date">
                    <input type="time">
                </div>
                <div class="notes-group">
                    <textarea placeholder="Ghi chú"></textarea>
                </div>
                <button class="button_form">Đặt bàn ngay</button>
                <div class="footer-text">
                    Khách đặt trước 10h, liên hoan vui lòng gọi trước: 0987265336
                </div>
            </div>
        </div>
        <div class="referal-service">
            <h3>VỀ DỊCH VỤ</h3>
            <h2>Dịch vụ tốt nhất của chúng tôi</h2>
            <div class="referal-container">
                <div class="card">
                    <h3>Đầu bếp hàng đầu</h3>
                    <p>Đi đầu về lĩnh vực đầu bếp, các đầu bếp của chúng tôi luôn tận tâm để tạo ra những món ăn chất lượng.
                    </p>
                </div>
                <div class="card">
                    <h3>Chất lượng thực phẩm</h3>
                    <p>Tất cả các loại thực phẩm được chọn đều được chúng tôi kiểm tra kỹ càng để đảm bảo chất lượng thực
                        phẩm.</p>
                </div>
                <div class="card">
                    <h3>Không gian nhà hàng</h3>
                    <p>Không chỉ tạo nên không khí thoải mái, Nhà Restaurant sẽ luôn là sự lựa chọn hàng đầu của bạn.</p>
                </div>
            </div>

        </div>
        <div class="latest-news-section">
            <h2>Tin tức mới nhất về túi xách</h2>
            <div class="news-scroll" id="newsScroll">
                <div class="news-item" data-article-id="1">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/1.jpg" alt="Túi xách 1">
                    <p class="date">18:04, 19-06-2024</p>
                    <p>Bộ sưu tập túi xách xuân hè mới nhất 2024</p>
                </div>
                <div class="news-item" data-article-id="2">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/2.jpg" alt="Túi xách 2">
                    <p class="date">08:44, 29-12-2024</p>
                    <p>Top 5 mẫu túi đeo vai sang trọng được yêu thích nhất</p>
                </div>
                <div class="news-item" data-article-id="3">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/3.jpg" alt="Túi xách 3">
                    <p class="date">09:07, 29-12-2024</p>
                    <p>Khám phá phong cách túi xách tối giản nhưng đẳng cấp</p>
                </div>
                <div class="news-item" data-article-id="4">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/4.jpg" alt="Túi xách 4">
                    <p class="date">13:55, 20-02-2025</p>
                    <p>BST túi da cao cấp – điểm nhấn cho mọi outfit</p>
                </div>
                <div class="news-item" data-article-id="5">
                    <img src="${pageContext.request.contextPath}/static/avatars/media/5.jpg" alt="Túi xách 5">
                    <p class="date">13:59, 21-06-2025</p>
                    <p>Gợi ý túi xách phù hợp cho từng phong cách thời trang</p>
                </div>
            </div>
        </div>

    </div>
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-left">
                <h3>Cửa Hàng Túi Hàng Hiệu</h3>
                <p>Thương hiệu chuyên về các dòng túi xách cao cấp, thiết kế tinh tế, tôn vinh phong cách thanh lịch và hiện đại.</p>

            </div>
            <div class="footer-right">
                <h3>Thông tin liên hệ</h3>
                <p><i class="fas fa-map-marker-alt"></i> Địa chỉ: Lĩnh Nam, Hà Nội</p>
                <p><i class="fas fa-phone"></i> Điện thoại: 0999999999</p>
                <p><i class="fas fa-envelope"></i> Email: dabc@gmail.com</p>
            </div>
        </div>
    </footer>

    <script>
            const contextPath = "<%= request.getContextPath()%>";
            const userEmail = "<%= session.getAttribute("user_email") != null ? session.getAttribute("user_email") : ""%>";

            document.addEventListener("DOMContentLoaded", function () {
                if (!userEmail) {
                    const allLinks = document.querySelectorAll("a");
                    allLinks.forEach(link => {
                        if (!link.pathname.includes(contextPath + "/login") &&
                                !link.pathname.includes(contextPath + "/register"))
                        {
                            link.addEventListener("click", function (e) {
                                e.preventDefault();
                                alert("Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục!");
                                window.location.href = contextPath + "/login";
                            });
                        }
                    });

                    const bookBtn = document.querySelector(".button_form");
                    if (bookBtn) {
                        bookBtn.addEventListener("click", function (e) {
                            e.preventDefault();
                            alert("Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục!");
                            window.location.href = contextPath + "/login";
                        });
                    }
                }
            });
    </script>

</body>
</html>
