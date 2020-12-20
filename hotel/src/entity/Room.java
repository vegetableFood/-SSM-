package entity;

import java.io.Serializable;

public class Room implements Serializable {
    private Integer id;

    private Integer cid;

    private String no;

    private String status;

    public Room(Integer id, Integer cid, String no, String status) {
        this.id = id;
        this.cid = cid;
        this.no = no;
        this.status = status;
    }

    public Room() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no == null ? null : no.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}