package edu.fjnu.online.bean;

public class QReadingSection {
    private Integer id;

    private String name;

    private Integer examId;

    private Integer remark;

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

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public Integer getRemark() {
        return remark;
    }

    public void setRemark(Integer remark) {
        this.remark = remark;
    }
}