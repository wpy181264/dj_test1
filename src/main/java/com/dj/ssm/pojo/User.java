package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 用户
 */
@Data
@TableName("user") // 实体类对应数据库表名
//dddd  dddaaa
public class User {

    @TableId(type = IdType.AUTO)// 主键策略
    private Integer id;
    @TableField("user_name")
    private String userName;
    @TableField("user_pwd")
    private String userPwd;
    @TableField("user_age")
    private Integer userAge;
    @TableField("user_sex")
    private Integer userSex;
    @TableField("user_pho")
    private String userPho;
    @TableField("user_email")
    private String userEmail;
    @TableField("user_hobby")
    private Integer userHobby;


}
