package bankTask.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import bankTask.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BankTaskDAOImpl implements BankTaskDAO {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public List<UserInfo> getUserInfo(String userName) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<UserInfo> cq = cb.createQuery(UserInfo.class);
        Root<UserInfo> root = cq.from(UserInfo.class);
        cq.select(root).where(cb.equal(root.get("userName"), userName));
        Query query = session.createQuery(cq);
        return query.getResultList();
       /* Session currentSession = sessionFactory.getCurrentSession();
        UserInfo theCustomer = currentSession.get(UserInfo.class, userName);
        return theCustomer;*/
    }

    @Override
    public List<UserRoles> getUserRoles(String userName) {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<UserRoles> cq = cb.createQuery(UserRoles.class);
        Root<UserRoles> root = cq.from(UserRoles.class);
        cq.select(root).where(cb.equal(root.get("userName"), userName));
        Query query = session.createQuery(cq);
        return query.getResultList();
    }

    @Override
    public List<Client> getClients() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Client> cq = cb.createQuery(Client.class);
        Root<Client> root = cq.from(Client.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
    }

    @Override
    public void saveClients(Client client) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(client);
    }

    @Override
    public Client getClient(Long id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Client client = currentSession.get(Client.class, id);
        return client;
    }

    @Override
    public List<Account> getAccounts() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<Account> cq = cb.createQuery(Account.class);
        Root<Account> root = cq.from(Account.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
    }

    @Override
    public Account getAccount(Long id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Account account = currentSession.get(Account.class, id);
        return account;
    }

    @Override
    public void saveAccount(Account account) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(account);
    }

    @Override
    public List<Client> getClientsLike(String filter) {
        Session currentSession = sessionFactory.getCurrentSession();
        TypedQuery<Client> query = currentSession.createQuery(
                "SELECT c FROM Client c WHERE c.lastName LIKE concat('%',?1,'%')  OR c.firstName LIKE concat('%',?1,'%')" +
                        " OR c.patronymic LIKE concat('%',?1,'%') OR DATE_FORMAT(c.dateOfBirth,'%m %d %Y') " +
                        "LIKE concat('%',?1,'%')", Client.class);
        return query.setParameter(1, filter).getResultList();
    }

    @Override
    public void saveTransaction(Transaction transaction) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(transaction);
    }

    @Override
    public void doTransaction(Transaction transaction) {
        Session currentSession = sessionFactory.getCurrentSession();
        Account outAccount = transaction.getOutAccount();
        outAccount.setBalance(outAccount.getBalance() - transaction.getSum());
        Account inAccount = transaction.getInAccount();
        inAccount.setBalance(inAccount.getBalance() + transaction.getSum());
        currentSession.saveOrUpdate(outAccount);
        currentSession.saveOrUpdate(inAccount);
    }

}