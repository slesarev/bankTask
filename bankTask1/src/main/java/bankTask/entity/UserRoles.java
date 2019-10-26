package bankTask.entity;

import javax.persistence.*;

@Entity
@Table(name = "USER_ROLES")
public class UserRoles {
    @Id
    @Column(name = "ROLE_ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "USERNAME")
    private String userName;
    @Column(name = "USER_ROLE")
    private String userRole;

    public UserRoles(String userName, String userRole) {
        this.userName = userName;
        this.userRole = userRole;
    }

    public UserRoles() {

    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
}
