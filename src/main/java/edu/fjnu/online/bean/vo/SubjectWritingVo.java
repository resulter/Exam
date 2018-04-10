package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;
@Data
public class SubjectWritingVo {
    private Integer id;
    private List<QuestionWritingVo> questionWritingVos;
    private Integer orderNum;
}
