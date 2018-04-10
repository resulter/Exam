package edu.fjnu.online.bean;

public class QSpeakingQuestionWithBLOBs extends QSpeakingQuestion {
    private String questionDescription;

    private String questionUrl;

    private String demo1;

    private String demo2;

    public String getQuestionDescription() {
        return questionDescription;
    }

    public void setQuestionDescription(String questionDescription) {
        this.questionDescription = questionDescription == null ? null : questionDescription.trim();
    }

    public String getQuestionUrl() {
        return questionUrl;
    }

    public void setQuestionUrl(String questionUrl) {
        this.questionUrl = questionUrl == null ? null : questionUrl.trim();
    }

    public String getDemo1() {
        return demo1;
    }

    public void setDemo1(String demo1) {
        this.demo1 = demo1 == null ? null : demo1.trim();
    }

    public String getDemo2() {
        return demo2;
    }

    public void setDemo2(String demo2) {
        this.demo2 = demo2 == null ? null : demo2.trim();
    }
}