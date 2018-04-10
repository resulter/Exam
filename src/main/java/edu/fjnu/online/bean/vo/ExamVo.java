package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;
@Data
public class ExamVo {
    private  Integer id;
    private String name;
    private SectionReadingVo  reading;
    private SectionListeningVo  listening;
    private SectionSpeakingVo  speaking;
    private SectionWritingVo  writing;
    private String createTime;
}
