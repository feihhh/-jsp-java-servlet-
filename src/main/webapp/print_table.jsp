<%@ page import="per.fei.core.teacher.Teacher" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="per.fei.service.MyService" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/5/17
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>print</title>
</head>
<body>

<table border="1px" align="center" cellspacing="0px" cellpadding="0px">
    <%
        out.print("<tr bgcolor=\"bisque\" align=\"center\" height=\"50px\"><th  width=\"230px\">id</th>");
        out.print("<th  width=\"230px\" >name</th>");
        out.print("<th  width=\"230px\" >gender</th>");
        out.print("<th  width=\"230px\" >age</th>");
        out.print("<th  width=\"230px\" >workAge</th>");
        out.print("<th  width=\"230px\">dept</th>");
        out.print("<th  width=\"230px\">subject</th>");
        out.print("<th  width=\"230px\">eduction</th></tr>");

        if(teacher == null || teacher.size() == 0) {
            out.print("<tr height = '50px'><td  width='100%' colspan='8' align = 'center'> 没有对应条件的老师~~~ </td></tr>");
        }
        else {
            for (Teacher t : teacher) {
                if (!t.getId().equals(request.getParameter("id"))){
                    out.print("<tr  bgcolor=\"aliceblue\" align=\"center\" height=\"50px\"><td width=\"250px\" class=\"idClass\">");
                    out.print(t.getId());
                    out.print("</td>");

                    out.print("<td width=\"250px\">");
                    out.print(t.getName());
                    out.print("</td>");

                    out.print("<td width=\"250px\">");
                    out.print(t.getGender());
                    out.print("</td>");

                    out.print("<td width=\"250px\">");
                    out.print(t.getAge());
                    out.print("</td>");

                    out.print("<td width=\"250px\">");
                    out.print(t.getWorkAge());
                    out.print("</td>");

                    out.print("<td width=\"250px\">");
                    out.print(t.getDept());
                    out.print("</td>");

                    out.print("<td width=\"250px\">");
                    out.print(t.getSubject());
                    out.print("</td>");

                    out.print("<td width=\"250px\">");
                    out.print(t.getEducation());
                    out.print("</td></tr>");
                }
            }
        }
    %>
</table>

</body>
</html>
