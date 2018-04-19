package edu.fjnu.online.bean.vo;
/**
 * 考试时vo展示
 */

import lombok.Data;

@Data
public class ExamQuestionWritingVo {
    private Integer id;

    private String question;
    private String remark1;
    private String remark2;

    private Integer orderNum;
}
