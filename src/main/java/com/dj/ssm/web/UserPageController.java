package com.dj.ssm.web;

import com.dj.ssm.pojo.User;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/")
public class UserPageController {
    @Autowired
    private UserService userService;

    /**
     * 去新增页面
     */
    @RequestMapping("toAdd")
    public String toAdd() {
        return "/user/add";
    }
    /**
     * 去新增页面
     */
    @RequestMapping("toAdds")
    public String toAdds() {
        return "/user/adds";
    }

    @RequestMapping("findById/{id}")
    public String findById(@PathVariable("id") Integer id, Model model) {
        User user = userService.getById(id);
        model.addAttribute("user", user);
        return "/user/update";
    }

}
