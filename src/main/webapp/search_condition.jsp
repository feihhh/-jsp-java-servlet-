<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Condition</title>
</head>

<script type="text/javascript">

    //		鼠标点击后将id文本框清空
    function idGetForcus(){
        var id = document.getElementById("id");
        id.value="";
    }
    //		鼠标点击后将name文本框清空
    function nameGetForcus(){
        var id = document.getElementById("name");
        id.value="";
    }
    //		将院系文本框清空
    function deptGetForcus(){
        var id = document.getElementById("dept");
        id.value="";
    }
    //		将科目文本框清空
    function subjectGetForcus(){
        var id = document.getElementById("subject");
        id.value="";
    }
    //		判断id是不是3位,不是的话报错
    //		判断id是不是3位,不是的话报错
    function idgetBlur(){
        var id = document.getElementById("id").value;
        var span = document.getElementById("id_span");
        if (id.length != 3){
            span.innerHTML = "id长度必须是3".fontcolor("red");
        }
        else
        {
            var flag = 0;
            for (var i=0; i<3; i++)
            {
                if(id[i]<'0' || id[i]>'9')
                {
                    flag = 1;
                    span.innerHTML = "id不能有字母".fontcolor("red");
                    break;
                }
            }
            if (flag == 0)
            {
                span.innerHTML="";
            }
        }
    }

    function jumpToSearch()
    {
        window.location.href = "ok.html";
    }

</script>

<body>
<h2 align="center">查询条件</h2>
<!--使用表格布局，去掉表格边框-->
<table align="center"  cellpadding="0" cellspacing="0" style="border:1px solid #000000;">

    <form action="/search" method="post">
        <%@include file="condition.jsp"%>
        <!--<tr>-->
            <!--<td  width="150px" height="50px">&nbsp;&nbsp;&nbsp;&nbsp;i d</td>-->
            <!--<td align="left">-->
                <!--<input type="text"  name="id" id="id" onfocus="idGetForcus()" onblur="idgetBlur()" value="请输入id" style="text-align: center; color: darkgray; width: 200px; height: 30px;" /><span id="id_text"></span>-->
            <!--</td>-->
        <!--</tr>-->
        <!--<tr>-->
            <!--<td  height="50px" >&nbsp;&nbsp;姓名</td>-->
            <!--<td align="left">-->
                <!--<input type="text"  value="请输入姓名"  name="name" id="name" onfocus="nameGetForcus()" style="text-align: center; color: darkgray; width: 200px; height: 30px;" />-->
            <!--</td>-->
        <!--</tr>-->
        <!--<tr >-->
            <!--<td  height="50px">&nbsp;&nbsp;性别</td>-->
            <!--<td align="left">-->
                <!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                <!--<input type="radio"  value="男"  name="gender"/>男-->
                <!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                <!--<input type="radio"  value="女"  name="gender"/>女-->
            <!--</td>-->
        <!--</tr>-->
        <!--<tr>-->
            <!--<td   height="50px" >&nbsp;&nbsp;年龄</td>-->
            <!--<td align="left">-->
                <!--<input type="number"  name="age" style="width: 200px; height: 30px;-->
                <!--text-align: center;"/>-->
            <!--</td>-->
        <!--</tr>-->

        <!--<tr >-->
            <!--<td   width="60px" height="50px">&nbsp;&nbsp;工龄</td>-->
            <!--<td align="left">-->
                <!--<input type="number"   name="work_age" style="width: 200px; height: 30px; text-align:-->
                <!--center;"/>-->
            <!--</td>-->
        <!--</tr>-->

        <!--<tr>-->
            <!--<td  width="60px" height="50px">&nbsp;&nbsp;院系</td>-->
            <!--<td align="left">-->
                <!--<input type="text"  id="dept" onfocus="deptGetForcus()" style=" width: 200px; height: 30px; text-align: center; color: darkgray;" value="请输入院系"  name="dept"/>-->
            <!--</td>-->
        <!--</tr>-->

        <!--<tr>-->
            <!--<td   width="60px" height="50px">&nbsp;&nbsp;科目</td>-->
            <!--<td align="left">-->
                <!--<input type="text" id="subject" onfocus="subjectGetForcus()" style=" width: 200px; height: 30px; text-align: center; color: darkgray;" value="请输入科目" name="subject"/>-->
            <!--</td>-->
        <!--</tr>-->

        <!--<tr>-->
            <!--<td  width="80px" height="50px">&nbsp;&nbsp;学历</td>-->
            <!--<td align="left">-->
                <!--<input type="radio"   name="eduction"  value="专科"/>专科-->
                <!--<input type="radio"   name="eduction" value="本科"/>本科-->
                <!--<input type="radio"   name="eduction" value="研究生"/>研究生-->
                <!--<input type="radio"   name="eduction" value="博士"/>博士-->
            <!--</td>-->
        <!--</tr>-->
        <tr>
            <td colspan="2" align="center" height="50px">
                <input type="submit" name="submit" id="submit" value="查询"
                       style=" font:
                '微软雅黑';
                font-size: x-large; background: #bc0105;"/>
            </td>
        </tr>
    </form>
</table>
</body>
</html>
