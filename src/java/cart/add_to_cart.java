package cart;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DatabaseConnection;
import org.json.JSONObject;

@WebServlet(name = "add_to_cart", urlPatterns = {"/add_to_cart"})
public class add_to_cart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("user");

        if (userInfo == null || userInfo.get("id") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        String userId = (String) userInfo.get("id");

        // đọc JSON từ request
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        JSONObject json = new JSONObject(sb.toString());
        String idBag = json.getString("idBag");

        String checkSql = "SELECT quantity FROM cart WHERE IdUser = ? AND IdBag = ?";
        String insertSql = "INSERT INTO cart(IdUser, IdBag, quantity) VALUES(?, ?, 1)";
        String updateSql = "UPDATE cart SET quantity = quantity + 1 WHERE IdUser = ? AND IdBag = ?";

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (Connection conn = DatabaseConnection.getConnection()) {
            JSONObject resJson = new JSONObject();

            try (PreparedStatement psCheck = conn.prepareStatement(checkSql)) {
                psCheck.setString(1, userId);
                psCheck.setString(2, idBag);
                try (ResultSet rs = psCheck.executeQuery()) {
                    if (rs.next()) {
                        // cập nhật số lượng
                        try (PreparedStatement psUpdate = conn.prepareStatement(updateSql)) {
                            psUpdate.setString(1, userId);
                            psUpdate.setString(2, idBag);
                            psUpdate.executeUpdate();
                        }
                        resJson.put("status", "success");
                        resJson.put("message", "Đã cập nhật số lượng sản phẩm");
                    } else {
                        // thêm mới sản phẩm
                        try (PreparedStatement psInsert = conn.prepareStatement(insertSql)) {
                            psInsert.setString(1, userId);
                            psInsert.setString(2, idBag);
                            psInsert.executeUpdate();
                        }
                        resJson.put("status", "success");
                        resJson.put("message", "Đã thêm vào giỏ hàng");
                    }
                }
            }

            // gửi JSON trả về frontend
            response.getWriter().write(resJson.toString());

        } catch (Exception e) {
            e.printStackTrace();
            JSONObject errorJson = new JSONObject();
            errorJson.put("status", "error");
            errorJson.put("message", e.getMessage());
            response.getWriter().write(errorJson.toString());
        }
    }
}
