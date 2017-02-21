package usermanager.service;

import usermanager.model.User;

import java.util.List;

/**
 * Created by mvadmin on 17.02.2017.
 */
public interface UserService {
    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> listUsers();

    void populateDB();

    List<User> findUsers(String searchKeyword);
}
