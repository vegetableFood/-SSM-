package entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Subscription implements Serializable {
    private Integer id;

    private Integer mid;

    private String no;

    private String linkman;

    private String email;

    private String phone;

    private String status;
    //@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date cretime;

    private String remark;

    private List<Subscription_dtl> subscription_dtls;

    private Member member;

    public List<Subscription_dtl> getSubscription_dtls() {
        return subscription_dtls;
    }


    public Subscription(Integer id, Integer mid, String no, String linkman, String email, String phone, String status, Date cretime, String remark) {
        this.id = id;
        this.mid = mid;
        this.no = no;
        this.linkman = linkman;
        this.email = email;
        this.phone = phone;
        this.status = status;
        this.cretime = cretime;
        this.remark = remark;
    }

    public Subscription() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no == null ? null : no.trim();
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman == null ? null : linkman.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getCretime() {
        return cretime;
    }

    public void setCretime(Date cretime) {
        this.cretime = cretime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public void setSubscription_dtls(List<Subscription_dtl> subscription_dtls) {
        this.subscription_dtls = subscription_dtls;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }
}