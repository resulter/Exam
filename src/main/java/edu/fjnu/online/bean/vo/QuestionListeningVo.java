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

    private String myAnswer;//我的答案，查看我的答题记录是用
    private Integer myAnswerIsRight;
}
