package cart;

import model.DatabaseConnection;
import model.User;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "remove_from_favorite", urlPatterns = {"/remove_from_favorite"})
public class remove_from_favorite extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");

        // Lấy user từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"message\":\"Bạn cần đăng nhập để xóa yêu thích!\"}");
            return;
        }

        // Đọc dữ liệu JSON từ request
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        String idBag;
        try {
            JSONObject json = new JSONObject(sb.toString());
            idBag = json.getString("idBag"); // hoặc id chính nếu muốn
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"message\":\"Dữ liệu gửi lên không hợp lệ!\"}");
            return;
        }

        // Xóa khỏi bảng bags_yeuthich
        String deleteSql = "DELETE FROM bags_yeuthich WHERE IdUser = ? AND IdBag = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(deleteSql)) {

            ps.setString(1, user.getIdUser());
            ps.setString(2, idBag);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("{\"message\":\"Đã xóa sản phẩm khỏi danh sách yêu thích!\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"message\":\"Sản phẩm không tồn tại trong danh sách yêu thích.\"}");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\":\"Lỗi khi xóa sản phẩm khỏi danh sách yêu thích!\"}");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"message\":\"Sử dụng POST để xóa yêu thích.\"}");
    }

    @Override
    public String getServletInfo() {
        return "Servlet xóa sản phẩm khỏi danh sách yêu thích";
    }
}
