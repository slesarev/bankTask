package bankTask.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "TRANSACTIONS")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "SUM")
    private Double sum;
    @Column(name = "DATE")
    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private Date date;

    @ManyToOne
    private Account outAccount;

    @ManyToOne
    private Account inAccount;

    public Transaction(Double sum, Date date) {
        this.sum = sum;
        this.date = date;
    }

    public Transaction() {

    }

    public Double getSum() {
        return sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Account getOutAccount() {
        return outAccount;
    }

    public void setOutAccount(Account outAccount) {
        this.outAccount = outAccount;
    }

    public Account getInAccount() {
        return inAccount;
    }

    public void setInAccount(Account inAccount) {
        this.inAccount = inAccount;
    }
}
