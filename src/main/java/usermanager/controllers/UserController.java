package usermanager.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import usermanager.model.User;
import usermanager.service.UserService;

@Controller
public class UserController {
    private UserService userService;

    @Autowired
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("listUsers", this.userService.listUsers());
        return "users";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute(value = "user") User user, Model model) {
        if (user.getId() == 0) {
            this.userService.addUser(user);
        } else this.userService.updateUser(user);
        model.addAttribute("listUsers", this.userService.listUsers());
        return "redirect:/users";
    }

    @RequestMapping("remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        this.userService.removeUser(id);
        return "redirect:/users";
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

    @RequestMapping("populateDB")
    public String populateDB(Model model) {
        this.userService.populateDB();
        model.addAttribute("listUsers", this.userService.listUsers());
        return "/users";
    }

    @RequestMapping("findusers")
    public String findUsers(@RequestParam("searchKeyword") String searchKeyword, Model model) {
        model.addAttribute("listUsers", this.userService.findUsers(searchKeyword));
        return "/users";
    }
}
