package com.dj.ssm.pojo;

import lombok.Data;

import java.util.List;

@Data
public class UserVO {

    private Integer id;

    private String username;

    private String nickName;

    private List<User>list;

}
