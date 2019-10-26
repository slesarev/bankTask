package bankTask.service;

import bankTask.entity.*;
import bankTask.dao.BankTaskDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BankTaskServiceImpl implements BankTaskService {

    @Autowired
    private BankTaskDAO bankTaskDAO;

    @Override
    @Transactional
    public List<UserInfo> getUserInfo(String userName) {
        return bankTaskDAO.getUserInfo(userName);
    }

    @Override
    @Transactional
    public List<UserRoles> getUserRoles(String userName) {
        return bankTaskDAO.getUserRoles(userName);
    }

    @Override
    @Transactional
    public List<Client> getClients() {
        return bankTaskDAO.getClients();
    }

    @Override
    @Transactional
    public void saveClients(Client client) {
        bankTaskDAO.saveClients(client);
    }

    @Override
    @Transactional
    public Client getClient(Long id) {
        return bankTaskDAO.getClient(id);
    }

    @Override
    @Transactional
    public List<Account> getAccounts() {
        return bankTaskDAO.getAccounts();
    }

    @Override
    @Transactional
    public Account getAccount(Long id) {
        return bankTaskDAO.getAccount(id);
    }

    @Override
    @Transactional
    public void saveAccount(Account account) {
        bankTaskDAO.saveAccount(account);
    }

    @Override
    @Transactional
    public List<Client> getClientsLike(String filter) {
        return bankTaskDAO.getClientsLike(filter);
    }

    @Override
    @Transactional
    public void saveTransaction(Transaction transaction) {
        bankTaskDAO.saveTransaction(transaction);
    }

    @Override
    @Transactional
    public void doTransaction(Transaction transaction) {
        bankTaskDAO.doTransaction(transaction);
    }
}
