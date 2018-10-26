package lgh.model;

import javax.persistence.*;

@Entity
@Table(name="iot_account")
@NamedQuery(name="Account.login",query="from Account where username=? and password=?") // 在查询语句前 添加实体类名称，确保不会出现重复
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;   //主键
    private String username;   //登录名
    private String name;     //真实姓名
    private String password;   //登录密码

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
