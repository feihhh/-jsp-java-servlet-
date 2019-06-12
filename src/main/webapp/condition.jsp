<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/5/28
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>condition</title>
</head>
<body>
<tr>
    <td  width="150px" height="50px">&nbsp;&nbsp;&nbsp;&nbsp;i d</td>
    <td align="left">
        <input type="text"  name="id" id="id" onfocus="idGetForcus()"
               onblur="idgetBlur()" value="请输入id"  style="text-align: center;
							   color: darkgray; width: 200px; height: 30px;" /><span
            id="id_span"></span>
    </td>
</tr>
<tr>
    <td  height="50px" >&nbsp;&nbsp;姓名</td>
    <td align="left">
        <input type="text"  value="请输入姓名"  name="name" id="name" onfocus="nameGetForcus()" style="text-align: center; color: darkgray; width: 200px; height: 30px;" />
    </td>
</tr>
<tr >
    <td  height="50px">&nbsp;&nbsp;性别</td>
    <td align="left">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio"  value="男"  name="gender"/>男
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio"  value="女"  name="gender"/>女
    </td>
</tr>
<tr>
    <td   height="50px" >&nbsp;&nbsp;年龄</td>
    <td align="left">
        <input type="number" name="age" value="" id="age" onblur="checkAge()"
               style="width: 200px;
						height:
						30px;
						text-align: center;"/><span id="age_span"></span>
    </td>
</tr>

<tr >
    <td   width="60px" height="50px">&nbsp;&nbsp;工龄</td>
    <td align="left">
        <input type="number"  id="work_age" value="" name="work_age" onblur="checkWorkAge()"
               style="width:
						200px;
						height:
						30px; text-align: center;"/><span id="work_age_span"></span>
    </td>
</tr>

<tr>
    <td  width="60px" height="50px">&nbsp;&nbsp;院系</td>
    <td align="left">
        <input type="text"  id="dept" onfocus="deptGetForcus()" style=" width: 200px; height: 30px; text-align: center; color: darkgray;" value="请输入院系"  name="dept"/>
    </td>
</tr>

<tr>
    <td   width="60px" height="50px">&nbsp;&nbsp;科目</td>
    <td align="left">
        <input type="text" id="subject" onfocus="subjectGetForcus()" style=" width: 200px; height: 30px; text-align: center; color: darkgray;" value="请输入科目" name="subject"/>
    </td>
</tr>

<tr>
    <td  width="80px" height="50px">&nbsp;&nbsp;学历</td>
    <td align="left">
        <input type="radio"   name="eduction"  value="专科"/>专科
        <input type="radio"   name="eduction" value="本科"/>本科
        <input type="radio"   name="eduction" value="研究生"/>研究生
        <input type="radio"   name="eduction" value="博士"/>博士
    </td>
</tr>
</body>
</html>
