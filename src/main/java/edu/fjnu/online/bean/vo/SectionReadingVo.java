package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;

@Data
public class SectionReadingVo {
    private Integer id;
    private String name;
    private List<SubjectReadingVo> subjectReadingVos;
    private Integer orderNum;
}
