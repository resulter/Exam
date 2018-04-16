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
    private String readingName;
    private String listeningName;
    private String speakingName;
    private String writingName;
    private Integer readingId;
    private Integer listeningId;
    private Integer speakingId;
    private Integer writingId;
    private String createTime;
    private String remark;
}
