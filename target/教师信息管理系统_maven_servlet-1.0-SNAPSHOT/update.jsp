<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="per.fei.core.teacher.Teacher" %>
<%@ page import="per.fei.service.MyService" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/5/17
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update</title>
    <style type="text/css">

        /*伪类选择器*/
        td:hover{
            /*鼠标经过的时候背景色变为灰色*/
            background: #bfbbff;
            /*鼠标经过的时候箭头变为小手*/
            cursor: pointer;
        }
    </style>
</head>
<body>

<form action="/update" method="post">

    <center>
        <a id="顶部"></a>
        <h4>
            请输入要修改的老师id:&nbsp;&nbsp;<input type="text" id="id"
                        name="id" align="center" onblur="idgetBlur()" style="height: 30px;width: 80px"
                  onfocus="idGetForcus()"/>
             <input type="submit" value="修改" >
        </h4>
    </center>
    <hr>
    <table border="1px" align="center" cellspacing="0px" cellpadding="0px">
        <%
            LinkedHashSet<Teacher> teacher = MyService.search(null);
        %>
        <%@include file="print_table.jsp"%>
    </table>
</form>

</body>
<script>
     // 获取id文本框对象
    var id_test = document.getElementById("id");
    // 根据class属性获取表格id那一列的对象数组
    var ids= document.getElementsByClassName("idClass");
    // 遍历数组，设置点击事件
    for (var i=0; i<ids.length; i++)
    {
        ids[i].onclick = function () {
            id_test.value = this.innerHTML; // 点击的时候将点击的id的值写入文本框中
            window.location.href="#顶部"; // 点击的时候跳转到页面顶部
        }
    }
</script>
</html>
