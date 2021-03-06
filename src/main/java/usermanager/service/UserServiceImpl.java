package usermanager.service;

import usermanager.dao.UserDao;
import usermanager.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    @Transactional
    public int getTotalUsers() {
        return this.userDao.getTotalUsers();
    }

    @Transactional
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Transactional
    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Transactional
    public List<User> listUsers(int page) {
        return this.userDao.listUsers(page);
    }

    @Transactional
    public void populateDB() {
        this.userDao.populateDB();
    }

    @Transactional
    public List<User> findUsers(String searchKeyword) {
        return this.userDao.findUsers(searchKeyword);
    }
}
