package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;
@Data
public class SubjectListeningVo {
    private Integer id;
    private String autioURL;
    private String imageURL;
    private String title;
    private String titleCn;
    private List<QuestionListeningVo> questionListeningVos;
    private Integer orderNum;
}
