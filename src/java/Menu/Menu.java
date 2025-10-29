package Menu;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Food;
import model.DatabaseConnection;

@WebServlet("/Menu")
public class Menu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        System.out.println("ok nha");
        // Lấy thông tin người dùng từ session
        @SuppressWarnings("unchecked")
        Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("user");

        // Nếu chưa đăng nhập -> chuyển về trang login
        if (userInfo == null || userInfo.get("id") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        String userId = (String) userInfo.get("id"); // Lấy user_id từ Map

        List<Food> foods = new ArrayList<>();

        String sql = "SELECT f.nameFood, f.style, f.category, f.price, f.orig_price, f.image, "
                + "CASE WHEN fy.id IS NOT NULL THEN 1 ELSE 0 END AS in_favorite, "
                + "CASE WHEN c.id IS NOT NULL THEN 1 ELSE 0 END AS in_cart "
                + "FROM food_thucdon ft "
                + "JOIN food f ON ft.idFood = f.IdFood "
                + "LEFT JOIN food_yeuthich fy ON f.nameFood = fy.food_name AND fy.IdUser = ? "
                + "LEFT JOIN cart c ON f.nameFood = c.food_name AND c.IdUser = ? "
                + "ORDER BY ft.idFood ASC";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userId);
            ps.setString(2, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Food food = new Food();
                    food.setName(rs.getString("nameFood"));
                    food.setBrand(rs.getString("style"));
                    food.setCategory(rs.getString("category"));
                    food.setPrice(rs.getDouble("price"));
                    food.setOrigPrice(rs.getDouble("orig_price"));
                    food.setImg(rs.getString("image"));
                    food.setInFavorite(rs.getInt("in_favorite") == 1);
                    food.setInCart(rs.getInt("in_cart") == 1);
                    foods.add(food);
                    // Hiển thị thông tin food trên console
                    System.out.println("Tên món: " + food.getName()
                            + ", Thương hiệu: " + food.getBrand()
                            + ", Loại: " + food.getCategory()
                            + ", Giá: " + food.getPrice()
                            + ", Giá gốc: " + food.getOrigPrice()
                            + ", Yêu thích: " + food.isInFavorite()
                            + ", Trong giỏ: " + food.isInCart());
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi truy vấn dữ liệu: " + e.getMessage());
        }

        // Set thông tin người dùng và danh sách món cho JSP
        request.setAttribute("user", userInfo);
        request.setAttribute("foods", foods);
        request.setAttribute("breadcrumb", "Thực đơn");

        request.getRequestDispatcher("/templates/Menu.jsp").forward(request, response);
    }
}
