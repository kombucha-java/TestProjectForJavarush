package usermanager.dao;

import usermanager.model.User;

import java.util.List;

public interface UserDao {
    void addUser(User user);

    void removeUser(int id);

    void updateUser(User user);

    User getUserById(int id);

    List<User> listUsers();

    void populateDB();

    List<User> findUsers(String searchKeyword);
}
