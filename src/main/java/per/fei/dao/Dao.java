package per.fei.dao;

import per.fei.core.Condition.Condition;
import per.fei.core.teacher.Teacher;
import java.sql.*;
import java.util.LinkedHashSet;

/*
数据库操作，包括增删改查，改没用，最后的实现的 改操作是删除一个在添加一个实现的
 */
public class Dao {

    /**
     * 查询
     * @param condition 查询条件
     * @return 返回查询结果 LinkedHashSet相当于 LinkedList，可以自动去重
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public LinkedHashSet search(Condition condition) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        LinkedHashSet<Teacher> linked = new LinkedHashSet();
        try {
            // 获取Connection对象
            conn = this.getConn();
            // 获取查询的sql语句
            String sql = this.getSql(condition);
//            System.out.println(sql.toString());
//            准备SQL语句
            statement = conn.prepareStatement(sql);
//            执行SQL语句
            result = statement.executeQuery();
//            遍历结果集
            while (result.next()) {
                Teacher teacher = new Teacher();
                teacher.setAge(result.getInt("age"));
                teacher.setName(result.getString("name"));
                teacher.setGender(result.getString("gender"));
                teacher.setEducation(result.getString("eduction"));
                teacher.setDept(result.getString("dept"));
                teacher.setId(result.getString("id"));
                teacher.setSubject(result.getString("subject"));
                teacher.setWorkAge(result.getInt("work_age"));
                linked.add(teacher);
            }
        } finally {
            //关闭资源
            closeResource(conn, statement, result);
        }
        return linked;
    }

    /**
     * 插入
     * @param teacher 插入的老师
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public void insert(Teacher teacher) throws SQLException, ClassNotFoundException {
        if (teacher == null) {
            return;
        }
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            conn = this.getConn();
            String sql =
                    "insert into teacher (id, name, gender, age, work_age, dept, subject, eduction) " +
                            "values " +
                            "(?, ?, ?, ?, ?, ?, ?, ?) ;";

            statement = conn.prepareStatement(sql);

            statement.setString(1, teacher.getId());
            statement.setString(2, teacher.getName());
            statement.setString(3, teacher.getGender());
            statement.setInt(4, teacher.getAge());
            statement.setInt(5, teacher.getWorkAge());
            statement.setString(6, teacher.getDept());
            statement.setString(7, teacher.getSubject());
            statement.setString(8, teacher.getEducation());

            statement.executeUpdate();

        } finally {
            //关闭资源
            closeResource(conn, statement, result);
        }
    }

    /**
     * 删除
     * @param teacher 删除的老师
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public void delete(Teacher teacher) throws SQLException, ClassNotFoundException {
        if (teacher == null) {
            return;
        }
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            conn = this.getConn();
            StringBuffer sql = new StringBuffer();
            sql.append("delete from teacher where id = ");
            sql.append("'").append(teacher.getId()).append("'");
            statement = conn.prepareStatement(sql.toString());
            statement.executeUpdate();
        } finally {
            //关闭资源
            closeResource(conn, statement, result);
        }
    }

    /**
     * 修改 这个方法没有用，不用管
     * @param oldTeacher
     * @param newTeacher
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public void update(Teacher oldTeacher, Teacher newTeacher) throws SQLException, ClassNotFoundException {
        if (oldTeacher == null || newTeacher == null) {
            return;
        }
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/teacher";
            String useName = "root";
            String passwd = "123456";
            conn = DriverManager.getConnection(url, useName, passwd);
            //update teacher set name='aaixia', gender='',age ='',work_age='',dept='',subject=''
            //where id = '';
            StringBuffer sql = new StringBuffer();
            sql.append("update teacher set ");
            sql.append("name = '").append(newTeacher.getName()).append("', ");
            sql.append("gender = '").append(newTeacher.getGender()).append("', ");
            sql.append("age = ").append(newTeacher.getAge()).append(", ");
            sql.append("work_age = ").append(newTeacher.getWorkAge()).append(", ");
            sql.append("dept = '").append(newTeacher.getDept()).append("', ");
            sql.append("subject = '").append(newTeacher.getSubject()).append("' ");
            sql.append("eduction = '").append(newTeacher.getEducation()).append("' ");
            sql.append("where id = '").append(oldTeacher.getId()).append("';");
            statement = conn.prepareStatement(sql.toString());

            statement.executeUpdate();

        } finally {
            //关闭资源
            closeResource(conn, statement, result);
        }
    }

    /**
     * 关闭资源  吧上面每一个数据库操作里面需要的关闭资源提到一个方法里面
     */
    private static void closeResource(Connection conn, PreparedStatement statement, ResultSet result) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (result != null) {
            try {
                result.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    // 返回Connection对象，连接数据库用
    private Connection getConn () throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/teacher";
        String useName = "root";
        String passwd = "123456";
        Connection conn = DriverManager.getConnection(url, useName, passwd);
        return conn;
    }
    //根据查询条件，返回一个查询的sql语句
    private String getSql(Condition condition)
    {
        StringBuffer sql = new StringBuffer();
        sql.append("select id, name, gender, eduction, age, work_age, dept, subject " +
                "from teacher where (id is not null)");
        if (condition != null) {
            if (condition.getId() != null) {
                sql.append(" and (id = '").append(condition.getId()).append("')");
            }
            if (condition.getName() != null) {
                sql.append(" and (name = '").append(condition.getName()).append("')");
            }
            if (condition.getGender() != null) {
                sql.append(" and (gender = '").append(condition.getGender()).append("')");
            }
            if (condition.getEducation() != null) {
                sql.append(" and (eduction = '").append(condition.getEducation()).append("')");
            }
            if (condition.getAge() != null) {
                sql.append(" and (age = '").append(condition.getAge()).append("')");
            }
            if (condition.getWorkAge() != null) {
                sql.append(" and (work_age = '").append(condition.getWorkAge()).append("')");
            }
            if (condition.getDept() != null) {
                sql.append(" and (dept = '").append(condition.getDept()).append("')");
            }
            if (condition.getSubject() != null) {
                sql.append(" and (subject = '").append(condition.getSubject()).append("')");
            }
            sql.append(" order by id ");
        }
        return sql.toString();
    }
}