package LoginIntroServlet;
import java.io.*;
import java.sql.*;
import java.util.Base64;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.JSONObject;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import model.DatabaseConnection;

@WebServlet("/login-faceid")
public class LoginFaceIDServlet extends HttpServlet {

    private static final String UPLOAD_FOLDER = "D:/mimi/web/static/avatars/"; // same as app.config['UPLOAD_FOLDER']

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login_faceid.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        try {
            // Đọc JSON từ body
            StringBuilder sb = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            JSONObject data = new JSONObject(sb.toString());

            String email = data.optString("email");
            String imageData = data.optString("image");

            if (email.isEmpty() || imageData.isEmpty()) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Thiếu email hoặc ảnh");
                out.print(jsonResponse.toString());
                return;
            }

            // Truy vấn DB lấy ảnh FaceID đã lưu
            String faceFileName = null;
            try (Connection conn = DatabaseConnection.getConnection()) {
                PreparedStatement stmt = conn.prepareStatement("SELECT faceID FROM users WHERE email = ?");
                stmt.setString(1, email);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    faceFileName = rs.getString("faceID");
                }
            }

            if (faceFileName == null || faceFileName.isEmpty()) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Chưa đăng ký FaceID cho tài khoản này");
                out.print(jsonResponse.toString());
                return;
            }

            String savedImagePath = UPLOAD_FOLDER + faceFileName;

            // Giải mã ảnh mới từ base64
            String base64Data = imageData.split(",")[1];
            byte[] imageBytes = Base64.getDecoder().decode(base64Data);
            BufferedImage liveImage = ImageIO.read(new ByteArrayInputStream(imageBytes));

            // Đọc ảnh đã lưu
            File savedFile = new File(savedImagePath);
            BufferedImage savedImage = ImageIO.read(savedFile);

            // ⚠️ TẠM THỜI: không có face_recognition như Python
            // => chỉ giả lập so sánh khuôn mặt bằng kích thước ảnh
            boolean match = compareFaces(savedImage, liveImage);

            if (match) {
                HttpSession session = request.getSession();
                session.setAttribute("user_email", email);
                session.setAttribute("login_success", "Đăng nhập FaceID thành công!");
                jsonResponse.put("success", true);
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Khuôn mặt không khớp");
            }

        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Lỗi: " + e.getMessage());
        }

        out.print(jsonResponse.toString());
    }

    // Hàm giả lập so sánh ảnh
    private boolean compareFaces(BufferedImage img1, BufferedImage img2) {
        return img1.getWidth() == img2.getWidth() && img1.getHeight() == img2.getHeight();
    }
}