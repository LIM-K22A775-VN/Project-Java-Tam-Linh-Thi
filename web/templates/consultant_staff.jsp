<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&family=Poppins:wght@500;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/sidebar_staff.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/navbar_admin.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/partials/sidebar_staff.jsp" />
    <div class="main" id="main">
        <jsp:include page="/WEB-INF/views/partials/navbar_staff.jsp" />

        <div class="inner-position">
            <h2>Messenger</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>Tư vấn</p>
            </div>
        </div>

        <div class="container">
            <div class="chat-wrapper">

                <!-- Sidebar -->
                <div class="chat-sidebar">
                    <div class="sidebar-header">Khách hàng</div>
                    <div class="search-bar">
                        <input type="text" id="searchUser" placeholder="Tìm kiếm..." oninput="filterUsers()" />
                    </div>
                    <div class="filter-buttons">
                        <button class="active" onclick="filterUsers('all')">Tất cả</button>
                        <button onclick="filterUsers('unread')">Chưa đọc</button>
                    </div>
                    <div class="user-list" id="userList"></div>
                </div>

                <!-- Chat main -->
                <div class="chat-main">
                    <div class="chat-header">
                        <img class="avatar" id="chatAvatar">
                        <div class="name" id="chatName"></div>
                    </div>
                    <div class="chat-messages" id="chatMessages"></div>

                    <div class="chat-input">
                        <i class="fas fa-paperclip"></i>
                        <input type="text" id="chatInput" placeholder="Nhập tin nhắn..." />
                        <i class="fas fa-smile" id="emoji-btn"></i>
                        <button onclick="sendMessage()">Gửi</button>

                        <!-- Emoji picker -->
                        <div id="emoji-picker" style="
                            display: none;
                            position: absolute;
                            bottom: 60px;
                            right: 50px;
                            background: #fff;
                            border: 1px solid #ccc;
                            padding: 10px;
                            border-radius: 8px;
                            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
                            z-index: 10;
                        "></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
    const users = JSON.parse('${sidebar_customers}');
    const allMessages = JSON.parse('${messages}');
    let currentFilter = 'all';
    let currentCustomerId = null;

    function renderUserList(filteredUsers) {
        const list = document.getElementById("userList");
        list.innerHTML = "";
        filteredUsers.forEach(user => {
            const div = document.createElement("div");
            div.className = "user-item " + (user.unread ? "unread" : "");

            const img = document.createElement("img");
            img.className = "user-avatar";
            img.src = "${pageContext.request.contextPath}/static/avatars/" + user.avatar;
            img.alt = user.userName;

            const details = document.createElement("div");
            details.className = "user-details";

            const name = document.createElement("div");
            name.className = "user-name";
            const icon = document.createElement("i");
            icon.className = "fas fa-user";
            name.appendChild(icon);
            name.append(" " + user.userName);

            const lastMessage = document.createElement("div");
            lastMessage.className = "last-message";
            lastMessage.textContent = user.lastMessage || "";

            details.append(name, lastMessage);
            div.append(img, details);

            div.onclick = () => openChat(user);
            list.appendChild(div);
        });
    }

    function openChat(user) {
        currentCustomerId = user.IdUser;
        user.unread = false;
        document.getElementById("chatName").textContent = user.userName;
        document.getElementById("chatAvatar").src = "${pageContext.request.contextPath}/static/avatars/" + user.avatar;
        renderChatMessages();
        filterUsers();
    }

    function renderChatMessages() {
        const box = document.getElementById("chatMessages");
        box.innerHTML = "";
        allMessages
            .filter(m => m.IdSender === currentCustomerId || m.IdReceiver === currentCustomerId)
            .forEach(msg => {
                const div = document.createElement("div");
                // CHỖ NÀY ĐÃ SỬA
                div.className = "message " + (msg.IdSender !== currentCustomerId ? "staff" : "customer");
                div.textContent = msg.content;

                const time = document.createElement("div");
                time.className = "message-time";
                time.textContent = msg.time;

                div.appendChild(time);
                box.appendChild(div);
            });
        box.scrollTop = box.scrollHeight;
    }

    function sendMessage() {
        const input = document.getElementById("chatInput");
        const text = input.value.trim();
        if (text && currentCustomerId) {
            fetch("${pageContext.request.contextPath}/api/send_message", {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    receiver_id: currentCustomerId,
                    content: text
                })
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    allMessages.push({
                        IdSender: "STAFF_ID",
                        IdReceiver: currentCustomerId,
                        content: text,
                        time: new Date().toISOString().slice(0, 19).replace('T', ' ')
                    });
                    renderChatMessages();
                    input.value = "";
                } else {
                    alert("Gửi tin nhắn thất bại!");
                }
            })
            .catch(() => alert("Lỗi kết nối server"));
        }
    }

    function filterUsers(filterType = currentFilter) {
        currentFilter = filterType;
        const q = document.getElementById("searchUser").value.toLowerCase().trim();
        let filtered = filterType === 'unread' ? users.filter(u => u.unread) : users;
        if (q) filtered = filtered.filter(u => u.userName.toLowerCase().includes(q));
        renderUserList(filtered);
    }

    filterUsers();
</script>

<script>
    const emojiBtn = document.getElementById("emoji-btn");
    const emojiPicker = document.getElementById("emoji-picker");
    const chatInput = document.getElementById("chatInput");

    emojiBtn.addEventListener("click", () => {
        emojiPicker.style.display = emojiPicker.style.display === "block" ? "none" : "block";
    });

    const emojis = ["😀", "😁", "😂", "🤣", "😊", "😍", "😜", "👍", "❤️", "🔥"];
    emojis.forEach(e => {
        const span = document.createElement("span");
        span.textContent = e;
        span.style.cursor = "pointer";
        span.style.fontSize = "20px";
        span.style.margin = "5px";
        span.onclick = () => {
            chatInput.value += e;
            emojiPicker.style.display = "none";
            chatInput.focus();
        };
        emojiPicker.appendChild(span);
    });
</script>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const userInfo = document.getElementById("userInfo");
    const userDropdown = document.getElementById("userDropdown");
    if (userDropdown) userDropdown.style.display = "none";
    if (userInfo) {
        userInfo.addEventListener("click", function (e) {
            e.stopPropagation();
            userDropdown.style.display = userDropdown.style.display === "block" ? "none" : "block";
        });
    }
    window.addEventListener("click", function (e) {
        if (!userInfo.contains(e.target)) {
            userDropdown.style.display = "none";
        }
    });
});
</script>

</body>
</html>
