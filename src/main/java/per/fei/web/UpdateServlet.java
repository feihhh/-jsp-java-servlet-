package per.fei.web;

import per.fei.core.Condition.Condition;
import per.fei.core.teacher.Teacher;
import per.fei.service.MyService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashSet;

public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //      设置字符编码 为utf-8
        request.setCharacterEncoding("UTF-8"); //防止从服务器获取的数据乱码
        response.setContentType("text/html;charset=utf-8"); //防止写入浏览器的数据乱码
//        PrintWriter对应用来在浏览器输出内容
        PrintWriter writer = response.getWriter();
        String id = request.getParameter("id");
//        if (!MyService.idExist(id))
//        {
//            writer.write("不id存在...");
//        }
        System.out.println(id);
        // 设置一个查询条件，包含id，用来查询对应id的老师
        Condition condition = new Condition();
        condition.setId(id);
        LinkedHashSet<Teacher> teachers = MyService.search(condition);
        // 如果这个对应id的老师存在，就先将它删除，在浏览器端修改信息，
        // 然后将新改好的老师信息插入数据库
        if ( teachers != null && teachers.size() != 0)
        {
            MyService.delete(id, response);
            HttpSession session = request.getSession(true);
            session.setAttribute( "allTeacher",teachers);
            response.sendRedirect("update_main.jsp");
        }
        // 对应id的老师不存在，在浏览器端提示没有对应id的老师
        else
        {
            response.sendRedirect("failed.html");
        }
    }
}
