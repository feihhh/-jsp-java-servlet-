<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insert</title>
	</head>

	<body>
	<h2 align="center" >添加老师信息</h2>
		<!--使用表格布局，去掉表格边框-->
		<table align="center"  cellpadding="0" cellspacing="0" style="border:1px solid #000000;">
			
			<form action="/insert" method="post">
				<%@include file="condition.jsp"%>
				<tr>
					<td colspan="2" align="center" height="50px">
						<input type="submit" name="submit" id="submit" value="添加" style=" font: '微软雅黑'; font-size: x-large; background: brown;"/>
					</td>
				</tr>
			</form>
		</table>
	</body>
	<script type="text/javascript">

		// 判断输入的id是否存在
        // function check() {
         //    // 获取id的span标签对象
         //    var span = document.getElementById("id_span");
         //    // 使用ajax
		// 	// 第一步：创建对象
         //    var xmlhttp;
         //    if (window.XMLHttpRequest)
         //    {// code for IE7+, Firefox, Chrome, Opera, Safari
         //        xmlhttp=new XMLHttpRequest();
         //    }
         //    else
         //    {// code for IE6, IE5
         //        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
         //    }
         //    // 第二步：执行回调函数
		// 	xmlhttp.onreadystatechange = function () {
		// 		if (xmlhttp.readyState == 4 && xmlhttp.state == 200) // 如果响应成功
		// 		{
		// 		    var str = xmlhttp.responseText;
		// 		    if (str == "id_exists")  // 如果id存在
		// 			{
         //                span.innerHTML="id已经存在".fontcolor("red");
		// 			}
		// 			else
		// 			{
		// 			    span.innerHTML="";
		// 			}
		// 		}
         //    }
         //    // 第三步：执行open操作
		// 	xmlhttp.open("get", "/insert");
         //    // 第四部：执行send操作
		// 	xmlhttp.send();
        // }

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
        //		id中不能含有字母
        //	点击id文本框的时候将里面的字清空
        function idGetForcus(){
            var id = document.getElementById("id");
            id.value="";
        }

        // id文本框失去焦点的时候判断id里面的内容是否合法
       function idgetBlur() {
           //		判断id是不是3位,不是的话报错
		   var id = document.getElementById("id").value;
		   var span = document.getElementById("id_span");
		   if (id.length != 3)
		   {
		       span.innerHTML="id长度必须是3".fontcolor("red");
		   }
		   else
		   {
		       var flag = 0;
		       for (var i=0; i<id.length; i++)
			   {
			       if (id[i]<'0' || id[i]>'9')
				   {
				       flag = 1;
				       span.innerHTML = "id中不能有字母".fontcolor("red");
				       break;
				   }
			   }
               // 如果没有字母而且长度是3位
			   if (flag == 0)
			   {
                    span.innerHTML="";
			   }
		   }
       }

       // 判断年龄是否合法
		function checkAge() {
			var age = document.getElementById("age").value;
			var span = document.getElementById("age_span");
			if (age < 18 || age > 60)
			{
			    span.innerHTML="年龄不合法".fontcolor("red");
			}
			else
			{
			    span.innerHTML="";
			}
        }

        function checkWorkAge() {
            var age = document.getElementById("age").value;
			var workAge = document.getElementById("work_age").value;
			var span = document.getElementById("work_age_span");
			if (workAge+18 > age || workAge < 0)
			{
			    span.innerHTML="工龄不合法".fontcolor("red");
			}
			else
			{
                span.innerHTML="";
			}
        }
	</script>
</html>
