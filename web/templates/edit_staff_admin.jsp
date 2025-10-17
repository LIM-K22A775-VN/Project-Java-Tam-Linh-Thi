<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang quản trị</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/standard_admin.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/CssTotal/edit_staff_admin.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.7/quill.min.js"></script>
</head>

<body>
    <%@ include file="partials/sidebar_admin.jsp" %>

    <div class="main" id="main">
        <%@ include file="partials/navbar_admin.jsp" %>

        <div class="inner-position">
            <h2>Sửa thông tin</h2>
            <div class="position-right">
                <a href="intro.jsp">Trang chủ /</a>
                <p>Nhân viên</p>
            </div>
        </div>

        <div class="content">
            <div class="container">
                <div class="form-header">
                    <button class="btn-save"><i class="fa fa-save"></i> Lưu</button>
                    <button class="btn-back">
                        <a href="staff_admin.jsp" style="text-decoration: none; color: #fff;">
                            <i class="fa fa-arrow-left"></i> Về danh sách
                        </a>
                    </button>
                </div>

                <form action="EditStaffServlet" method="post">
                    <div class="form-grid">
                        <div>
                            <div class="form-group">
                                <label for="position">Chức vụ</label>
                                <select id="position" name="position">
                                    <option value="sáng">sáng</option>
                                    <option value="chiều">chiều</option>
                                    <option value="full-time">full-time</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="shift">Ca làm</label>
                                <select id="shift" name="shift">
                                    <option value="sáng">sáng</option>
                                    <option value="chiều">chiều</option>
                                    <option value="full-time">full-time</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="hsluong">Hệ số lương</label>
                                <input type="number" id="hsluong" name="hsluong">
                            </div>

                            <div class="form-group">
                                <label for="salary">Lương</label>
                                <input type="number" id="salary" name="salary">
                            </div>

                            <div class="form-group">
                                <label for="vipham">Lần vi phạm</label>
                                <input type="number" id="vipham" name="vipham">
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
                    [{ 'list': 'ordered' }, { 'list': 'bullet' }],
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
