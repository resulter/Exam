package edu.fjnu.online.bean;

public class QExamRecordWithBLOBs extends QExamRecord {
    private String speakngAnswerUrl;

    private String writingAnswerContent;

    public String getSpeakngAnswerUrl() {
        return speakngAnswerUrl;
    }

    public void setSpeakngAnswerUrl(String speakngAnswerUrl) {
        this.speakngAnswerUrl = speakngAnswerUrl == null ? null : speakngAnswerUrl.trim();
    }

    public String getWritingAnswerContent() {
        return writingAnswerContent;
    }

    public void setWritingAnswerContent(String writingAnswerContent) {
        this.writingAnswerContent = writingAnswerContent == null ? null : writingAnswerContent.trim();
    }
}