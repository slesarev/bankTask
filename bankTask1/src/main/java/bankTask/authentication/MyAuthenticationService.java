package bankTask.authentication;


import java.util.ArrayList;
import java.util.List;

import bankTask.service.BankTaskService;
import bankTask.entity.UserInfo;
import bankTask.entity.UserRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MyAuthenticationService implements UserDetailsService {

    @Autowired
    private BankTaskService bankTaskService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<UserInfo> listUserInfo = bankTaskService.getUserInfo(username);
        System.out.println("UserInfo= " + listUserInfo);
        UserInfo userInfo = null;
        if (listUserInfo == null) {
            throw new UsernameNotFoundException("User " + username + " was not found in the database");
        } else {
            userInfo = listUserInfo.get(0);
        }

        List<UserRoles> roles = bankTaskService.getUserRoles(username);

        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
        if (roles != null) {
            for (UserRoles role : roles) {
                GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role.getUserRole());
                grantList.add(authority);
            }
        }

        UserDetails userDetails = (UserDetails) new User(userInfo.getUserName(), userInfo.getPassword(), grantList);

        return userDetails;
    }
}
