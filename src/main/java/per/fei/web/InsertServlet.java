package per.fei.web;

import per.fei.service.MyService;
import per.fei.core.teacher.Teacher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class InsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        设置字符编码 为utf-8
        request.setCharacterEncoding("UTF-8"); //防止从服务器获取的数据乱码
        response.setContentType("text/html;charset=utf-8"); //防止写入浏览器界面乱码
//        PrintWriter 对象用来朝html界面输出文字
        PrintWriter writer = response.getWriter();
        System.out.println("id不存在...");
//            writer.write("id_not_exists");
//          将用户输入的信息封装到teacher对象中
        Teacher teacher = getInput(request);
//          如果 teacher 中有信息为空，添加失败
        MyService.insert(teacher, response);

    }

    private Teacher getInput(HttpServletRequest request) {
        Teacher teacher = new Teacher();
//        获取输入的数据，并将它赋值给teacher对应的属性
//        获取id
        teacher.setId(request.getParameter("id"));
//        获取name
        teacher.setName(request.getParameter("name"));;
//        获取gender
        teacher.setGender(request.getParameter("gender"));
//        获取age 年龄是整形值，getParameter返回的是String，先转为整形在赋值
        String tmp;
        teacher.setAge((tmp=request.getParameter("age")).equals("")?0:Integer.parseInt(tmp));
//        获取work_age  同上
        teacher.setWorkAge((tmp=request.getParameter("work_age")).equals("")?0:Integer.parseInt(tmp));
//        获取院系
        teacher.setDept(request.getParameter("dept"));
//        获取科目
        teacher.setSubject(request.getParameter("subject"));
//        获取学历
        teacher.setEducation(request.getParameter("eduction"));
        return teacher ;
    }
}
