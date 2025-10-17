
package DAO;
import java.sql.*;
import java.util.*;
import model.DatabaseConnection;

public class FoodDAO {

    public static List<Map<String, Object>> getFoods(String tableName) throws Exception {
        List<Map<String, Object>> foods = new ArrayList<>();

        String sql = "SELECT name, category, price, orig_price, img FROM " + tableName;

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Map<String, Object> food = new HashMap<>();
                food.put("name", rs.getString("name"));
                food.put("category", rs.getString("category"));
                food.put("price", rs.getDouble("price"));
                food.put("orig_price", rs.getDouble("orig_price"));
                food.put("img", rs.getString("img"));
                foods.add(food);
            }
        }

        return foods;
    }
}