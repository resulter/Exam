package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;

@Data
public class QuestionListeningVo {
    private Integer id;
    private String question;
    private String questionURL;
    private String rightAnswer;
    private List<OptionListeningVo> optionListeningVos;
    private Integer orderNum;
}
