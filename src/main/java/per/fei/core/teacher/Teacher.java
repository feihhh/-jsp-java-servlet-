package per.fei.core.teacher;

import lombok.Data;

@Data
public class Teacher {
    protected String id ; //工号
    protected String name ; //姓名
    protected String gender ; //性别
    protected  String education; //学历
    protected Integer age; //年龄
    protected Integer workAge; // 工龄
    protected String dept ; // 院系
    protected String subject ; // 科目

    public Teacher() { }

    public Teacher(String id, String name, String gender, String education, Integer age, Integer workAge, String dept, String subject) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.education = education;
        this.age = age;
        this.workAge = workAge;
        this.dept = dept;
        this.subject = subject;
    }
}
