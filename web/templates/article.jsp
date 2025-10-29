<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi" class="h-full">
 <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Blog Túi Xách - Xu Hướng &amp; Phong Cách</title>
  <script src="/_sdk/element_sdk.js"></script>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
      
        body {
            box-sizing: border-box;
        }
        
        .clean-bg {
            background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
        }
        
        .sharp-card {
            background: white;
            border: 1px solid #e2e8f0;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
            transition: all 0.2s ease;
        }
        
        .sharp-card:hover {
            border-color: #cbd5e1;
            box-shadow: 0 4px 12px 0 rgba(0, 0, 0, 0.15);
        }
        
        .text-primary {
            color: #1e293b;
        }
        
        .text-secondary {
            color: #64748b;
        }
        
        .accent-blue {
            color: #3b82f6;
        }
        
        .sharp-image {
            filter: contrast(1.1) saturate(1.1);
        }
        
    </style>
  <style>@view-transition { navigation: auto; }
  
  </style>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/stylearticle.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard.css" />
    <script src="${pageContext.request.contextPath}/static/CssTotal/standard.js"></script>
    <style>
        .navbar_right {
            margin-top: -3px;
            justify-content: center;
            align-items: center;
        }

        .blog_item {
            margin-bottom: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s;
        }

        .blog_item:hover {
            transform: translateY(-5px);
        }

        .blog_item h3 {
            padding: 15px 20px 0;
            font-size: 20px;
            color: #333;
        }

        .blog_item img.post-img {
            width: 100%;
            display: block;
        }

        .blog_item p {
            padding: 10px 20px 20px;
            font-size: 16px;
            line-height: 1.6;
            color: #555;
        }

        .blog-main h2 {
            font-size: 28px;
            margin: 40px 0 20px;
            color: #222;
            position: relative;
        }

        .blog-main h2::after {
            content: '';
            width: 60px;
            height: 3px;
            background: #f05a28;
            display: block;
            margin-top: 8px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .page-btn {
            border: none;
            background: #f5f5f5;
            color: #333;
            padding: 8px 12px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 4px;
            transition: background 0.2s;
        }

        .page-btn.active,
        .page-btn:hover {
            background: #f05a28;
            color: #fff;
        }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ascesss/css/formchuan.css">

  <script src="/_sdk/data_sdk.js" type="text/javascript"></script>
 </head>
 <body class="h-full clean-bg"><!-- Header -->
  <%-- Header --%>
    <jsp:include page="/partials/header.jsp" />
    <jsp:include page="/partials/vitri.jsp" />

  <main class="max-w-6xl mx-auto px-6 py-8"><!-- Hero Section -->
   <section class="text-center mb-12">
    <h1 id="blog-title" class="text-4xl md:text-5xl font-bold text-primary mb-4">Blog Túi Xách</h1>
    <p id="blog-subtitle" class="text-lg text-secondary max-w-2xl mx-auto">Khám phá xu hướng, phong cách và những câu chuyện thú vị về thế giới túi xách hiện đại</p>
   </section><!-- Featured Article -->
   <section class="mb-16">
    <h2 id="featured-title" class="text-2xl font-bold text-primary mb-8">Bài Viết Nổi Bật</h2>
    <article class="sharp-card rounded-lg overflow-hidden">
     <div class="md:flex">
      <div class="md:w-1/2">
       <div class="p-8 h-full flex flex-col justify-center"><span class="text-sm font-medium accent-blue mb-2">XU HƯỚNG 2024</span>
        <h3 class="text-2xl font-bold text-primary mb-4">Túi Xách Tối Giản - Xu Hướng Không Bao Giờ Lỗi Thời</h3>
        <p class="text-secondary mb-6 leading-relaxed">Trong thế giới thời trang ngày càng phức tạp, phong cách tối giản (minimalism) đang trở thành xu hướng được yêu thích nhất. Các thiết kế túi xách đơn giản nhưng tinh tế không chỉ phù hợp với mọi trang phục mà còn thể hiện sự thanh lịch và hiện đại.</p>
        <div class="flex items-center justify-between">
         <div class="flex items-center space-x-3">
          <div class="w-8 h-8 bg-gray-200 rounded-full"></div>
          <div>
           <p class="text-sm font-medium text-primary">Mai Linh</p>
           <p class="text-xs text-secondary">Fashion Editor</p>
          </div>
         </div><span class="text-sm text-secondary">5 phút đọc</span>
        </div>
       </div>
      </div>
      <div class="md:w-1/2 p-8 flex items-center justify-center"><!-- Featured Handbag Image -->
       <svg viewbox="0 0 300 300" class="w-full h-auto max-w-sm sharp-image"><!-- Main bag body --> <rect x="75" y="120" width="150" height="120" rx="8" fill="#f8fafc" stroke="#e2e8f0" stroke-width="2" /> <!-- Handle --> <path d="M110 90 Q150 70 190 90 L190 120" fill="none" stroke="#64748b" stroke-width="4" stroke-linecap="round" /> <!-- Bag details --> <rect x="90" y="150" width="120" height="2" fill="#cbd5e1" /> <rect x="100" y="170" width="100" height="1" fill="#e2e8f0" /> <!-- Logo/Brand detail --> <circle cx="150" cy="190" r="8" fill="#f1f5f9" stroke="#cbd5e1" stroke-width="1" /> <rect x="146" y="186" width="8" height="8" fill="#94a3b8" /> <!-- Zipper --> <line x1="90" y1="135" x2="210" y2="135" stroke="#94a3b8" stroke-width="1" /> <!-- Shadow --> <ellipse cx="150" cy="250" rx="60" ry="8" fill="#e2e8f0" opacity="0.5" />
       </svg>
      </div>
     </div>
    </article>
   </section><!-- Latest Posts -->
   <section class="mb-16">
    <h2 id="latest-posts-title" class="text-2xl font-bold text-primary mb-8">Bài Viết Mới Nhất</h2>
    <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8"><!-- Article 1 -->
     <article class="sharp-card rounded-lg overflow-hidden">
      <div class="p-6">
       <div class="mb-4 flex justify-center"><!-- Crossbody Bag -->
        <svg viewbox="0 0 200 200" class="w-32 h-32 sharp-image"><rect x="60" y="80" width="80" height="60" rx="6" fill="#f8fafc" stroke="#e2e8f0" stroke-width="2" /> <path d="M40 60 Q100 40 160 80" fill="none" stroke="#64748b" stroke-width="3" stroke-linecap="round" /> <rect x="70" y="95" width="60" height="1" fill="#cbd5e1" /> <circle cx="100" cy="110" r="4" fill="#94a3b8" /> <ellipse cx="100" cy="150" rx="30" ry="4" fill="#e2e8f0" opacity="0.5" />
        </svg>
       </div><span class="text-xs font-medium accent-blue mb-2 block">PHONG CÁCH</span>
       <h3 class="text-lg font-bold text-primary mb-3">5 Cách Phối Túi Đeo Chéo Cho Phong Cách Hiện Đại</h3>
       <p class="text-secondary text-sm mb-4 leading-relaxed">Túi đeo chéo không chỉ tiện dụng mà còn là phụ kiện thời trang hoàn hảo. Cùng khám phá cách phối đồ để tạo nên phong cách riêng.</p>
       <div class="flex items-center justify-between text-xs text-secondary"><span>Hương Giang</span> <span>3 ngày trước</span>
       </div>
      </div>
     </article><!-- Article 2 -->
     <article class="sharp-card rounded-lg overflow-hidden">
      <div class="p-6">
       <div class="mb-4 flex justify-center"><!-- Tote Bag -->
        <svg viewbox="0 0 200 200" class="w-32 h-32 sharp-image"><rect x="50" y="70" width="100" height="80" rx="4" fill="#f8fafc" stroke="#e2e8f0" stroke-width="2" /> <path d="M70 50 Q75 40 80 50 L80 70" fill="none" stroke="#64748b" stroke-width="3" stroke-linecap="round" /> <path d="M120 50 Q125 40 130 50 L130 70" fill="none" stroke="#64748b" stroke-width="3" stroke-linecap="round" /> <rect x="60" y="90" width="80" height="2" fill="#cbd5e1" /> <rect x="70" y="110" width="60" height="1" fill="#e2e8f0" /> <ellipse cx="100" cy="160" rx="40" ry="5" fill="#e2e8f0" opacity="0.5" />
        </svg>
       </div><span class="text-xs font-medium accent-blue mb-2 block">HƯỚNG DẪN</span>
       <h3 class="text-lg font-bold text-primary mb-3">Chọn Túi Tote Hoàn Hảo Cho Công Việc</h3>
       <p class="text-secondary text-sm mb-4 leading-relaxed">Túi tote là lựa chọn lý tưởng cho phụ nữ hiện đại. Tìm hiểu cách chọn chiếc túi tote phù hợp với nhu cầu công việc của bạn.</p>
       <div class="flex items-center justify-between text-xs text-secondary"><span>Minh Châu</span> <span>1 tuần trước</span>
       </div>
      </div>
     </article><!-- Article 3 -->
     <article class="sharp-card rounded-lg overflow-hidden">
      <div class="p-6">
       <div class="mb-4 flex justify-center"><!-- Evening Clutch -->
        <svg viewbox="0 0 200 200" class="w-32 h-32 sharp-image"><rect x="60" y="90" width="80" height="40" rx="4" fill="#f8fafc" stroke="#e2e8f0" stroke-width="2" /> <rect x="70" y="100" width="60" height="1" fill="#cbd5e1" /> <circle cx="100" cy="110" r="3" fill="#94a3b8" /> <rect x="80" y="115" width="40" height="1" fill="#e2e8f0" /> <ellipse cx="100" cy="140" rx="30" ry="3" fill="#e2e8f0" opacity="0.5" />
        </svg>
       </div><span class="text-xs font-medium accent-blue mb-2 block">THỜI TRANG</span>
       <h3 class="text-lg font-bold text-primary mb-3">Ví Cầm Tay - Phụ Kiện Không Thể Thiếu Cho Buổi Tối</h3>
       <p class="text-secondary text-sm mb-4 leading-relaxed">Khám phá bộ sưu tập ví cầm tay thanh lịch, từ thiết kế cổ điển đến hiện đại, phù hợp cho mọi dịp đặc biệt.</p>
       <div class="flex items-center justify-between text-xs text-secondary"><span>Thu Hà</span> <span>2 tuần trước</span>
       </div>
      </div>
     </article><!-- Article 4 -->
     <article class="sharp-card rounded-lg overflow-hidden">
      <div class="p-6">
       <div class="mb-4 flex justify-center"><!-- Backpack -->
        <svg viewbox="0 0 200 200" class="w-32 h-32 sharp-image"><rect x="70" y="60" width="60" height="90" rx="8" fill="#f8fafc" stroke="#e2e8f0" stroke-width="2" /> <path d="M85 40 Q90 30 95 40 L95 60" fill="none" stroke="#64748b" stroke-width="2" stroke-linecap="round" /> <path d="M105 40 Q110 30 115 40 L115 60" fill="none" stroke="#64748b" stroke-width="2" stroke-linecap="round" /> <rect x="80" y="80" width="40" height="2" fill="#cbd5e1" /> <rect x="85" y="100" width="30" height="25" rx="3" fill="#f1f5f9" stroke="#e2e8f0" stroke-width="1" /> <ellipse cx="100" cy="160" rx="25" ry="4" fill="#e2e8f0" opacity="0.5" />
        </svg>
       </div><span class="text-xs font-medium accent-blue mb-2 block">LIFESTYLE</span>
       <h3 class="text-lg font-bold text-primary mb-3">Ba Lô Thời Trang - Xu Hướng Mới Của Giới Trẻ</h3>
       <p class="text-secondary text-sm mb-4 leading-relaxed">Ba lô không còn chỉ dành cho học sinh. Khám phá cách các fashionista sử dụng ba lô như một phụ kiện thời trang.</p>
       <div class="flex items-center justify-between text-xs text-secondary"><span>Lan Anh</span> <span>3 tuần trước</span>
       </div>
      </div>
     </article><!-- Article 5 -->
     <article class="sharp-card rounded-lg overflow-hidden">
      <div class="p-6">
       <div class="mb-4 flex justify-center"><!-- Bucket Bag -->
        <svg viewbox="0 0 200 200" class="w-32 h-32 sharp-image"><path d="M70 80 L130 80 L125 140 L75 140 Z" fill="#f8fafc" stroke="#e2e8f0" stroke-width="2" /> <path d="M80 60 Q100 50 120 60" fill="none" stroke="#64748b" stroke-width="3" stroke-linecap="round" /> <rect x="80" y="95" width="40" height="1" fill="#cbd5e1" /> <rect x="85" y="110" width="30" height="1" fill="#e2e8f0" /> <ellipse cx="100" cy="150" rx="25" ry="4" fill="#e2e8f0" opacity="0.5" />
        </svg>
       </div><span class="text-xs font-medium accent-blue mb-2 block">REVIEW</span>
       <h3 class="text-lg font-bold text-primary mb-3">Túi Bucket - Sự Trở Lại Của Biểu Tượng Thập Niên 90</h3>
       <p class="text-secondary text-sm mb-4 leading-relaxed">Túi bucket đang tạo nên cơn sốt trong giới thời trang. Tìm hiểu lý do tại sao mẫu túi này lại được yêu thích đến vậy.</p>
       <div class="flex items-center justify-between text-xs text-secondary"><span>Phương Linh</span> <span>1 tháng trước</span>
       </div>
      </div>
     </article><!-- Article 6 -->
     <article class="sharp-card rounded-lg overflow-hidden">
      <div class="p-6">
       <div class="mb-4 flex justify-center"><!-- Satchel Bag -->
        <svg viewbox="0 0 200 200" class="w-32 h-32 sharp-image"><rect x="60" y="75" width="80" height="65" rx="6" fill="#f8fafc" stroke="#e2e8f0" stroke-width="2" /> <path d="M80 55 Q100 45 120 55 L120 75" fill="none" stroke="#64748b" stroke-width="3" stroke-linecap="round" /> <rect x="70" y="90" width="60" height="2" fill="#cbd5e1" /> <rect x="85" y="105" width="30" height="15" rx="2" fill="#f1f5f9" stroke="#e2e8f0" stroke-width="1" /> <circle cx="100" cy="112" r="2" fill="#94a3b8" /> <ellipse cx="100" cy="150" rx="30" ry="4" fill="#e2e8f0" opacity="0.5" />
        </svg>
       </div><span class="text-xs font-medium accent-blue mb-2 block">KINH NGHIỆM</span>
       <h3 class="text-lg font-bold text-primary mb-3">Bảo Quản Túi Xách Da - Bí Quyết Giữ Túi Luôn Như Mới</h3>
       <p class="text-secondary text-sm mb-4 leading-relaxed">Hướng dẫn chi tiết cách bảo quản và chăm sóc túi xách da để giữ được độ bền và vẻ đẹp theo thời gian.</p>
       <div class="flex items-center justify-between text-xs text-secondary"><span>Ngọc Mai</span> <span>1 tháng trước</span>
       </div>
      </div>
     </article>
    </div>
   </section><!-- Newsletter -->
   <section class="sharp-card rounded-lg p-8 text-center">
    <h2 class="text-2xl font-bold text-primary mb-4">Đăng Ký Nhận Tin</h2>
    <p class="text-secondary mb-6 max-w-2xl mx-auto">Nhận thông tin về xu hướng túi xách mới nhất, mẹo phối đồ và những bài viết thú vị khác từ BagBlog</p>
    <div class="flex flex-col sm:flex-row gap-4 max-w-md mx-auto"><input type="email" placeholder="Nhập email của bạn" class="flex-1 px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500"> <button class="bg-slate-800 hover:bg-slate-700 text-white font-medium px-6 py-3 rounded-lg transition-colors"> Đăng Ký </button>
    </div>
   </section>
  </main><!-- Footer -->
  <footer class="bg-white border-t border-gray-200 mt-16 py-12">
   <div class="max-w-6xl mx-auto px-6">
    <div class="grid md:grid-cols-4 gap-8">
     <div>
      <div class="flex items-center space-x-2 mb-4">
       <div class="w-8 h-8 bg-slate-800 rounded-lg flex items-center justify-center"><span class="text-white font-bold">B</span>
       </div><span class="font-bold text-primary">BagBlog</span>
      </div>
      <p class="text-secondary text-sm">Nơi chia sẻ đam mê về túi xách và thời trang hiện đại.</p>
     </div>
     <div>
      <h3 class="font-semibold text-primary mb-4">Danh Mục</h3>
      <ul class="space-y-2 text-sm text-secondary">
       <li><a href="#" class="hover:text-primary transition-colors">Xu hướng</a></li>
       <li><a href="#" class="hover:text-primary transition-colors">Phong cách</a></li>
       <li><a href="#" class="hover:text-primary transition-colors">Thương hiệu</a></li>
       <li><a href="#" class="hover:text-primary transition-colors">Hướng dẫn</a></li>
      </ul>
     </div>
     <div>
      <h3 class="font-semibold text-primary mb-4">Về Chúng Tôi</h3>
      <ul class="space-y-2 text-sm text-secondary">
       <li><a href="#" class="hover:text-primary transition-colors">Giới thiệu</a></li>
       <li><a href="#" class="hover:text-primary transition-colors">Đội ngũ</a></li>
       <li><a href="#" class="hover:text-primary transition-colors">Liên hệ</a></li>
       <li><a href="#" class="hover:text-primary transition-colors">Quảng cáo</a></li>
      </ul>
     </div>
     <div>
      <h3 class="font-semibold text-primary mb-4">Theo Dõi</h3>
      <div class="flex space-x-3">
       <div class="w-8 h-8 bg-gray-100 rounded-lg flex items-center justify-center hover:bg-gray-200 transition-colors cursor-pointer"><span class="text-xs">📘</span>
       </div>
       <div class="w-8 h-8 bg-gray-100 rounded-lg flex items-center justify-center hover:bg-gray-200 transition-colors cursor-pointer"><span class="text-xs">📷</span>
       </div>
       <div class="w-8 h-8 bg-gray-100 rounded-lg flex items-center justify-center hover:bg-gray-200 transition-colors cursor-pointer"><span class="text-xs">🐦</span>
       </div>
      </div>
     </div>
    </div>
    <div class="border-t border-gray-200 mt-8 pt-8 text-center">
     <p class="text-secondary text-sm">© 2024 BagBlog. Tất cả quyền được bảo lưu.</p>
    </div>
   </div>
  </footer>
  <script>
        // Configuration for Element SDK
        const defaultConfig = {
            blog_title: "Blog Túi Xách",
            blog_subtitle: "Khám phá xu hướng, phong cách và những câu chuyện thú vị về thế giới túi xách hiện đại",
            featured_title: "Bài Viết Nổi Bật",
            latest_posts_title: "Bài Viết Mới Nhất",
            primary_color: "#1e293b",
            secondary_color: "#64748b",
            accent_color: "#3b82f6",
            background_color: "#ffffff",
            border_color: "#e2e8f0",
            font_family: "system-ui",
            font_size: 16
        };

        let config = { ...defaultConfig };

        // Element SDK functions
        async function onConfigChange(newConfig) {
            config = { ...config, ...newConfig };
            
            // Update text content
            document.getElementById('blog-title').textContent = config.blog_title || defaultConfig.blog_title;
            document.getElementById('blog-subtitle').textContent = config.blog_subtitle || defaultConfig.blog_subtitle;
            document.getElementById('featured-title').textContent = config.featured_title || defaultConfig.featured_title;
            document.getElementById('latest-posts-title').textContent = config.latest_posts_title || defaultConfig.latest_posts_title;
            
            // Update colors
            const primaryColor = config.primary_color || defaultConfig.primary_color;
            const secondaryColor = config.secondary_color || defaultConfig.secondary_color;
            const accentColor = config.accent_color || defaultConfig.accent_color;
            const backgroundColor = config.background_color || defaultConfig.background_color;
            const fontSize = config.font_size || defaultConfig.font_size;
            const fontFamily = config.font_family || defaultConfig.font_family;
            
            // Update background
            document.body.style.background = `linear-gradient(135deg, ${backgroundColor} 0%, #f8fafc 100%)`;
            
            // Update text colors
            document.querySelectorAll('.text-primary').forEach(el => {
                el.style.color = primaryColor;
            });
            
            document.querySelectorAll('.text-secondary').forEach(el => {
                el.style.color = secondaryColor;
            });
            
            document.querySelectorAll('.accent-blue').forEach(el => {
                el.style.color = accentColor;
            });
            
            // Update font family
            const fontElements = ['blog-title', 'blog-subtitle', 'featured-title', 'latest-posts-title'];
            fontElements.forEach(id => {
                const element = document.getElementById(id);
                if (element) {
                    element.style.fontFamily = `${fontFamily}, system-ui, sans-serif`;
                }
            });
            
            // Update font sizes
            document.getElementById('blog-title').style.fontSize = `${fontSize * 2.5}px`;
            document.getElementById('blog-subtitle').style.fontSize = `${fontSize * 1.125}px`;
            document.getElementById('featured-title').style.fontSize = `${fontSize * 1.5}px`;
            document.getElementById('latest-posts-title').style.fontSize = `${fontSize * 1.5}px`;
        }

        function mapToCapabilities(config) {
            return {
                recolorables: [
                    {
                        get: () => config.primary_color || defaultConfig.primary_color,
                        set: (value) => {
                            config.primary_color = value;
                            window.elementSdk?.setConfig({ primary_color: value });
                        }
                    },
                    {
                        get: () => config.secondary_color || defaultConfig.secondary_color,
                        set: (value) => {
                            config.secondary_color = value;
                            window.elementSdk?.setConfig({ secondary_color: value });
                        }
                    },
                    {
                        get: () => config.accent_color || defaultConfig.accent_color,
                        set: (value) => {
                            config.accent_color = value;
                            window.elementSdk?.setConfig({ accent_color: value });
                        }
                    },
                    {
                        get: () => config.background_color || defaultConfig.background_color,
                        set: (value) => {
                            config.background_color = value;
                            window.elementSdk?.setConfig({ background_color: value });
                        }
                    },
                    {
                        get: () => config.border_color || defaultConfig.border_color,
                        set: (value) => {
                            config.border_color = value;
                            window.elementSdk?.setConfig({ border_color: value });
                        }
                    }
                ],
                borderables: [],
                fontEditable: {
                    get: () => config.font_family || defaultConfig.font_family,
                    set: (value) => {
                        config.font_family = value;
                        window.elementSdk?.setConfig({ font_family: value });
                    }
                },
                fontSizeable: {
                    get: () => config.font_size || defaultConfig.font_size,
                    set: (value) => {
                        config.font_size = value;
                        window.elementSdk?.setConfig({ font_size: value });
                    }
                }
            };
        }

        function mapToEditPanelValues(config) {
            return new Map([
                ["blog_title", config.blog_title || defaultConfig.blog_title],
                ["blog_subtitle", config.blog_subtitle || defaultConfig.blog_subtitle],
                ["featured_title", config.featured_title || defaultConfig.featured_title],
                ["latest_posts_title", config.latest_posts_title || defaultConfig.latest_posts_title]
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

        // Newsletter form handling
        document.querySelector('button').addEventListener('click', function(e) {
            e.preventDefault();
            const email = document.querySelector('input[type="email"]').value;
            if (email) {
                // Show success message
                this.textContent = 'Đã Đăng Ký!';
                this.style.backgroundColor = '#10b981';
                setTimeout(() => {
                    this.textContent = 'Đăng Ký';
                    this.style.backgroundColor = '';
                    document.querySelector('input[type="email"]').value = '';
                }, 2000);
            }
        });

        // Smooth hover effects for cards
        document.querySelectorAll('.sharp-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-2px)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });
    </script>
 <script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'9962f42bd6905df8',t:'MTc2MTc0Mzg1My4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
<script>
        var userEmail = "<%= session.getAttribute("user_email") != null ? session.getAttribute("user_email") : "" %>";
    </script>

    <script src="${pageContext.request.contextPath}/static/js/tuvan.js"></script>
    <script src="${pageContext.request.contextPath}/static/CssTotal/script.js"></script>


</html>