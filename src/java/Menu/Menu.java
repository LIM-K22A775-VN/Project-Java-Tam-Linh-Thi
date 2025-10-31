package Menu;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Bag;
import model.DatabaseConnection;
import model.User;

@WebServlet("/Menu")
public class Menu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        System.out.println("ok nha");

        // Lấy thông tin người dùng từ session (đúng kiểu User)
        User user = (User) session.getAttribute("user");

        // Nếu chưa đăng nhập thì chuyển về trang login
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String userId = user.getIdUser(); // Lấy ID người dùng

        List<Bag> bags = new ArrayList<>();

        String sql = "SELECT b.IdBag, b.nameBag, b.brand, b.category, b.price, b.orig_price, b.image, "
                + "CASE WHEN fy.IdBag IS NOT NULL THEN 1 ELSE 0 END AS in_favorite, "
                + "CASE WHEN c.IdBag IS NOT NULL THEN 1 ELSE 0 END AS in_cart "
                + "FROM bags b "
                + "LEFT JOIN bags_yeuthich fy ON b.IdBag = fy.IdBag AND fy.IdUser = ? "
                + "LEFT JOIN cart c ON b.IdBag = c.IdBag AND c.IdUser = ? "
                + "ORDER BY b.IdBag ASC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userId);
            ps.setString(2, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Bag bag = new Bag();
                    bag.setId(rs.getString("IdBag"));
                    bag.setName(rs.getString("nameBag"));
                    bag.setBrand(rs.getString("brand"));
                    bag.setCategory(rs.getString("category"));
                    bag.setPrice(rs.getDouble("price"));
                    bag.setOrigPrice(rs.getDouble("orig_price"));
                    bag.setImg(rs.getString("image"));
                    bag.setInFavorite(rs.getInt("in_favorite") == 1);
                    bag.setInCart(rs.getInt("in_cart") == 1);

                    bags.add(bag);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi truy vấn dữ liệu: " + e.getMessage());
        }

        // Gửi dữ liệu sang JSP
        request.setAttribute("user", user);
        request.setAttribute("bags", bags);

        // Chuyển tiếp sang trang Menu.jsp
        request.getRequestDispatcher("/templates/Menu.jsp").forward(request, response);
    }
}
