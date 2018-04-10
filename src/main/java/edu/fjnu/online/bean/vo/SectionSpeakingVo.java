package edu.fjnu.online.bean.vo;

import lombok.Data;
import org.omg.CORBA.PRIVATE_MEMBER;

import javax.print.DocFlavor;
import java.util.List;

@Data
public class SectionSpeakingVo {
    private Integer id;
    private String name;
    private List<SubjectSpeakingVo> subjectSpeakingVos;
    private Integer orderNum;
}
