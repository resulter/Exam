package edu.fjnu.online.bean;

import java.util.Date;

public class RRecordScore {
    private Integer id;

    private String userId;

    private String timeStr;

    private Date createTime;

    private Date submitTime;

    private Float readingScore;

    private Float listeningScore;

    private Float writingScore;

    private Float speakingScore;

    private Float sumScore;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getTimeStr() {
        return timeStr;
    }

    public void setTimeStr(String timeStr) {
        this.timeStr = timeStr == null ? null : timeStr.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    public Float getReadingScore() {
        return readingScore;
    }

    public void setReadingScore(Float readingScore) {
        this.readingScore = readingScore;
    }

    public Float getListeningScore() {
        return listeningScore;
    }

    public void setListeningScore(Float listeningScore) {
        this.listeningScore = listeningScore;
    }

    public Float getWritingScore() {
        return writingScore;
    }

    public void setWritingScore(Float writingScore) {
        this.writingScore = writingScore;
    }

    public Float getSpeakingScore() {
        return speakingScore;
    }

    public void setSpeakingScore(Float speakingScore) {
        this.speakingScore = speakingScore;
    }

    public Float getSumScore() {
        return sumScore;
    }

    public void setSumScore(Float sumScore) {
        this.sumScore = sumScore;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}