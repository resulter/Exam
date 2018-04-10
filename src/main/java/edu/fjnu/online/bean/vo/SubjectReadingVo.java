package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;

@Data
public class SubjectReadingVo {
    private Integer id;
    private String passage;
    private String passageTitle;
    private  String passageTitleCn;
    private List<QuestionReadingVo>  questionReadingVos;
    private Integer orderNum;
}
