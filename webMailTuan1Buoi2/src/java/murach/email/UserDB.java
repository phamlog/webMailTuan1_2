package murach.email;

import java.util.ArrayList;
import java.util.List;
import murach.business.User;

public class UserDB {

    // Bộ nhớ giả lập database
    private static final List<User> users = new ArrayList<>();

    // Thêm user vào "database"
    public static void insert(User user) {
        users.add(user);
        System.out.println("User saved: " + user.getFirstName() + " " 
                           + user.getLastName() + " (" + user.getEmail() + ")");
    }

    // Lấy tất cả user
    public static List<User> selectAll() {
        return users;
    }
}
