package usermanager.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import usermanager.model.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    private SessionFactory sessionFactory;
    private int totalUsers;

    public int getTotalUsers() {
        return totalUsers;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User successfully added. User details: " + user);
    }

    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        if (user != null) {
            session.delete(user);
        }
        logger.info("User successfully deleted. User details: " + user);
    }

    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User successfully updated. User details: " + user);
    }

    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        logger.info("User successfully loaded. User details: " + user);
        return user;
    }

    @SuppressWarnings("unchecked")
    public List<User> listUsers(int page) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User");
        totalUsers = query.list().size();
        query.setFirstResult(page * limitResultsPerPage);
        query.setMaxResults(limitResultsPerPage);
        List<User> userList = query.list();
        for (User user : userList) {
            logger.info("User list: " + user);
        }

        return userList;
    }

    public void populateDB() {
        Session session = this.sessionFactory.getCurrentSession();
        try {
            InputStreamReader isr = new InputStreamReader(this.getClass().getResourceAsStream("/database/populateDB.sql"));
            BufferedReader reader = new BufferedReader(isr);
            while (true) {
                String sql = reader.readLine();
                if (sql == null) {
                    break;
                }
                try {
                    int result = session.createSQLQuery(sql).executeUpdate();
                    System.out.printf("Got result %d from '%s'\n", result, sql);
                } catch (Exception e) {
                    System.err.printf("Error executing '%s'\n", sql);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<User> findUsers(String searchKeyword) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User u where u.name like :userName");
        List<User> userList = query.setString("userName", "%" + searchKeyword + "%").list();
        for (User user : userList) {
            logger.info("User list: " + user);
        }
        return userList;
    }
}
