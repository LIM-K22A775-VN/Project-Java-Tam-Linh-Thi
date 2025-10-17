<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang quản trị</title>

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/edit_dish_admin.css"/>

        <!-- Font -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">

        <!-- Quill -->
        <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
        <script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
    </head>

    <body>
        <aside class="sidebar" id="sidebar">
            <div class="brand"><i class="fas fa-smile"></i> <span style="font-style: italic; font-weight: 600;">AdminLTE 4</span></div>
            <ul>
                <li><a href="order_admin.jsp"><i class="fas fa-shopping-bag"></i>&nbsp; Đơn hàng</a></li>
                <li><a href="booking_admin.jsp"><i class="fas fa-clipboard-list"></i>&nbsp; Đặt bàn</a></li>
                <li><a href="consultant_admin.jsp"><i class="fas fa-comment-dots"></i>&nbsp; Tư vấn</a></li>
                <li><a href="contact_admin.jsp"><i class="fas fa-phone"></i>&nbsp; Liên hệ</a></li>

                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-utensils"></i>&nbsp; Món ăn <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="dish_admin.jsp" class="active">Tất cả món ăn</a></li>
                        <li><a href="dish2_admin.jsp">Danh mục</a></li>
                        <li><a href="dish3_admin.jsp">Thương hiệu</a></li>
                    </ul>
                </li>

                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-newspaper"></i>&nbsp; Bài viết <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="article_admin.jsp" class="active">Tất cả bài viết</a></li>
                        <li><a href="theme_admin.jsp">Chủ đề</a></li>
                    </ul>
                </li>

                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-warehouse"></i>&nbsp; Quản lý kho <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="#" class="active">Thực phẩm đông lạnh</a></li>
                        <li><a href="#">Đồ tươi</a></li>
                        <li><a href="#">Pha chế</a></li>
                        <li><a href="storage4_admin.jsp">Đồ khô</a></li>
                    </ul>
                </li>

                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-palette"></i>&nbsp; Giao diện <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="menu_admin.jsp" class="active">Menu</a></li>
                        <li><a href="banner_admin.jsp">Banner</a></li>
                        <li><a href="library_admin.jsp">Thư viện ảnh</a></li>
                        <li><a href="keyword_admin.jsp">Từ khóa</a></li>
                    </ul>
                </li>

                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-users"></i>&nbsp; Thành Viên <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="member_admin.jsp" class="active">Tất cả thành viên</a></li>
                        <li><a href="#">Thêm thành viên</a></li>
                        <li><a href="staff_admin.jsp">Nhân viên</a></li>
                    </ul>
                </li>
            </ul>
        </aside>

        <div class="main" id="main">
            <div class="navbar">
                <div class="navbar-title">
                    <button id="toggleSidebar"><i class="fas fa-bars"></i></button>
                    <a href="admin.jsp">Trang chủ</a>
                    <a href="contact.jsp">Liên hệ</a>
                </div>

                <div class="navbar-right">
                    <div class="notification-wrapper">
                        <i class="fas fa-bell" id="notificationBtn"></i>
                        <span class="badge">15</span>
                        <div class="notification-box" id="notificationBox">
                            <div class="title">15 Notifications</div>
                            <div class="item"><i class="fas fa-envelope"></i> 4 new messages <span>3 mins</span></div>
                            <div class="item"><i class="fas fa-user-plus"></i> 8 friend requests <span>12 hours</span></div>
                            <div class="item"><i class="fas fa-file-alt"></i> 3 new reports <span>2 days</span></div>
                            <div class="see-all">See All Notifications</div>
                        </div>
                    </div>

                    <i class="fas fa-expand" id="fullscreenBtn"></i>

                    <div class="user-info">
                        <i class="fas fa-user"></i>
                        <span>Phan Linh</span>
                        <a href="intro.jsp"><i class="fas fa-power-off"></i> Thoát</a>
                    </div>
                </div>
            </div>

            <div class="inner-position">
                <h2>Sửa menu</h2>
                <div class="position-right">
                    <a href="intro.jsp">Trang chủ /</a>
                    <p>Menu</p>
                </div>
            </div>

            <div class="content">
                <div class="container">
                    <div class="form-header">
                        <button class="btn-save"><i class="fa fa-save"></i> Lưu</button>
                        <button class="btn-back">
                            <a href="menu_admin.jsp" style="text-decoration: none;color: #fff;">
                                <i class="fa fa-arrow-left"></i> Về danh sách
                            </a>
                        </button>
                    </div>

                    <form action="#" method="post">
                        <div class="form-grid">
                            <div>
                                <div class="form-group">
                                    <label for="name">Tên menu</label>
                                    <input type="text" id="name" name="name" placeholder="Nhập tên menu">
                                </div>

                                <div class="form-group">
                                    <label for="slug">Liên kết</label>
                                    <input type="text" id="slug" name="slug" placeholder="Nhập liên kết">
                                </div>

                                <div class="form-group">
                                    <label for="father">Menu cha</label>
                                    <input type="number" id="father" name="father" placeholder="Nhập số menu cha">
                                </div>

                                <div class="form-group">
                                    <label for="vitri">Vị trí</label>
                                    <input type="number" id="vitri" name="vitri" placeholder="Nhập vị trí">
                                </div>
                            </div>

                            <div>
                                <div class="form-group">
                                    <label for="category">Loại</label>
                                    <select id="category" name="category">
                                        <option>custom</option>
                                        <option>chinh-sach</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="table">Bảng</label>
                                    <select id="table" name="table">
                                        <option>mainmenu</option>
                                        <option>footmenu</option>
                                    </select>
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
