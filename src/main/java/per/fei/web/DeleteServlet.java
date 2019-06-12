package per.fei.web;

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

public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      设置字符编码 为utf-8
        request.setCharacterEncoding("UTF-8"); //防止从服务器获取的数据乱码
        response.setContentType("text/html;charset=utf-8"); //防止写入浏览器的数据乱码
        //        获取浏览器输入的id
//        PrintWriter对应用来在浏览器输出内容
        PrintWriter writer = response.getWriter();

        String id = request.getParameter("id");
        System.out.println(id);
//        删除对应id的老师
        MyService.delete(id, response);

    }
}
