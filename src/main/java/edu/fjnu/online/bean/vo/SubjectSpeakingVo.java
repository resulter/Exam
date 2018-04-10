package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;
@Data
public class SubjectSpeakingVo {
    private Integer id;
    private List<QuestionSpeakingVo> questionSpeakingVos;
    private Integer orderNum;
}
