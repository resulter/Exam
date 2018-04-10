package edu.fjnu.online.bean;

import java.util.Date;

public class QExam {
    private Integer id;

    private String name;

    private Integer readingSectionId;

    private Integer listeningSectionId;

    private Integer speakingSectionId;

    private Integer writingSectionId;

    private Date createTime;

    private String reamrk;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getReadingSectionId() {
        return readingSectionId;
    }

    public void setReadingSectionId(Integer readingSectionId) {
        this.readingSectionId = readingSectionId;
    }

    public Integer getListeningSectionId() {
        return listeningSectionId;
    }

    public void setListeningSectionId(Integer listeningSectionId) {
        this.listeningSectionId = listeningSectionId;
    }

    public Integer getSpeakingSectionId() {
        return speakingSectionId;
    }

    public void setSpeakingSectionId(Integer speakingSectionId) {
        this.speakingSectionId = speakingSectionId;
    }

    public Integer getWritingSectionId() {
        return writingSectionId;
    }

    public void setWritingSectionId(Integer writingSectionId) {
        this.writingSectionId = writingSectionId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getReamrk() {
        return reamrk;
    }

    public void setReamrk(String reamrk) {
        this.reamrk = reamrk == null ? null : reamrk.trim();
    }
}