package lgh.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/*
成员表
 */
@Entity
@Table(name = "iot_member")
@NamedQueries({
        @NamedQuery(name = "Name.query", query = "from Member order by active desc"),
        @NamedQuery(name = "Name.login", query = "from Member where number = ? and pwd = ?")
}
)
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;  //主键
    @Column(length = 30)
    private String name;   //姓名
    @Column(length = 30)
    private String number;  //学号
    @Column(length = 30)
    private String qq;   //qq账号
    @Column(length = 30)
    private String telephone;   //手机号码
    private Double active;    //活力值
    private String pwd;  //密码
    private String zhuanYe;  //专业
    private String motto;  //座右铭
    @OneToMany(targetEntity = Production.class,cascade = CascadeType.ALL,mappedBy = "member")
    private Set<Production> productions = new HashSet<>();
    @OneToMany(targetEntity = MemForTask.class,cascade = CascadeType.ALL,mappedBy = "member")
    private Set<MemForTask> memForTasks = new HashSet<>();

    public Set<MemForTask> getMemForTasks() {
        return memForTasks;
    }

    public void setMemForTasks(Set<MemForTask> memForTasks) {
        this.memForTasks = memForTasks;
    }

    public Set<Production> getProductions() {
        return productions;
    }

    public void setProductions(Set<Production> productions) {
        this.productions = productions;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Double getActive() {
        return active;
    }

    public void setActive(Double active) {
        this.active = active;
    }

    public String getZhuanYe() {
        return zhuanYe;
    }

    public void setZhuanYe(String zhuanYe) {
        this.zhuanYe = zhuanYe;
    }

    public String getMotto() {
        return motto;
    }

    public void setMotto(String motto) {
        this.motto = motto;
    }
}
