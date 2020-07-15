<%--
  Created by IntelliJ IDEA.
  User: Huangwk
  Date: 2020/7/7
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src ="<%=request.getContextPath()%>/res/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        function add() {
           $.post("<%=request.getContextPath()%>/user/update",
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
         <input type="hidden" name="id" value="${user.id}"/><br/>
        用户名<input type="text" name="userName" value="${user.userName}"/><br/>
        密码<input type="text" name="userPwd" value="${user.userPwd}"/><br/>
        年龄<input type="text" name="userAge" value="${user.userAge}"/><br/>
        性别

        男<input type="radio" name="userSex" value="1"  <c:if test="${userSex ==1}">checked</c:if> />
        女<input type="radio" name="userSex" value="0"  <c:if test="${userSex ==0}">checked</c:if>/><br/>
        手机号<input type="text" name="phone" value="${user.phone}"/><br/>
        邮箱<input type="text" name="email" value="${user.email}"/><br/>
        爱好
        足球<input type="radio" name="hobby" value="1"  <c:if test="${userSex ==1}">checked</c:if>>
        篮球<input type="radio" name="hobby" value="2"  <c:if test="${userSex ==2}">checked</c:if>>
        棒球<input type="radio" name="hobby" value="3"  <c:if test="${userSex ==3}">checked</c:if>><br/>
        <input type="button" value="修改" onclick="add()"/>
    </form>
</body>
</html>
