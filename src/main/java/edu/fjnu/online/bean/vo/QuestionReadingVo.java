package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;

@Data
public class QuestionReadingVo {
    private Integer id;
    private  String question;
    private String rightAnswer;
    private List<OptionReadingVo> optionReadingVos;
    private Integer orderNum;

    private String myAnswer;//我的答案，查看我的答题记录是用
    private Integer myAnswerIsRight;
}
