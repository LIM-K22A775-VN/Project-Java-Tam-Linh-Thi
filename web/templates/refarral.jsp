<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="vi">
 <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>The Bag House - Boutique Túi Xách Thời Trang</title>
  <script src="/_sdk/element_sdk.js"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body {
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }
        
        .hero-gradient {
            background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 50%, #bae6fd 100%);
            position: relative;
            overflow: hidden;
        }
        
        .hero-gradient::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%230ea5e9' fill-opacity='0.03'%3E%3Ccircle cx='30' cy='30' r='4'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        }
        
        .card-hover {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(14, 165, 233, 0.1);
        }
        
        .card-hover:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 20px 40px rgba(14, 165, 233, 0.15), 0 0 0 1px rgba(14, 165, 233, 0.2);
        }
        
        .bag-icon {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            filter: drop-shadow(0 4px 8px rgba(14, 165, 233, 0.2));
        }
        
        .bag-icon:hover {
            transform: scale(1.1);
            filter: drop-shadow(0 8px 16px rgba(14, 165, 233, 0.3));
        }
        
        .section-divider {
            background: linear-gradient(90deg, transparent, rgba(14, 165, 233, 0.6), transparent);
            height: 2px;
            margin: 4rem 0;
            border-radius: 2px;
            position: relative;
        }
        
        .section-divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 8px;
            height: 8px;
            background: #0ea5e9;
            border-radius: 50%;
            box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.2);
        }
        
        .premium-button {
            background: linear-gradient(135deg, #0ea5e9 0%, #38bdf8 50%, #0ea5e9 100%);
            background-size: 200% 200%;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(14, 165, 233, 0.3);
        }
        
        .premium-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s;
        }
        
        .premium-button:hover {
            background-position: 100% 100%;
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(14, 165, 233, 0.4);
        }
        
        .premium-button:hover::before {
            left: 100%;
        }
        
        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .text-gradient {
            background: linear-gradient(135deg, #0369a1, #0ea5e9);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .floating-animation {
            animation: float 6s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-8px); }
        }
        
        .luxury-shadow {
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.08), 0 0 0 1px rgba(108, 117, 125, 0.1);
        }
        
        .nav-link {
            position: relative;
            transition: all 0.3s ease;
        }
        
        .nav-link::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #0ea5e9, #38bdf8);
            transition: width 0.3s ease;
        }
        
        .nav-link:hover::after {
            width: 100%;
        }
        
        .product-card {
            background: linear-gradient(145deg, #ffffff 0%, #f8f9fa 100%);
            border-radius: 16px;
            overflow: hidden;
            position: relative;
        }
        
        .product-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(145deg, transparent 0%, rgba(108, 117, 125, 0.05) 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .product-card:hover::before {
            opacity: 1;
        }
        
        .icon-gradient {
            background: linear-gradient(135deg, #0369a1, #0ea5e9);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .ocean-accent {
            color: #0ea5e9;
        }
        
        .ocean-bg {
            background-color: #f0f9ff;
        }
    </style>
  <style>@view-transition { navigation: auto; }</style>
      <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/stylecontact.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ascesss/css/formchuan.css" />

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>

    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }

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
            z-index: 9999999999;
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
  <script src="/_sdk/data_sdk.js" type="text/javascript"></script>
 </head>
 <body class="min-h-full ocean-bg">
  <main class="min-h-full"><!-- Header Navigation -->
   <!-- Header -->
    <jsp:include page="/partials/header.jsp" />
    <jsp:include page="/partials/vitri.jsp" />
   <section id="home" class="hero-gradient py-20 relative">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center relative z-10">
     <div class="mb-10">
      <div class="relative inline-block">
       <svg class="w-16 h-16 mx-auto ocean-accent bag-icon" fill="currentColor" viewbox="0 0 24 24"><path d="M19 7h-3V6a4 4 0 0 0-8 0v1H5a1 1 0 0 0-1 1v11a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V8a1 1 0 0 0-1-1zM10 6a2 2 0 0 1 4 0v1h-4V6zm8 13a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9h2v1a1 1 0 0 0 2 0V9h4v1a1 1 0 0 0 2 0V9h2v10z" />
       </svg>
      </div>
     </div>
     <h2 id="hero-title" class="text-4xl md:text-6xl font-bold text-gray-800 mb-6 leading-tight">Khám phá Bộ Sưu Tập<br><span class="text-gradient">Túi Xách Thời Trang</span><br>
       Hiện Đại</h2>
     <div class="max-w-2xl mx-auto mb-8">
      <div class="h-px bg-gradient-to-r from-transparent via-gray-400 to-transparent mb-6"></div>
      <p id="hero-quote" class="text-xl text-gray-600 italic leading-relaxed">"Túi xách không chỉ là phụ kiện, mà còn là tuyên ngôn phong cách của bạn."</p>
      <div class="h-px bg-gradient-to-r from-transparent via-gray-400 to-transparent mt-6"></div>
     </div>
     <p id="welcome-text" class="text-lg text-gray-700 mb-10 max-w-4xl mx-auto leading-relaxed">Chào mừng bạn đến với The Bag House — thương hiệu chuyên về túi xách thời trang cao cấp, nơi kết hợp giữa thiết kế tinh tế và chất liệu bền bỉ. Mỗi chiếc túi là một câu chuyện về sự tự tin, phong cách và cá tính riêng biệt.</p>
     <div class="flex flex-col sm:flex-row gap-4 justify-center items-center"><button class="premium-button text-white px-8 py-3 rounded-full font-semibold text-lg"> Khám phá ngay </button> <button class="bg-transparent border-2 border-sky-400 text-sky-700 px-8 py-3 rounded-full font-semibold text-lg hover:bg-sky-50 transition-all duration-300"> Xem bộ sưu tập </button>
     </div>
    </div>
   </section><!-- Mission & Quality Section -->
   <section id="about" class="py-16 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
     <div class="grid md:grid-cols-2 gap-12 items-center">
      <div>
       <h3 class="text-3xl font-bold text-gray-800 mb-6 flex items-center">
        <svg class="w-8 h-8 ocean-accent mr-3" fill="currentColor" viewbox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
        </svg> Sứ mệnh &amp; Chất lượng</h3>
       <p class="text-gray-600 leading-relaxed mb-6">Chúng tôi đặt chất lượng lên hàng đầu — từ da thật nhập khẩu, đường may tỉ mỉ, đến phụ kiện kim loại cao cấp. Mỗi sản phẩm đều được chế tác với niềm đam mê và khát vọng mang đến cho khách hàng sự sang trọng, tinh tế và bền vững theo thời gian.</p>
      </div>
      <div>
       <h3 class="text-3xl font-bold text-gray-800 mb-6 flex items-center">
        <svg class="w-8 h-8 ocean-accent mr-3" fill="currentColor" viewbox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" />
        </svg> Phong cách &amp; Dịch vụ</h3>
       <p class="text-gray-600 leading-relaxed mb-6">Bộ sưu tập đa dạng từ túi xách tay, túi đeo chéo, túi công sở đến túi mini thời thượng. Không gian mua sắm của chúng tôi được thiết kế theo phong cách hiện đại, cùng đội ngũ tư vấn viên thân thiện, sẵn sàng giúp bạn chọn được chiếc túi phù hợp nhất.</p>
      </div>
     </div>
    </div>
   </section>
   <div class="section-divider"></div><!-- Featured Collection -->
   <section id="collection" class="py-16 ocean-bg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
     <div class="text-center mb-12">
      <h3 id="collection-title" class="text-4xl font-bold text-gray-800 mb-4">Bộ Sưu Tập Nổi Bật</h3>
      <p class="text-xl text-gray-600 italic">"Mỗi chiếc túi là một điểm nhấn hoàn hảo cho phong cách của bạn."</p>
     </div>
     <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8"><!-- Classic Handbag -->
      <div class="product-card card-hover luxury-shadow">
       <div class="h-64 bg-gradient-to-br from-sky-50 to-sky-100 flex items-center justify-center relative overflow-hidden">
        <svg class="w-24 h-24 text-sky-600 floating-animation" fill="currentColor" viewbox="0 0 24 24"><path d="M19 7h-3V6a4 4 0 0 0-8 0v1H5a1 1 0 0 0-1 1v11a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V8a1 1 0 0 0-1-1zM10 6a2 2 0 0 1 4 0v1h-4V6zm8 13a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9h2v1a1 1 0 0 0 2 0V9h4v1a1 1 0 0 0 2 0V9h2v10z" />
        </svg>
        <div class="absolute top-4 right-4 bg-sky-600 text-white px-3 py-1 rounded-full text-xs font-semibold">
         Bestseller
        </div>
       </div>
       <div class="p-6">
        <h4 class="text-xl font-bold text-gray-800 mb-3">Túi Xách Tay Da Thật Classic</h4>
        <p class="text-gray-600 text-sm leading-relaxed mb-4">Được làm từ da bò thật 100%, kiểu dáng thanh lịch và tinh tế phù hợp cho các buổi gặp gỡ, sự kiện hoặc đi làm.</p>
        <div class="flex items-center justify-between"><span class="text-2xl font-bold text-gradient">2.890.000₫</span> <button class="bg-sky-100 hover:bg-sky-200 text-sky-800 px-4 py-2 rounded-lg text-sm font-semibold transition-colors"> Xem chi tiết </button>
        </div>
       </div>
      </div><!-- Korean Style Crossbody -->
      <div class="product-card card-hover luxury-shadow">
       <div class="h-64 bg-gradient-to-br from-cyan-50 to-cyan-100 flex items-center justify-center relative overflow-hidden">
        <svg class="w-24 h-24 text-cyan-600 floating-animation" fill="currentColor" viewbox="0 0 24 24" style="animation-delay: 1s;"><path d="M16 6l2.29 2.29-4.88 4.88-4-4L2 16.59 3.41 18l6-6 4 4 6.3-6.29L22 12V6h-6z" />
        </svg>
        <div class="absolute top-4 right-4 bg-cyan-600 text-white px-3 py-1 rounded-full text-xs font-semibold">
         Trending
        </div>
       </div>
       <div class="p-6">
        <h4 class="text-xl font-bold text-gray-800 mb-3">Túi Đeo Chéo Phong Cách Hàn Quốc</h4>
        <p class="text-gray-600 text-sm leading-relaxed mb-4">Với kiểu dáng nhỏ gọn, thời trang, chiếc túi này phù hợp cho những cô nàng năng động. Thiết kế Hàn Quốc hiện đại.</p>
        <div class="flex items-center justify-between"><span class="text-2xl font-bold text-gradient">1.590.000₫</span> <button class="bg-sky-100 hover:bg-sky-200 text-sky-800 px-4 py-2 rounded-lg text-sm font-semibold transition-colors"> Xem chi tiết </button>
        </div>
       </div>
      </div><!-- Canvas Tote -->
      <div class="product-card card-hover luxury-shadow">
       <div class="h-64 bg-gradient-to-br from-zinc-100 to-zinc-200 flex items-center justify-center relative overflow-hidden">
        <svg class="w-24 h-24 text-zinc-600 floating-animation" fill="currentColor" viewbox="0 0 24 24" style="animation-delay: 2s;"><path d="M7 4V2a1 1 0 0 1 2 0v2h6V2a1 1 0 0 1 2 0v2h1a3 3 0 0 1 3 3v12a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3V7a3 3 0 0 1 3-3h1zM6 6a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7a1 1 0 0 0-1-1H6z" />
        </svg>
        <div class="absolute top-4 right-4 bg-zinc-600 text-white px-3 py-1 rounded-full text-xs font-semibold">
         Eco-friendly
        </div>
       </div>
       <div class="p-6">
        <h4 class="text-xl font-bold text-gray-800 mb-3">Túi Tote Canvas Năng Động</h4>
        <p class="text-gray-600 text-sm leading-relaxed mb-4">Túi tote làm từ vải canvas cao cấp, thân thiện với môi trường, có thể dùng đi học, đi làm hay đi chơi.</p>
        <div class="flex items-center justify-between"><span class="text-2xl font-bold text-gradient">890.000₫</span> <button class="bg-sky-100 hover:bg-sky-200 text-sky-800 px-4 py-2 rounded-lg text-sm font-semibold transition-colors"> Xem chi tiết </button>
        </div>
       </div>
      </div><!-- Mini Evening Bag -->
      <div class="product-card card-hover luxury-shadow">
       <div class="h-64 bg-gradient-to-br from-stone-100 to-stone-200 flex items-center justify-center relative overflow-hidden">
        <svg class="w-24 h-24 text-stone-600 floating-animation" fill="currentColor" viewbox="0 0 24 24" style="animation-delay: 3s;"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
        </svg>
        <div class="absolute top-4 right-4 bg-stone-600 text-white px-3 py-1 rounded-full text-xs font-semibold">
         Limited
        </div>
       </div>
       <div class="p-6">
        <h4 class="text-xl font-bold text-gray-800 mb-3">Túi Mini Cầm Tay Dạ Tiệc</h4>
        <p class="text-gray-600 text-sm leading-relaxed mb-4">Chiếc túi mini nhỏ xinh, ánh kim lấp lánh, là lựa chọn hoàn hảo cho các buổi tiệc hoặc hẹn hò.</p>
        <div class="flex items-center justify-between"><span class="text-2xl font-bold text-gradient">3.290.000₫</span> <button class="bg-sky-100 hover:bg-sky-200 text-sky-800 px-4 py-2 rounded-lg text-sm font-semibold transition-colors"> Xem chi tiết </button>
        </div>
       </div>
      </div>
     </div>
    </div>
   </section><!-- Limited Edition Section -->
   <section class="py-16 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
     <div class="text-center mb-12">
      <h3 class="text-4xl font-bold text-gray-800 mb-4">Bộ Sưu Tập Mới &amp; Giới Hạn</h3>
      <p class="text-xl text-gray-600 italic">"Khám phá phong cách riêng chỉ dành cho bạn."</p>
     </div>
     <div class="bg-gradient-to-r from-gray-50 via-gray-100 to-gray-50 rounded-2xl p-8 md:p-12 luxury-shadow relative overflow-hidden">
      <div class="grid md:grid-cols-2 gap-12 items-center relative z-10">
       <div class="text-center md:text-left">
        <div class="relative inline-block mb-8">
         <div class="w-32 h-32 bg-gradient-to-br from-gray-200 via-gray-300 to-gray-400 rounded-full flex items-center justify-center luxury-shadow floating-animation">
          <svg class="w-16 h-16 text-gray-700" fill="currentColor" viewbox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
          </svg>
         </div>
         <div class="absolute -top-2 -right-2 bg-gray-600 text-white px-3 py-1 rounded-full text-xs font-bold">
          LIMITED
         </div>
        </div>
       </div>
       <div>
        <div class="mb-4"><span class="bg-gray-600 text-white px-4 py-2 rounded-full text-sm font-semibold uppercase tracking-wide"> Phiên bản giới hạn </span>
        </div>
        <h4 class="text-3xl font-bold text-gray-800 mb-6">Túi Xách Da Trơn<br><span class="text-gradient">Phiên Bản Giới Hạn</span></h4>
        <p class="text-gray-600 leading-relaxed mb-6">Sản phẩm nằm trong bộ sưu tập giới hạn, được thiết kế độc quyền với chất liệu da mềm mịn, kết hợp khóa kim loại ánh bạc sang trọng. Mỗi chi tiết đều thể hiện sự tinh tế và đẳng cấp.</p>
        <div class="flex flex-col sm:flex-row gap-4 items-start">
         <div class="text-left">
          <div class="text-3xl font-bold text-gradient mb-2">
           5.990.000₫
          </div>
          <div class="text-sm text-gray-500 line-through">
           7.500.000₫
          </div>
         </div><button class="premium-button text-white px-6 py-3 rounded-full font-semibold"> Đặt hàng ngay </button>
        </div>
        <div class="mt-6 flex items-center text-sm text-gray-600">
         <svg class="w-4 h-4 mr-2 silver-accent" fill="currentColor" viewbox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" />
         </svg> Chỉ còn 12 sản phẩm cuối cùng
        </div>
       </div>
      </div>
     </div>
    </div>
   </section><!-- Footer -->
   <footer class="bg-gray-800 text-white py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
     <div class="grid md:grid-cols-3 gap-8">
      <div>
       <div class="flex items-center space-x-2 mb-4">
        <svg class="w-8 h-8 text-gray-400" fill="currentColor" viewbox="0 0 24 24"><path d="M19 7h-3V6a4 4 0 0 0-8 0v1H5a1 1 0 0 0-1 1v11a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V8a1 1 0 0 0-1-1zM10 6a2 2 0 0 1 4 0v1h-4V6zm8 13a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V9h2v1a1 1 0 0 0 2 0V9h4v1a1 1 0 0 0 2 0V9h2v10z" />
        </svg>
        <h5 class="text-xl font-bold">The Bag House</h5>
       </div>
       <p class="text-gray-300">Thương hiệu túi xách thời trang cao cấp, mang đến phong cách và chất lượng tuyệt vời.</p>
      </div>
      <div>
       <h6 class="text-lg font-semibold mb-4">Liên kết nhanh</h6>
       <ul class="space-y-2 text-gray-300">
        <li><a href="#home" class="hover:text-gray-100 transition-colors">Trang chủ</a></li>
        <li><a href="#collection" class="hover:text-gray-100 transition-colors">Bộ sưu tập</a></li>
        <li><a href="#about" class="hover:text-gray-100 transition-colors">Về chúng tôi</a></li>
        <li><a href="#contact" class="hover:text-gray-100 transition-colors">Liên hệ</a></li>
       </ul>
      </div>
      <div>
       <h6 class="text-lg font-semibold mb-4">Theo dõi chúng tôi</h6>
       <div class="flex space-x-4"><a href="#" class="text-gray-300 hover:text-gray-100 transition-colors">
         <svg class="w-6 h-6" fill="currentColor" viewbox="0 0 24 24"><path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z" />
         </svg></a> <a href="#" class="text-gray-300 hover:text-gray-100 transition-colors">
         <svg class="w-6 h-6" fill="currentColor" viewbox="0 0 24 24"><path d="M22.46 6c-.77.35-1.6.58-2.46.69.88-.53 1.56-1.37 1.88-2.38-.83.5-1.75.85-2.72 1.05C18.37 4.5 17.26 4 16 4c-2.35 0-4.27 1.92-4.27 4.29 0 .34.04.67.11.98C8.28 9.09 5.11 7.38 3 4.79c-.37.63-.58 1.37-.58 2.15 0 1.49.75 2.81 1.91 3.56-.71 0-1.37-.2-1.95-.5v.03c0 2.08 1.48 3.82 3.44 4.21a4.22 4.22 0 0 1-1.93.07 4.28 4.28 0 0 0 4 2.98 8.521 8.521 0 0 1-5.33 1.84c-.34 0-.68-.02-1.02-.06C3.44 20.29 5.7 21 8.12 21 16 21 20.33 14.46 20.33 8.79c0-.19 0-.37-.01-.56.84-.6 1.56-1.36 2.14-2.23z" />
         </svg></a> <a href="#" class="text-gray-300 hover:text-gray-100 transition-colors">
         <svg class="w-6 h-6" fill="currentColor" viewbox="0 0 24 24"><path d="M12.017 0C5.396 0 .029 5.367.029 11.987c0 5.079 3.158 9.417 7.618 11.174-.105-.949-.199-2.403.041-3.439.219-.937 1.406-5.957 1.406-5.957s-.359-.72-.359-1.781c0-1.663.967-2.911 2.168-2.911 1.024 0 1.518.769 1.518 1.688 0 1.029-.653 2.567-.992 3.992-.285 1.193.6 2.165 1.775 2.165 2.128 0 3.768-2.245 3.768-5.487 0-2.861-2.063-4.869-5.008-4.869-3.41 0-5.409 2.562-5.409 5.199 0 1.033.394 2.143.889 2.741.099.12.112.225.085.345-.09.375-.293 1.199-.334 1.363-.053.225-.172.271-.402.165-1.495-.69-2.433-2.878-2.433-4.646 0-3.776 2.748-7.252 7.92-7.252 4.158 0 7.392 2.967 7.392 6.923 0 4.135-2.607 7.462-6.233 7.462-1.214 0-2.357-.629-2.75-1.378l-.748 2.853c-.271 1.043-1.002 2.35-1.492 3.146C9.57 23.812 10.763 24.009 12.017 24.009c6.624 0 11.99-5.367 11.99-11.988C24.007 5.367 18.641.001.012.001z" />
         </svg></a>
       </div>
      </div>
     </div>
     <div class="border-t border-gray-700 mt-8 pt-8 text-center text-gray-400">
      <p>© 2024 The Bag House. Tất cả quyền được bảo lưu.</p>
     </div>
    </div>
   </footer>
  </main>
  <script>
        const defaultConfig = {
            store_name: "The Bag House",
            hero_title: "Khám phá Bộ Sưu Tập Túi Xách Thời Trang Hiện Đại",
            hero_quote: "Túi xách không chỉ là phụ kiện, mà còn là tuyên ngôn phong cách của bạn.",
            welcome_text: "Chào mừng bạn đến với The Bag House — thương hiệu chuyên về túi xách thời trang cao cấp, nơi kết hợp giữa thiết kế tinh tế và chất liệu bền bỉ. Mỗi chiếc túi là một câu chuyện về sự tự tin, phong cách và cá tính riêng biệt.",
            collection_title: "Bộ Sưu Tập Nổi Bật",
            background_color: "#f8f9fa",
            surface_color: "#ffffff",
            text_color: "#1f2937",
            primary_action_color: "#6c757d",
            secondary_action_color: "#495057"
        };

        async function onConfigChange(config) {
            // Update text content
            const storeNameEl = document.getElementById('store-name');
            if (storeNameEl) storeNameEl.textContent = config.store_name || defaultConfig.store_name;

            const heroTitleEl = document.getElementById('hero-title');
            if (heroTitleEl) heroTitleEl.textContent = config.hero_title || defaultConfig.hero_title;

            const heroQuoteEl = document.getElementById('hero-quote');
            if (heroQuoteEl) heroQuoteEl.textContent = `"${config.hero_quote || defaultConfig.hero_quote}"`;

            const welcomeTextEl = document.getElementById('welcome-text');
            if (welcomeTextEl) welcomeTextEl.textContent = config.welcome_text || defaultConfig.welcome_text;

            const collectionTitleEl = document.getElementById('collection-title');
            if (collectionTitleEl) collectionTitleEl.textContent = config.collection_title || defaultConfig.collection_title;

            // Update colors
            const backgroundColor = config.background_color || defaultConfig.background_color;
            const surfaceColor = config.surface_color || defaultConfig.surface_color;
            const textColor = config.text_color || defaultConfig.text_color;
            const primaryActionColor = config.primary_action_color || defaultConfig.primary_action_color;
            const secondaryActionColor = config.secondary_action_color || defaultConfig.secondary_action_color;

            // Apply background color
            document.body.style.backgroundColor = backgroundColor;
            const heroSection = document.querySelector('.hero-gradient');
            if (heroSection) {
                heroSection.style.background = `linear-gradient(135deg, ${backgroundColor} 0%, ${surfaceColor} 100%)`;
            }

            // Apply surface color to cards and sections
            const cards = document.querySelectorAll('.bg-white');
            cards.forEach(card => {
                card.style.backgroundColor = surfaceColor;
            });

            // Apply text color
            const textElements = document.querySelectorAll('h1, h2, h3, h4, h5, h6, p, .text-gray-800, .text-gray-700, .text-gray-600');
            textElements.forEach(el => {
                el.style.color = textColor;
            });

            // Apply primary action color to buttons
            const primaryButtons = document.querySelectorAll('.premium-button');
            primaryButtons.forEach(btn => {
                btn.style.background = `linear-gradient(45deg, ${primaryActionColor}, ${primaryActionColor}dd)`;
            });

            // Apply secondary action color to links
            const links = document.querySelectorAll('a');
            links.forEach(link => {
                link.style.color = secondaryActionColor;
            });
        }

        function mapToCapabilities(config) {
            return {
                recolorables: [
                    {
                        get: () => config.background_color || defaultConfig.background_color,
                        set: (value) => {
                            if (window.elementSdk) {
                                window.elementSdk.setConfig({ background_color: value });
                            }
                        }
                    },
                    {
                        get: () => config.surface_color || defaultConfig.surface_color,
                        set: (value) => {
                            if (window.elementSdk) {
                                window.elementSdk.setConfig({ surface_color: value });
                            }
                        }
                    },
                    {
                        get: () => config.text_color || defaultConfig.text_color,
                        set: (value) => {
                            if (window.elementSdk) {
                                window.elementSdk.setConfig({ text_color: value });
                            }
                        }
                    },
                    {
                        get: () => config.primary_action_color || defaultConfig.primary_action_color,
                        set: (value) => {
                            if (window.elementSdk) {
                                window.elementSdk.setConfig({ primary_action_color: value });
                            }
                        }
                    },
                    {
                        get: () => config.secondary_action_color || defaultConfig.secondary_action_color,
                        set: (value) => {
                            if (window.elementSdk) {
                                window.elementSdk.setConfig({ secondary_action_color: value });
                            }
                        }
                    }
                ],
                borderables: [],
                fontEditable: undefined,
                fontSizeable: undefined
            };
        }

        function mapToEditPanelValues(config) {
            return new Map([
                ["store_name", config.store_name || defaultConfig.store_name],
                ["hero_title", config.hero_title || defaultConfig.hero_title],
                ["hero_quote", config.hero_quote || defaultConfig.hero_quote],
                ["welcome_text", config.welcome_text || defaultConfig.welcome_text],
                ["collection_title", config.collection_title || defaultConfig.collection_title]
            ]);
        }

        // Initialize Element SDK
        if (window.elementSdk) {
            window.elementSdk.init({
                defaultConfig,
                onConfigChange,
                mapToCapabilities,
                mapToEditPanelValues
            });
        }

        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Add scroll effect to header
        window.addEventListener('scroll', function() {
            const header = document.querySelector('header');
            if (window.scrollY > 100) {
                header.classList.add('shadow-lg');
            } else {
                header.classList.remove('shadow-lg');
            }
        });
    </script>
 <script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'9963480347938505',t:'MTc2MTc0NzI4Ny4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
<!-- Script tư vấn -->
    <script src="${pageContext.request.contextPath}/static/js/tuvan.js"></script>
    <script src="${pageContext.request.contextPath}/static/CssTotal/script.js"></script>

    <!-- Lấy email người dùng -->
    <script>
        const userEmail = "<c:out value='${sessionScope.user_email}'/>";
    </script>

    <!-- Thông báo -->
    <c:if test="${not empty success}">
        <div id="toast" class="toast">${success}</div>
    </c:if>

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
</html>