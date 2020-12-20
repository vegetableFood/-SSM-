package entity;

import java.io.Serializable;
import java.util.Date;

public class Reside implements Serializable {
    private Integer id;

    private Integer dtlid;

    private Date residedate;

    private String roomername;

    private String idcard;

    public Reside(Integer id, Integer dtlid, Date residedate, String roomername, String idcard) {
        this.id = id;
        this.dtlid = dtlid;
        this.residedate = residedate;
        this.roomername = roomername;
        this.idcard = idcard;
    }

    public Reside() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDtlid() {
        return dtlid;
    }

    public void setDtlid(Integer dtlid) {
        this.dtlid = dtlid;
    }

    public Date getResidedate() {
        return residedate;
    }

    public void setResidedate(Date residedate) {
        this.residedate = residedate;
    }

    public String getRoomername() {
        return roomername;
    }

    public void setRoomername(String roomername) {
        this.roomername = roomername == null ? null : roomername.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }
}