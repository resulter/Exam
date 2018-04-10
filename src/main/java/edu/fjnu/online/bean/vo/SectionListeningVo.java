package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;

@Data
public class SectionListeningVo {
    private Integer id;
    private String name;
    private List<SubjectListeningVo> subjectListeningVos;
    private Integer orderNum;
}
