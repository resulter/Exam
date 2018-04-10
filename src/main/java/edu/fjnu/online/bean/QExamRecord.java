package edu.fjnu.online.bean;

public class QExamRecord {
    private Integer id;

    private Integer userId;

    private Integer readingQuestionId;

    private String readingAnswer;

    private Integer readingRight;

    private Integer listeningQuestionId;

    private String listeningAnswer;

    private Integer listeningRight;

    private Integer speakingQuestionId;

    private String speakingAnswerReamrk;

    private Integer writingQuestionId;

    private Integer writingAnswerWordCount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getReadingQuestionId() {
        return readingQuestionId;
    }

    public void setReadingQuestionId(Integer readingQuestionId) {
        this.readingQuestionId = readingQuestionId;
    }

    public String getReadingAnswer() {
        return readingAnswer;
    }

    public void setReadingAnswer(String readingAnswer) {
        this.readingAnswer = readingAnswer == null ? null : readingAnswer.trim();
    }

    public Integer getReadingRight() {
        return readingRight;
    }

    public void setReadingRight(Integer readingRight) {
        this.readingRight = readingRight;
    }

    public Integer getListeningQuestionId() {
        return listeningQuestionId;
    }

    public void setListeningQuestionId(Integer listeningQuestionId) {
        this.listeningQuestionId = listeningQuestionId;
    }

    public String getListeningAnswer() {
        return listeningAnswer;
    }

    public void setListeningAnswer(String listeningAnswer) {
        this.listeningAnswer = listeningAnswer == null ? null : listeningAnswer.trim();
    }

    public Integer getListeningRight() {
        return listeningRight;
    }

    public void setListeningRight(Integer listeningRight) {
        this.listeningRight = listeningRight;
    }

    public Integer getSpeakingQuestionId() {
        return speakingQuestionId;
    }

    public void setSpeakingQuestionId(Integer speakingQuestionId) {
        this.speakingQuestionId = speakingQuestionId;
    }

    public String getSpeakingAnswerReamrk() {
        return speakingAnswerReamrk;
    }

    public void setSpeakingAnswerReamrk(String speakingAnswerReamrk) {
        this.speakingAnswerReamrk = speakingAnswerReamrk == null ? null : speakingAnswerReamrk.trim();
    }

    public Integer getWritingQuestionId() {
        return writingQuestionId;
    }

    public void setWritingQuestionId(Integer writingQuestionId) {
        this.writingQuestionId = writingQuestionId;
    }

    public Integer getWritingAnswerWordCount() {
        return writingAnswerWordCount;
    }

    public void setWritingAnswerWordCount(Integer writingAnswerWordCount) {
        this.writingAnswerWordCount = writingAnswerWordCount;
    }
}