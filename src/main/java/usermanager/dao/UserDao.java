package usermanager.dao;

import usermanager.model.User;

import java.util.List;

public interface UserDao {
    int limitResultsPerPage = 5;

    void addUser(User user);

    void removeUser(int id);

    void updateUser(User user);

    User getUserById(int id);

    List<User> listUsers(int page);

    void populateDB();

    List<User> findUsers(String searchKeyword);

    int getTotalUsers();
}
