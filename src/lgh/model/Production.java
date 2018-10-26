package lgh.model;

import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;

import javax.persistence.*;
import java.util.Date;

/*
    作品表
 */
@Entity
@Table(name="iot_production")
@NamedQuery(name = "Production.search",query = "from Production where name like ?")
public class Production {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;  //主键
    private String name;  //作品名字
    @Column(columnDefinition = "text")
    private String content;  //作品内容
    @Temporal(TemporalType.TIMESTAMP)
    @Column(columnDefinition = "timestamp")
    private Date time;  //上传时间

    @ManyToOne(targetEntity = Member.class)
    @JoinColumn(name = "member_id")
    @LazyToOne(LazyToOneOption.FALSE)
    private Member member;   //上传成员

    private int readNum;  //浏览次数
    private int zan;  //点赞数
    private String fileName;  //文件名

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public int getReadNum() {
        return readNum;
    }

    public void setReadNum(int readNum) {
        this.readNum = readNum;
    }

    public int getZan() {
        return zan;
    }

    public void setZan(int zan) {
        this.zan = zan;
    }
}
