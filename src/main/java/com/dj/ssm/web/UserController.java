package com.dj.ssm.web;

import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;


/**
 * @author 文沛阳
 */
@RequestMapping("/users/")
@RestController
public class UserController {
//克隆文件
    @Autowired
    private UserService userService;

    @GetMapping("/{id}")
    public ResultModel get(@PathVariable Integer id) {
        try {
            User user = userService.getById(id);
            return new ResultModel().success(user);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel().error(e.getMessage());
        }
    }
}
