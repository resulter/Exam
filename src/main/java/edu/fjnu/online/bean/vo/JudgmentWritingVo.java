package edu.fjnu.online.bean.vo;

import lombok.Data;

@Data
public class JudgmentWritingVo {
    private Integer id;
    private String userId;
    private String userName;
    private String timeStr;

    private Integer examId;
    private String examName;
    private String createTime;

    private Integer questionId;
    private String question;
    private String answer;
    private Integer wordCount;
    private String submitTime;
    private float score;
    private float scoreOne;
    private float scoreTwo;

    private String remark;
    private  String judgementStatus;


}
