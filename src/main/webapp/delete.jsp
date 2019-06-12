<%@ page import="per.fei.core.teacher.Teacher" %>
<%@ page import="java.util.LinkedHashSet" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/5/16
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>delete</title>
        <style type="text/css">

            /*伪类选择器*/
            td:hover{
                /*鼠标经过的时候背景色变为灰色*/
                background: white;
                /*鼠标经过的时候箭头变为小手*/
                cursor: pointer;
            }
        </style>
    </head>
    <body>

    <a id="顶部"></a>

    <form action="/delete" method="post">
    <center>
        <b>
            <br/>
            <br>
            请输入你要删除的老师id
        </b>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" border="1px" name="id" id="id" onfocus="idGetForcus()"
         align="center" value="请输入id"
               style="color: darkgrey; width: 150px ; height: 30px"/><span id="id_span"></span>
        <input type="submit" value="删除"/>
        <br/>
        <br>
    </center>
    </form>
    <hr />
    <h2 align="center" > 全体老师信息如下： </h2>
    <table border="1px" align="center" cellspacing="0px" cellpadding="0px">
        <%
            LinkedHashSet<Teacher> teacher = MyService.search(null);
        %>
        <%@include file="print_table.jsp"%>
    </table>
</body>

    <script>

        //	点击id文本框的时候将里面的字清空
        function idGetForcus(){
            var id = document.getElementById("id");
            id.value="";
        }

        // 获取id文本框对象
        var id_text = document.getElementById("id");
        // 根据class属性获取表格id那一列的对象数组
        var ids = document.getElementsByClassName("idClass");
        // 遍历数组，设置点击事件
        for (var i=0; i<ids.length; i++)
        {
            ids[i].onclick = function ()
            {
                // alert("aa");
                id_text.value = this.innerHTML; // 点击的时候将点击的id的值写入文本框中
                window.location.href="#顶部"; // 点击的时候跳转到页面顶部
            }
        }

        // //		判断id是不是3位,不是的话报错
        // function idgetBlur(){
        //     var id = document.getElementById("id").value;
        //     var span = document.getElementById("id_span");
        //     if (id.length != 3){
        //         span.innerHTML = "id长度必须是3".fontcolor("red");
        //     }
        //     else
        //     {
        //         var flag = 0;
        //         for (var i=0; i<3; i++)
        //         {
        //             if(id[i]<'0' || id[i]>'9')
        //             {
        //                 flag = 1;
        //                 span.innerHTML = "id不能有字母".fontcolor("red");
        //                 break;
        //             }
        //         }
        //         if (flag == 0)
        //         {
        //             span.innerHTML="";
        //         }
        //     }
        // }
    </script>

</html>
