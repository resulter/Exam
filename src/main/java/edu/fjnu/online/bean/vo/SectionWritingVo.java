package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;

@Data
public class SectionWritingVo {
    private Integer id;
    private String name;
    private List<SubjectWritingVo> subjectWritingVos;
    private Integer orderNum;
}
