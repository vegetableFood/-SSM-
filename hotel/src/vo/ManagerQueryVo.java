package vo;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class ManagerQueryVo implements Serializable {
    private Integer categoryId;
    private String subscriptionStatus;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sdate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date edate;
    private String no;
    private String username;

    public ManagerQueryVo() {
    }

    public ManagerQueryVo(Integer categoryId, String subscriptionStatus, Date sdate, Date edate, String no, String username) {
        this.categoryId = categoryId;
        this.subscriptionStatus = subscriptionStatus;
        this.sdate = sdate;
        this.edate = edate;
        this.no = no;
        this.username = username;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getSubscriptionStatus() {
        return subscriptionStatus;
    }

    public void setSubscriptionStatus(String subscriptionStatus) {
        this.subscriptionStatus = subscriptionStatus;
    }

    public Date getSdate() {
        return sdate;
    }

    public void setSdate(Date sdate) {
        this.sdate = sdate;
    }

    public Date getEdate() {
        return edate;
    }

    public void setEdate(Date edate) {
        this.edate = edate;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
