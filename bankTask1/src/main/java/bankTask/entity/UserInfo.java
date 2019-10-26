package bankTask.entity;


import javax.persistence.*;

@Entity
@Table(name = "USERS")
public class UserInfo {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String userName;

    @Column
    private String password;

    /*@Column
    private Integer enabled;*/

    public UserInfo() {
    }

    public UserInfo(String userName, String password, Integer enabled) {
        this.userName = userName;
        this.password = password;
        /*this.enabled = enabled;*/
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    /*public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }*/
}
