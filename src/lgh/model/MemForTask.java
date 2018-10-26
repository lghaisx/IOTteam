package lgh.model;

import javax.persistence.*;

@Entity
@Table(name = "iot_memfortask")
public class MemForTask {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;  //主键
    @Column(length = 30)
    private String grade;  //作业成绩
    @Column(length = 40)
    private String remark;   //作业评语
    private boolean state;  //作业批改状态
    @Column(columnDefinition = "text")
    private String taskAnswer;   //成员对作业的答案
    @ManyToOne(targetEntity = Member.class)
    @JoinColumn(name = "member_id")
    private Member member;
    @ManyToOne(targetEntity = Task.class)
    @JoinColumn(name = "task_id")
    private Task task;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public String getTaskAnswer() {
        return taskAnswer;
    }

    public void setTaskAnswer(String taskAnswer) {
        this.taskAnswer = taskAnswer;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }
}
