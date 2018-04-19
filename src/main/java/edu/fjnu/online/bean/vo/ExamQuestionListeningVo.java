package edu.fjnu.online.bean.vo;
/**
 * 考试时vo展示
 */

import lombok.Data;

import java.util.List;

@Data
public class ExamQuestionListeningVo {
    private Integer id;
    private String audioURL;
    private String imageURL;
    private String title;

    private Integer questionNum;
    private String question;
    private String questionURL;
    private Integer questionCount;

    private List<OptionListeningVo> optionListeningVos;

}
