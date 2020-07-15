<%--
  Created by IntelliJ IDEA.
  User: Huangwk
  Date: 2020/7/7
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src ="<%=request.getContextPath()%>/res/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        function add() {
           $.post("<%=request.getContextPath()%>/user/insert",
              $("#fm").serialize(),
               function(data){
                if(data.code !=200){
                    alert(data.msg);
                    return;
                }
                location.href="<%=request.getContextPath()%>/show.jsp";
           })
        }
    </script>
</head>
<body>
    <form id="fm">
        用户名<input type="text" name="userName"/><br/>
        密码<input type="text" name="userPwd"/><br/>
        年龄<input type="text" name="userAge"/><br/>
        性别
        男<input type="radio" name="userSex" value="1"/>
        女<input type="radio" name="userSex" value="0"/><br/>
        手机号<input type="text" name="phone"/><br/>
        邮箱<input type="text" name="email"/><br/>
        爱好
        足球<input type="radio" name="hobby" value="1">
        篮球<input type="radio" name="hobby" value="2">
        棒球<input type="radio" name="hobby" value="3"><br/>
        <input type="button" value="新增" onclick="add()"/>
    </form>
</body>
</html>
