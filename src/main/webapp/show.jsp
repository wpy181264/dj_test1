<%--
  Created by IntelliJ IDEA.
  User: Huangwk
  Date: 2020/7/7
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src ="<%=request.getContextPath()%>/res/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        function selec() {
            uId= $('input[name="uId"]:checked');
            var pid=[];
            $.each(uId,function(){
                pid.push($(this).val());
            })
            return pid;
        }

        $(function () {
            $("#pageNo").val(1);
           show();
        })
        function sel() {
            $("#pageNo").val(1);
            show();
        }
        function show() {
            $.post("<%=request.getContextPath()%>/user/list",
               $("#fm").serialize(),
                function(data){
                var html = "";
                var pageHtml = "";
                for (var i=0;i<data.data.records.length;i++) {
                    var u = data.data.records[i];
                    html +="<tr>"
                    html +="<td><input type='checkbox' value='"+u.id+"' name='uId'></td>"
                    html +="<td>"+u.userName+"</td>"
                    html +="<td>"+u.userPwd+"</td>"
                    html +="<td>"+u.userAge+"</td>"
                    if( u.userSex == 1){
                        html += "<td>男</td>";
                    } else {
                        html += "<td>女</td>";
                    }
                    html +="<td>"+u.phone+"</td>"
                    html +="<td>"+u.email+"</td>"
                    if (u.hobby == 1) {
                        html +="<td>足球</td>"
                    } else if (u.hobby ==2) {
                        html +="<td>蓝球</td>"
                    } else {
                        html +="<td>棒球</td>"
                    }
                    html +="<td><input type='button' value='修改' onclick='update("+u.id+")'/><input type='button' value='删除' onclick='del("+u.id+")'/></td>"
                    html +="</tr>"
                }
                $("#tbd").html(html);
                    pageHtml += "<input type = 'button' value = '上一页' onclick = page(0,"+data.data.pages+")>"
                    pageHtml += "<input type = 'button' value = '下一页' onclick = page(1,"+data.data.pages+")>"
                    $("#pageDiv").html(pageHtml);
            });
        }
        //分页
        function page(s,pages){
            var pa =$("#pageNo").val();
            if(s == 0){
                if((parseInt(pa) - 1) < 1){
                    alert("没有上一页了")
                    return;
                }

                $("#pageNo").val(parseInt(pa) - 1);
            }
            if(s == 1){
                if(parseInt(pa) + 1 > pages){
                    alert("没有下一页了")
                    return;
                }

                $("#pageNo").val(parseInt(pa) + 1);
            }
            show();
        }
        //新增
        function add() {
            location.href="<%=request.getContextPath()%>/user/toAdd";
        }
        //去修改
        function update(id) {
            location.href="<%=request.getContextPath()%>/user/findById/"+id;
        }
        //删除
        function del(id) {
            $.post("<%=request.getContextPath()%>/user/del",
                {"id":id},
                function (data) {
                if(data.code !=200){
                    alert(data.msg);
                    return;
                }
                location.href="<%=request.getContextPath()%>/show.jsp";
            });
        }
        //去批量增加的页面
        function adds() {
            location.href="<%=request.getContextPath()%>/user/toAdds";
        }
        //批量删除
        function dels() {
            var checkBox=selec();
            if(checkBox.length < 1){
                alert("请至少选择一个进行删除");
                return;
            }
            $.post("<%=request.getContextPath()%>/user/delAll",
                {"ids":checkBox},
                function (data) {
                if (data.code !=200) {
                    alert(data.msg)
                    return;
                }
                alert("删除成功")

                    location.href="<%=request.getContextPath()%>/show.jsp";
            })
        }
    </script>
</head>
<body style="text-align: center">
    <input type="button" value="新增" onclick="add()"/>
    <input type="button" value="批量新增" onclick="adds()"/>
    <input type="button" value="批量删除" onclick="dels()"/>
    <form id = "fm">

        根据用户名查询:<input type="text" name="userName"/><br/>
        根据性别查询:
        男<input type="radio" name = "userSex" value ="1"/>
        女<input type="radio" name = "userSex" value ="0"/><br/>
        根据爱好查询:
        足球<input type="checkbox" name="hobby" value="1">
        篮球<input type="checkbox" name="hobby" value="2">
        棒球<input type="checkbox" name="hobby" value="3">
        <input type="hidden" value="1" id="pageNo" name ="pageNo"/>
        <input type="button" value="查询" onclick="sel()"/>
    </form>
    <table border="1px" cellpadding=20px" cellspacing="0px" align="center">
        <tr>
            <th><input type="hidden"></th>
            <th>用户名</th>
            <th>密码</th>
            <th>年龄</th>
            <th>性别</th>
            <th>手机号</th>
            <th>邮箱</th>
            <th>爱好</th>
            <th>操作</th>
        </tr>
        <tbody id = "tbd">

        </tbody>
    </table>
<div id ="pageDiv">

</div>
</body>
</html>
