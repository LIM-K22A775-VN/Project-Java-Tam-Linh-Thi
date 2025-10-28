package LoginIntroServlet;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.DatabaseConnection;

@WebServlet("/login_intro_face")
public class LoginIntroFaceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // false = không tạo mới nếu chưa có
        String userEmail = (session != null) ? (String) session.getAttribute("user_email") : null;
        Boolean loginSuccess = (session != null) ? (Boolean) session.getAttribute("login_success") : null;

        if (session != null) {
            session.removeAttribute("login_success"); // giống Flask: pop
        }

        if (userEmail != null) {
            try (Connection conn = DatabaseConnection.getConnection()) {
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT username, avatar FROM users WHERE email = ?");
                stmt.setString(1, userEmail);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    String username = rs.getString("username");
                    String avatar = rs.getString("avatar"); // tên file ảnh

                    request.setAttribute("user", new User(username, avatar)); // bạn cần tạo class User
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(LoginIntroFaceServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        request.setAttribute("success", loginSuccess);
        request.getRequestDispatcher("/templates/intro.jsp").forward(request, response);
    }

    // Class User để truyền sang JSP
    public static class User {
        private String username;
        private String avatar;

        public User(String username, String avatar) {
            this.username = username;
            this.avatar = avatar;
        }

        public String getUsername() { return username; }
        public String getAvatar() { return avatar; }
    }
}