
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang qu?n tr?</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../static/CssTotal/standard_admin.css"/>
        <link rel="stylesheet" href="../static/CssTotal/article_admin.css"/>
    </head>
    <body>
       <aside class="sidebar" id="sidebar">
            <div class="brand"><i class="fas fa-smile"></i> <span style="font-style: italic; font-weight: 600;">AdminLTE 4</span></div>
            <ul>
                <li><a href="order_admin.html"><i class="fas fa-shopping-bag"></i>&nbsp; ??n h�ng</a></li>
                <li><a href="booking_admin.html"><i class="fas fa-clipboard-list"></i>&nbsp; ??t b�n</a></li>
                <li><a href="consultant_admin.html"><i class="fas fa-comment-dots"></i>&nbsp; T? v?n</a></li>
                <li><a href="contact_admin.html"><i class="fas fa-phone"></i>&nbsp; Li�n h?</a></li>
                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-utensils"></i>&nbsp; M�n ?n <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="dish_admin.html" class="active">T?t c? m�n ?n</a></li>
                        <li><a href="dish2_admin.html">Danh m?c</a></li>
                        <li><a href="dish3_admin.html">Th??ng hi?u</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-newspaper"></i>&nbsp; B�i vi?t <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="article_admin.html" class="active">T?t c? b�i vi?t</a></li>
                        <li><a href="theme_admin.html">Ch? ??</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-warehouse"></i>&nbsp; Qu?n l� kho <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="#" class="active">Th?c ph?m ?�ng l?nh</a></li>
                        <li><a href="#">?? t??i</a></li>
                        <li><a href="#">Pha ch?</a></li>
                        <li><a href="storage4_admin.html">?? kh�</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-palette"></i>&nbsp; Giao di?n <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="menu_admin.html" class="active">Menu</a></li>
                        <li><a href="banner_admin.html">Banner</a></li>
                        <li><a href="library_admin.html">Th? vi?n ?nh</a></li>
                        <li><a href="keyword_admin.html">T? kh�a</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="submenu-toggle"><i class="fas fa-users"></i>&nbsp; Th�nh Vi�n <i class="fas fa-angle-left" style="margin-left:auto"></i></a>
                    <ul class="submenu">
                        <li><a href="member_admin.html" class="active">T?t c? th�nh vi�n</a></li>
                        <li><a href="#">Th�m th�nh vi�n</a></li>
                        <li><a href="staff_admin.html">Nh�n vi�n</a></li>
                    </ul>
                </li>

            </ul>
        </aside>

        <div class="main" id="main">
            <div class="navbar">
                <div class="navbar-title">
                    <button id="toggleSidebar"><i class="fas fa-bars"></i></button>
                    <a href="admin.html">Trang ch?</a>
                    <a href="contact.html">Li�n h?</a>
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
                        <a href="intro.html"><i class="fas fa-power-off"></i> Tho�t</a>
                    </div>
                </div>
            </div>
            <div class="inner-position">
                <h2>Qu?n l� b�i vi?t</h2>
                <div class="position-right">
                    <a href="intro.html">Trang ch? /</a>
                    <p>B�i vi?t</p>
                </div>
            </div>
            <div class="content">
                <div class="post-container">
                <div class="filter-section">
                    <label>L?c theo:</label>
                    <input type="text" placeholder="Nh?p ti�u ??...">
                    <button class="btn-search"><i class="fa fa-search"></i> T�m ki?m</button>
                    <div class="action-buttons">
                        <button class="btn btn-green">
                            <a href="add_article_admin.html" style="text-decoration: none;color: #fff;">
                                <i class="fa fa-plus"></i> Th�m
                            </a>
                            </button>
                        <button class="btn btn-red">
                            <a href="bin_article_admin.html" style="text-decoration: none;color: #fff;">
                                <i class="fa fa-trash"></i> Th�ng r�c
                            </a>
                        </button>
                    </div>
                </div>
                <div class="table-section">
                <table class="post-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>H�nh</th>
                            <th>Ti�u ??</th>
                            <th>M� t?</th>
                            <th>Ch? ??</th>
                            <th>Lo?i</th>
                            <th>Ki?u</th>
                            <th>Ch?c n?ng</th>
                            <th>ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td><img src="../static/avatars/media/1.jpg" alt="img1"></td>
                            <td>C�ch l�m g� ? mu?i hoa ti�u th?m ngon ?�ng v?</td>
                            <td>G� ? mu?i c� nhi?u c�ch l�m kh�c nhau, t�y v�o tay m?i ??u b?p...</td>
                            <td>C�ng th?c n?u ?n</td>
                            <td>post</td>
                            <td style="min-width: 110px;"><span class="label-new">B�i vi?t m?i</span></td>
                            <td style="min-width: 210px;">
                                <button class="btn btn-green" title="Tr?ng th�i"><i class="fa fa-circle"></i></button>
                                <button class="btn btn-eye" title="Xem">
                                    <a href="detail_article_admin.html" style="text-decoration: none;color: #fff;">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                    </button>
                                <button class="btn btn-blue" title="S?a">
                                    <a href="edit_article_admin.html" style="text-decoration: none;color: #fff;">
                                        <i class="fa fa-pen"></i>
                                    </a>
                                    </button>
                                <button class="btn btn-red" title="X�a"><i class="fa fa-trash"></i></button>
                                
                            </td>
                            <td>7</td>
                        </tr>
                        <!-- Th�m nhi?u d�ng t??ng t? -->
                    </tbody>
                </table>
            </div>
            </div>
            </div>
        </div>
</body>
    <script src="../static/CssTotal/standard_admin.js"></script>
</html>

