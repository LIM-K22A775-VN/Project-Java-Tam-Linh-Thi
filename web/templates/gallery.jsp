<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thư Viện Ảnh</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/stylegallery.css' />" />
    <link rel="stylesheet" href="<c:url value='/static/CssTotal/standard.css' />" />
    <script src="<c:url value='/static/CssTotal/standard.js' />"></script>

    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }
    </style>

    <!-- CSS Form chuẩn -->
    <link rel="stylesheet" href="<c:url value='/static/ascesss/css/formchuan.css' />" />
</head>

<body>
    <!-- Header -->
    <jsp:include page="/partials/header.jsp" />
    <!-- Vị trí / Breadcrumb -->
    <jsp:include page="/partials/vitri.jsp" />

    <div class="container">
        <section class="gallery">
            <h2>Thư Viện Ảnh</h2>
            <div class="gallery-grid">
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/1.jpg' />" alt="Ảnh 1"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/2.jpg' />" alt="Ảnh 2"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/3.jpg' />" alt="Ảnh 3"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/4.jpg' />" alt="Ảnh 4"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/5.jpg' />" alt="Ảnh 5"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/6.jpg' />" alt="Ảnh 6"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/anh1.jpg' />" alt="Ảnh 7"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/anh2.jpg' />" alt="Ảnh 8"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/anh3.jpg' />" alt="Ảnh 9"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/anh4.jpg' />" alt="Ảnh 10"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/anh1.jpg' />" alt="Ảnh 11"></div>
                <div class="gallery-item"><img src="<c:url value='/static/avatars/media/anh2.jpg' />" alt="Ảnh 12"></div>
            </div>
        </section>  
    </div>

    <!-- Footer -->
    <jsp:include page="/partials/footer.jsp" />

    <!-- Script tư vấn -->
    <script src="<c:url value='/static/js/tuvan.js' />"></script>

    <script>
        var userEmail = '<c:out value="${sessionScope.user_email}" />';
    </script>
    <script src="<c:url value='/static/CssTotal/script.js' />"></script>

</body>
</html>
