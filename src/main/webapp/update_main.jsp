<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="per.fei.core.teacher.Teacher" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/5/17
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update_main</title>
</head>
<body>

<table align="center"  cellpadding="0" cellspacing="0" style="border:1px solid #000000;">
    <%
        LinkedHashSet<Teacher> list = (LinkedHashSet) request.getSession().getAttribute("allTeacher");
        Teacher teacher = null;
        for (Teacher t : list)
        {
            teacher = t;
            break;
        }
    %>


    <form action="/insert" method="post">
        <tr>
            <td  width="150px" height="50px">&nbsp;&nbsp;&nbsp;&nbsp;i d</td>
            <td align="left">
                <input type="text"  name="id" id="id" onfocus="idGetForcus()"
                       onblur="idgetBlur()" value="<%=teacher.getId()%>" style="text-align: center;
                       color: darkgray; width: 200px; height: 30px;" /><span id="id_text"></span>
            </td>
        </tr>
        <tr>
            <td  height="50px" >&nbsp;&nbsp;姓名</td>
            <td align="left">
                <input type="text"  value=<%=teacher.getName()%>  name="name" id="name"
                       onfocus="nameGetForcus()"
                       style="text-align: center; color: darkgray; width: 200px; height: 30px;" />
            </td>
        </tr>
        <tr >
            <td  height="50px">&nbsp;&nbsp;性别</td>
            <td align="left">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input  type="radio"  value="男"  name="gender"
                    <%
                        if (teacher.getGender().equals("男"))
                        {
                            out.print("checked=\"checked\"");
                        }
                    %>
                />男
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio"  value="女"  name="gender"
                    <%
                        if (teacher.getGender().equals("女"))
                        {
                            out.print("checked=\"checked\"");
                        }
                    %>
                />女
            </td>
        </tr>
        <tr>
            <td   height="50px" >&nbsp;&nbsp;年龄</td>
            <td align="left">
                <input type="number" value="<%=teacher.getAge()%>" name="age" style="width: 200px;
                 height:
						30px;
						text-align: center;"/>
            </td>
        </tr>

        <tr >
            <td   width="60px" height="50px">&nbsp;&nbsp;工龄</td>
            <td align="left">
                <input type="number" value=<%=teacher.getWorkAge()%>  name="work_age"
                       style="width: 200px;
						height:
						30px; text-align: center;"/>
            </td>
        </tr>

        <tr>
            <td  width="60px" height="50px">&nbsp;&nbsp;院系</td>
            <td align="left">
                <input type="text"  id="dept" onfocus="deptGetForcus()" style=" width: 200px;
                height: 30px; text-align: center; color: darkgray;" value="<%=teacher.getDept()%>"
                       name="dept"/>
            </td>
        </tr>

        <tr>
            <td   width="60px" height="50px">&nbsp;&nbsp;科目</td>
            <td align="left">
                <input type="text" id="subject" onfocus="subjectGetForcus()" style="
                width: 200px; height: 30px; text-align: center; color: darkgray;" value="<%=teacher.getSubject()%>"
                       name="subject"/>
            </td>
        </tr>

        <tr>
            <td  width="80px" height="50px">&nbsp;&nbsp;学历</td>
            <td align="left">
                <input type="radio"   name="eduction"  value="专科"
                        <%
                            if (teacher.getEducation().equals("专科"))
                            {
                                out.print("checked=\"checked\"");
                            }
                        %>
                />专科
                <input type="radio"   name="eduction" value="本科"
                        <%
                            if (teacher.getEducation().equals("本科"))
                            {
                                out.print("checked=\"checked\"");
                            }
                        %>
                />本科
                <input type="radio"   name="eduction" value="研究生"
                        <%
                            if (teacher.getEducation().equals("研究生"))
                            {
                                out.print("checked=\"checked\"");
                            }
                        %>
                />研究生
                <input type="radio"   name="eduction" value="博士"
                        <%
                            if (teacher.getEducation().equals("博士"))
                            {
                                out.print("checked=\"checked\"");
                            }
                        %>
                />博士
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" height="50px">
                <input type="submit" name="submit" id="submit" value="修改" style=" font: '微软雅黑';
                font-size: x-large; background: brown;"/>
            </td>
        </tr>
    </form>
</table>




</body>
</html>
