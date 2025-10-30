<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>html Page</title>

        <!-- ✅ Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />

        <!-- ✅ CSS từ thư mục static -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/stylelogin.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ascesss/css/formchuan.css" />

        <!-- ✅ JS -->
        <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>

        <style>
            .navbar_right {
                margin-top: -3px;
                justify-content: center;
                align-items: center;
            }

            /* Nút trong form đăng nhập */
            .login-container .btn {
                transition: background 0.3s ease, transform 0.2s ease;
            }

            .login-container .btn:hover {
                transform: translateY(-3px);
            }

            .login-container .btn {
                color: #fff;
                border: none;
                border-radius: 30px;
                padding: 10px 25px;
                font-weight: 500;
                cursor: pointer;
            }

            .btn.qr-login {
                background: linear-gradient(135deg, #8D6E63, #6D4C41);
            }

            .btn.qr-login:hover {
                background: linear-gradient(135deg, #5D4037, #4E342E);
            }

            /* Face ID Login: Thu */
            .btn.faceid-login {
                background: linear-gradient(135deg, #A1887F, #8D6E63);
            }

            .btn.faceid-login:hover {
                background: linear-gradient(135deg, #6D4C41, #5D4037);
            }

            /* Chụp ảnh: Crystal Silver */
            #snap {
                background: linear-gradient(135deg, #D7CCC8, #BCAAA4);
                color: #3E2723;
            }

            #snap:hover {
                background: linear-gradient(135deg, #BCAAA4, #A1887F);
            }

            /* Gửi đăng nhập FaceID: Crystal Steel */
            #login-faceid {
                background: linear-gradient(135deg, #8D6E63, #6D4C41);
            }

            #login-faceid:hover {
                background: linear-gradient(135deg, #5D4037, #4E342E);
            }
            .btn.login {
                background: linear-gradient(135deg, #6D4C41, #5D4037);
            }
            .btn.login:hover {
                background: linear-gradient(135deg, #4E342E, #3E2723);
            }

        </style>

        <!-- ✅ Icon & Font Awesome 6.7.2 (phiên bản mới hơn) -->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
              crossorigin="anonymous"
              referrerpolicy="no-referrer" />

    </head>


    <body>

        <!-- Header -->
        <jsp:include page="/partials/header.jsp" />

        <div class="container">
            <div class="login-container">
                <h2>Đăng nhập</h2>

                <!-- Đăng nhập QR -->
                <button type="button" class="btn qr-login" id="qr-login-btn">
                    <i class="fa-solid fa-qrcode"></i> Đăng nhập bằng mã QR
                </button>

                <!-- Đăng nhập FaceID -->
                <button type="button" class="btn faceid-login" id="faceid-login-btn">
                    <i class="fa-solid fa-face-smile"></i> Đăng nhập bằng Face ID
                </button>

                <!-- KHU VỰC FaceID -->
                <div id="faceid-section" style="display: none; margin-top: 20px;">
                    <label>Email:</label>
                    <input type="email" id="faceid-email" placeholder="Nhập email đã đăng ký">

                    <br><br>

                    <video id="video" width="320" height="240" autoplay style="border: 1px solid #000;"></video>
                    <br>
                    <button id="snap" class="btn">Chụp ảnh</button>
                    <canvas id="canvas" width="320" height="240" style="display:none; border:1px solid #000;"></canvas>

                    <br><br>
                    <button id="login-faceid" class="btn">Gửi đăng nhập Face ID</button>

                    <p id="faceid-status"></p>
                </div>

                <!-- Khung QR -->
                <div id="qr-reader" style="width:300px; display:none; margin-top:20px;"></div>

                <!-- Form đăng nhập -->
                <form action="${pageContext.request.contextPath}/login_intro" method="post">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="ex. name@gmail.com" required>

                    <label for="password">
                        Mật khẩu
                        <a href="${pageContext.request.contextPath}/forgot_password">Quên mật khẩu?</a>
                    </label>
                    <input type="password" id="password" name="password" placeholder="******" required>

                    <div class="remember">
                        <input type="checkbox" id="remember">
                        <label for="remember">Ghi nhớ</label>
                    </div>

                    <button type="submit" class="btn login">Đăng nhập</button>
                </form>

                <p class="register">
                    Bạn chưa có tài khoản ?
                    <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
                </p>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-container">
                <div class="footer-left">
                    <h3>Nhà hàng Lẩu Hột Ty Hưu Trung Thạnh</h3>
                    <p>Nhà hàng chuyên về các món lẩu ngon nhất tại Thành phố Hải Phòng, chuyên về các món ăn chuẩn hương vị
                        thuần Việt.</p>
                    <p>Thực phẩm tươi sống là yếu tố hàng đầu trong việc chế biến món ăn, Quy Khắc chắc chắn sẽ làm hài lòng
                        quý khách với những món ăn đậm đà hương vị.</p>
                </div>
                <div class="footer-right">
                    <h3>Thông tin liên hệ</h3>
                    <p><i class="fas fa-map-marker-alt"></i> Địa chỉ: Hà Đông, Hà Nội</p>
                    <p><i class="fas fa-phone"></i> Điện thoại: 0999999999</p>
                    <p><i class="fas fa-envelope"></i> Email: dabc@gmail.com</p>
                    <button class="footer-book-now">Đặt bàn ngay</button>
                    <div class="footer-social">
                        <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                        <a href="tel:0999999999"><i class="fas fa-phone"></i></a>
                        <a href="https://www.pinterest.com/" target="_blank"><i class="fab fa-pinterest-p"></i></a>
                        <a href="https://plus.google.com/" target="_blank"><i class="fab fa-google-plus-g"></i></a>
                    </div>
                </div>
            </div>
        </footer>

        <% if (request.getAttribute("error") != null) {%>
        <div id="toast-err" class="toast-err"><%= request.getAttribute("error")%></div>
        <% }%>

        <style>
            .toast-err {
                position: fixed;
                top: 30px;
                right: 30px;
                display: flex;
                align-items: center;
                gap: 12px;
                background: linear-gradient(135deg, #222215, #d72405);
                color: #fff;
                padding: 16px 28px;
                border-radius: 20px 5px 20px 5px;
                box-shadow: 0 12px 30px rgba(141, 85, 85, 0.25);
                z-index: 9999;
                opacity: 1;
                transform: translateX(0);
                transition: transform 1.5s ease-in-out, opacity 1.5s ease-in-out;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                font-size: 16px;
                backdrop-filter: blur(4px);
                border: 1px solid rgba(255, 255, 255, 0.3);
            }
        </style>
        <!-- Thông báo lỗi ẩn tự động -->
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                const toast = document.getElementById('toast-err');
                if (toast) {
                    setTimeout(() => {
                        toast.style.transform = 'translateX(120%)';
                        toast.style.opacity = '0';
                    }, 3000);
                }
            });
        </script>

        <!-- Thư viện quét QR -->
        <script src="https://unpkg.com/html5-qrcode"></script>

        <script>
            const qrLoginBtn = document.getElementById('qr-login-btn');
            const qrReader = document.getElementById('qr-reader');

            qrLoginBtn.addEventListener('click', () => {
                qrReader.style.display = 'block';
                const html5QrCode = new Html5Qrcode("qr-reader");

                html5QrCode.start(
                        {facingMode: "environment"},
                        {fps: 10, qrbox: 250},
                        (decodedText) => {
                    fetch("<%= request.getContextPath()%>/login-qr", {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({code: decodedText})
                    })
                            .then(res => res.json())
                            .then(data => {
                                if (data.success) {
                                    window.location.href = "<%= request.getContextPath()%>/login_intro_face";
                                } else {
                                    showToast(data.message || 'Mã QR không hợp lệ!');
                                }
                            })
                            .catch(err => {
                                console.error(err);
                                showToast("Lỗi quét mã QR!");
                            });

                    html5QrCode.stop();
                },
                        (err) => {
                    // Không xử lý lỗi đọc camera
                }
                );
            });
        </script>

        <!-- Chức năng FaceID -->
        <script>
            // --- Hàm hiển thị thông báo ---
            function showToast(message) {
                const toast = document.createElement('div');
                toast.className = 'toast';
                toast.textContent = message;

                // Chỉ tô màu đỏ nếu có từ 'lỗi' hoặc 'không'
                if (message.toLowerCase().includes("lỗi") || message.toLowerCase().includes("không")) {
                    toast.style.background = 'linear-gradient(135deg, #f44336, #e91e63)';
                }

                document.body.appendChild(toast);

                setTimeout(() => {
                    toast.style.transform = 'translateX(120%)';
                    toast.style.opacity = '0';
                }, 2500);

                setTimeout(() => {
                    toast.remove();
                }, 4000);
            }

            const faceIdBtn = document.getElementById('faceid-login-btn');
            const faceIdSection = document.getElementById('faceid-section');
            const video = document.getElementById('video');
            const snapBtn = document.getElementById('snap');
            const canvas = document.getElementById('canvas');
            const loginFaceIdBtn = document.getElementById('login-faceid');

            // Bật webcam
            faceIdBtn.onclick = () => {
                faceIdSection.style.display = 'block';
                navigator.mediaDevices.getUserMedia({video: true})
                        .then(stream => {
                            video.srcObject = stream;
                        })
                        .catch(err => {
                            console.error("Lỗi webcam:", err);
                            showToast("Không thể bật webcam!");
                        });
            };

            // Chụp ảnh
            snapBtn.onclick = () => {
                const ctx = canvas.getContext('2d');
                ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
                canvas.style.display = 'block';
            };

            // Gửi ảnh FaceID
            loginFaceIdBtn.onclick = () => {
                const email = document.getElementById('faceid-email').value.trim();

                if (!email) {
                    showToast("Vui lòng nhập email!");
                    return;
                }

                if (canvas.style.display === 'none') {
                    showToast("Bạn chưa chụp ảnh!");
                    return;
                }

                const dataURL = canvas.toDataURL('image/jpeg');

                fetch("<%= request.getContextPath()%>/login-faceid", {
                    method: 'POST',
                    headers: {'Content-Type': 'application/json'},
                    body: JSON.stringify({email: email, image: dataURL})
                })
                        .then(res => res.json())
                        .then(data => {
                            if (data.success) {
                                if (video.srcObject) {
                                    video.srcObject.getTracks().forEach(track => track.stop());
                                }
                                window.location.href = "<%= request.getContextPath()%>/login_intro_face";
                            } else {

                                showToast(data.message);
                            }
                        })
                        .catch(err => {
                            console.error(err);
                            showToast("Lỗi gửi dữ liệu!");
                        });
            };
        </script>
        <!-- Thông báo -->
        <%-- Nếu có thông báo thành công --%>
        <!--    <c:if test="${not empty success}">
                <div id="toast" class="toast">${success}</div>
            </c:if>-->


        <style>
            .toast {
                position: fixed;
                top: 30px;
                right: 30px;
                display: flex;
                align-items: center;
                gap: 12px;
                background: linear-gradient(135deg, #0050c8, #43a047);
                color: #fff;
                padding: 16px 28px;
                border-radius: 20px 5px 20px 5px;
                box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
                z-index: 9999;
                opacity: 1;
                transform: translateX(0);
                transition: transform 1.5s ease-in-out, opacity 1.5s ease-in-out;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                font-size: 16px;
                backdrop-filter: blur(4px);
                border: 1px solid rgba(255, 255, 255, 0.3);
            }

            .toast i {
                font-size: 18px;
            }
        </style>

        <script>
            window.addEventListener('DOMContentLoaded', () => {
                const toast = document.getElementById('toast');
                if (toast) {
                    setTimeout(() => {
                        toast.style.transform = 'translateX(120%)';
                        toast.style.opacity = '0';
                    }, 3000);
                }
            });
        </script>

        <!-- Import file JS -->
        <script src="<%= request.getContextPath()%>/static/CssTotal/jslogin.js"></script>

        <!-- Script tư vấn -->
        <script src="<%= request.getContextPath()%>/static/js/tuvan.js"></script>

        <script>
            // Lấy email người dùng từ session JSP
            const userEmail = "<%= (session.getAttribute("user_email") != null) ? session.getAttribute("user_email") : ""%>";

            document.addEventListener("DOMContentLoaded", function () {
                if (!userEmail || userEmail === "null" || userEmail === "") {
                    const allLinks = document.querySelectorAll("a");

                    allLinks.forEach(link => {
                        if (
                                !link.href.includes("/login") &&
                                !link.href.includes("/register") &&
                                !link.href.includes("/forgot_password")
                                ) {
                            link.addEventListener("click", function (e) {
                                e.preventDefault();
                                alert("Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục!");
                                window.location.href = "<%= request.getContextPath()%>/login";
                            });
                        }
                    });

                    const bookBtn = document.querySelector(".button_form");
                    if (bookBtn) {
                        bookBtn.addEventListener("click", function (e) {
                            e.preventDefault();
                            alert("Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục!");
                            window.location.href = "<%= request.getContextPath()%>/login";
                        });
                    }
                }
            });
        </script>



    </body>

</html>