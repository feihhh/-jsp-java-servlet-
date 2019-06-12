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
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.LinkedList;


import static per.fei.service.MyService.isNum;

public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //        设置字符编码 为utf-8
        request.setCharacterEncoding("UTF-8"); //防止从服务器获取的数据乱码
        response.setContentType("text/html;charset=utf-8"); //防止写入浏览器乱码
//        PrintWriter 对象用来朝html界面输出文字
        PrintWriter writer = response.getWriter();
        //获取查询条件
        Condition condition = getCondition(request);
        System.out.println(condition);
        LinkedHashSet<Teacher> teachers = MyService.search(condition);
//                创建session对象，用来在网页输出查询结果信息
        HttpSession session = request.getSession(true);
////        保存数据在session中
        session.setAttribute("teacher", teachers);
        response.sendRedirect("search.jsp");
//        request.setAttribute("findTeacher", MyService.search(condition));
//        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
    private Condition getCondition(HttpServletRequest request) {
        Condition condition = new Condition();
        String str ;
        if ((str = request.getParameter("id")) != null && !str.equals("请输入id") && !str.equals(""))
        {
            condition.setId(str);
        }
        if ((str = request.getParameter("name")) != null && !str.equals("请输入姓名") && !str.equals(""))
        {
            condition.setName(str);
        }
        if ((str = request.getParameter("gender")) != null && !str.equals(""))
        {
            condition.setGender(str);
        }
        if ((str = request.getParameter("age")) != null && isNum(str) && !str.equals(""))
        {
            condition.setAge(Integer.parseInt(str));
        }
        if ((str = request.getParameter("work_age")) != null && isNum(str) && !str.equals(""))
        {
            condition.setWorkAge(Integer.parseInt(str));
        }
        if ((str = request.getParameter("dept")) != null && !str.equals("请输入院系") && !str.equals(""))
        {
            condition.setDept(str);
        }
        if ((str = request.getParameter("subject")) != null && !str.equals("请输入科目") && !str.equals(""))
        {
            condition.setSubject(str);
        }
        if ((str = request.getParameter("eduction")) != null && !str.equals(""))
        {
            condition.setEducation(str);
        }
        return condition;
    }
}