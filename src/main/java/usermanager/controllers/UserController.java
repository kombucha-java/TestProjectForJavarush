package usermanager.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import usermanager.dao.UserDao;
import usermanager.model.User;
import usermanager.service.UserService;

import java.util.List;

@Controller
public class UserController {
    private UserService userService;

    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users/{page}", method = RequestMethod.GET)
    public String listUsers(@PathVariable("page") Integer page, Model model) {
        if (page == null)
            page = 1;
        List<User> userList = this.userService.listUsers(page - 1);
        int totalUsers = this.userService.getTotalUsers();
        int totalPages = totalUsers % UserDao.limitResultsPerPage > 0 ? totalUsers / UserDao.limitResultsPerPage + 1 :
                totalUsers / UserDao.limitResultsPerPage;
        int startPage = Math.max(1, page - 5);
        int endPage = Math.min(startPage + 10, totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("listUsers", userList);
        return "users";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute(value = "user") User user, Model model) {
        if (user.getId() == 0) {
            this.userService.addUser(user);
        } else this.userService.updateUser(user);
        model.addAttribute("listUsers", this.userService.listUsers(0));
        return "redirect:/users/1";
    }

    @RequestMapping("remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        this.userService.removeUser(id);
        return "redirect:/users/1";
    }

    @RequestMapping("edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "userdata";
    }

    @RequestMapping("adduser")
    public String newUser(@ModelAttribute(value = "user") User user, Model model) {
        model.addAttribute("user", new User());
        return "userdata";
    }

    @RequestMapping("findusers")
    public String findUsers(@RequestParam("searchKeyword") String searchKeyword, Model model) {
        model.addAttribute("listUsers", this.userService.findUsers(searchKeyword));
        return "/users";
    }
}
