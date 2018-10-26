package lgh.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/*
作业表
 */
@Entity
@Table(name = "iot_task")
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;  //作业编号
    @Column(length = 30)
    private String title;  //作业标题
    @Column(columnDefinition = "text")
    private String cont;   //作业内容
    @Temporal(TemporalType.TIMESTAMP)
    @Column(columnDefinition = "timestamp")
    private Date time;   //发布时间
    @Column(columnDefinition = "text")
    private String question;   //作业答案
    private int commitNum;   //提交人数
    private String staut;
    private String gaishu;  //概述

    public String getGaishu() {
        return gaishu;
    }

    public void setGaishu(String gaishu) {
        this.gaishu = gaishu;
    }

    public String getStaut() {
        return staut;
    }

    public void setStaut(String staut) {
        this.staut = staut;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCont() {
        return cont;
    }

    public void setCont(String cont) {
        this.cont = cont;
    }
    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }


    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getCommitNum() {
        return commitNum;
    }

    public void setCommitNum(int commitNum) {
        this.commitNum = commitNum;
    }
}

