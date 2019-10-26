package bankTask.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;
    @Column(name = "ACCOUNT_NUMBER")
    private String accountNumber;
    @Column(name = "OPEN_DATE")
    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private Date openDate;
    @Column(name = "BALANCE")
    private Double balance;
    @ManyToOne
    private Client client;
    @OneToMany(mappedBy = "outAccount", fetch = FetchType.EAGER)
    private List<Transaction> inTransactionList;
    @OneToMany(mappedBy = "inAccount", fetch = FetchType.EAGER)
    private List<Transaction> outTransactionList;

    public Account(String accountNumber, Date openDate, Double balance) {
        this.accountNumber = accountNumber;
        this.openDate = openDate;
        this.balance = balance;
    }

    public Account() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public Date getOpenDate() {
        return openDate;
    }

    public void setOpenDate(Date openDate) {
        this.openDate = openDate;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Client getClient() {
        return client;
    }

    public List<Transaction> getInTransactionList() {
        return inTransactionList;
    }

    public void setInTransactionList(List<Transaction> inTransactionList) {
        this.inTransactionList = inTransactionList;
    }

    public List<Transaction> getOutTransactionList() {
        return outTransactionList;
    }

    public void setOutTransactionList(List<Transaction> outTransactionList) {
        this.outTransactionList = outTransactionList;
    }

    @Override
    public String toString() {
        return "Account{" +
                "Account number ='" + accountNumber + '\'' +
                ", Open date =" + openDate +
                ", Balance =" + balance +
                '}';
    }
}
