package edu.fjnu.online.bean.vo;
/**
 * 考试时vo展示
 */

import lombok.Data;

import java.util.List;

@Data
public class ExamQuestionReadingVo {
    private Integer id;
    private String passageTitle;
    private String passage;

    private Integer questionNum;
    private String queation;
    private Integer questionCount;

    private List<OptionReadingVo> optionReadingVos;

}
