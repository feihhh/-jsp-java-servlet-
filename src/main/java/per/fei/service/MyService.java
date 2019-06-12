package per.fei.service;

import com.sun.deploy.net.HttpResponse;
import per.fei.core.Condition.Condition;
import per.fei.core.teacher.Teacher;
import per.fei.dao.Dao;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

public class MyService {
    public static void insert(Teacher teacher, HttpServletResponse response) throws IOException {
        Dao dao = new Dao();
        if (MyService.idExist(teacher.getId()))
        {
            response.sendRedirect("failed.html");
            return;
        }
        System.out.println(teacher);
        if (teacher.getAge() != null && teacher.getDept()!= null
                && teacher.getName() != null && teacher.getEducation() != null
                && teacher.getGender() != null && teacher.getSubject() != null
                && teacher.getWorkAge() != null && teacher.getId() != null)
        {
            try {
                dao.insert(teacher);
            } catch (Exception e) {
                response.sendRedirect("failed.html");
                e.printStackTrace();
            }
            response.sendRedirect("ok.html");
            return;
        }
        response.sendRedirect("failed.html");
    }

    public static LinkedHashSet<Teacher> search(Condition condition) {
        LinkedHashSet<Teacher> set = null;
        Dao dao = new Dao();
        try {
            set = dao.search(condition);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        finally {
            return set;
        }
    }

    public static void delete(String id , HttpServletResponse response) throws IOException {
        if (!idExist(id))
        {
            response.sendRedirect("failed.html");
            return;
        }
        Teacher teacher = new Teacher();
        teacher.setId(id);
        Dao dao = new Dao();
        try {
            dao.delete(teacher);
            response.sendRedirect("ok.html");
        } catch (Exception e) {
            response.sendRedirect("failed.html");
            System.out.println(e);
        }
    }

    /**
     * 是否存在id
     * 存在返回true
     * 不存在返回false
     */
    public static boolean idExist(String id)
    {
        Dao dao = new Dao();
        try {
            LinkedHashSet<Teacher> teachers = dao.search(null);
            List<String> list = new ArrayList();
            for (Teacher t : teachers)
            {
                list.add(t.getId());
            }
            if (list.contains(id))
            {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;

    }

    /**
     * 判读那一个字符串中是否只包含数字字符
     * @param str
     * @return 全是数字返回真，否则返回假
     */
    public static boolean isNum(String str) {
        if (str.equals("")) {
            return false;
        }
        char ch ;
        for (int i=0; i<str.length(); i++)
        {
            if ((ch = str.charAt(i))< '0' || ch > '9')
            {
                return false;
            }
        }
        return true;
    }
}
