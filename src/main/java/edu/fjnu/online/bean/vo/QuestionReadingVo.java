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
}
