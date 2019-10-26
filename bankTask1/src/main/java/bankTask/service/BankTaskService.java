package bankTask.service;

import bankTask.entity.*;

import java.util.List;

public interface BankTaskService {

    public List<UserInfo> getUserInfo(String userName);

    public List<UserRoles> getUserRoles(String userName);

    public List<Client> getClients();

    public Client getClient(Long id);

    public void saveClients(Client client);

    public List<Account> getAccounts();

    public Account getAccount(Long id);

    public void saveAccount(Account account);

    public List<Client> getClientsLike(String filter);

    public void saveTransaction(Transaction transaction);

    public void doTransaction(Transaction transaction);

}
