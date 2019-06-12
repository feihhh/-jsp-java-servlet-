<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="per.fei.core.Condition.Condition" %>
<%@ page import="per.fei.service.MyService" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="per.fei.core.teacher.Teacher" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/5/14
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>search</title>
</head>
<body>
<h2 align="center" > 查询结果如下 </h2>
<table border="1px" align="center" cellspacing="0px" cellpadding="0px">
    <%
        LinkedHashSet<Teacher> teacher = (LinkedHashSet<Teacher>) request.getSession().getAttribute("teacher");
    %>
    <%@include file="print_table.jsp"%>
</table>
</body>
</html>
