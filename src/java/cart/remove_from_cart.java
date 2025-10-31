package cart;

import model.DatabaseConnection;
import model.User;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "remove_from_cart", urlPatterns = {"/remove_from_cart"})
public class remove_from_cart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Đặt content type
        response.setContentType("text/plain;charset=UTF-8");

        // Lấy user từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Bạn cần đăng nhập để thêm yêu thích!");
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
            idBag = json.getString("idBag");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Dữ liệu gửi lên không hợp lệ!");
            return;
        }

        String deleteSql = "DELETE FROM cart WHERE IdUser = ? AND IdBag = ?";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(deleteSql)) {

            ps.setString(1, user.getIdUser());
            ps.setString(2, idBag);  // xóa 1 sản phẩm cụ thể
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("{\"message\":\"Đã xóa sản phẩm khỏi giỏ hàng!\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"message\":\"Sản phẩm không tồn tại trong giỏ hàng.\"}");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\":\"Lỗi khi xóa sản phẩm khỏi giỏ hàng!\"}");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Có thể redirect sang doPost hoặc hiển thị thông tin
        response.setContentType("text/plain;charset=UTF-8");
        response.getWriter().write("Sử dụng POST để thêm yêu thích.");
    }

    @Override
    public String getServletInfo() {
        return "Servlet thêm sản phẩm vào danh sách yêu thích";
    }
}
