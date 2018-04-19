package edu.fjnu.online.bean.vo;
/**
 * 考试时vo展示
 */

import lombok.Data;

import java.util.List;

@Data
public class ExamQuestionSpeakingVo {
    private Integer id;

    private String question;
    private String questionURL;
    private Integer questionCount;

    private Integer orderNum;
}
