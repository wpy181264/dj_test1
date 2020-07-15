package com.dj.ssm.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class UserQuery implements Serializable {

    private String userName;

    private Integer startAge;

    private Integer endAge;

    private Integer sex;

    private Integer pageNo = 1;

    private Integer pageSize = 2;

}
