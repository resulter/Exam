package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 我的答题记录页面vo
 */
@Data
public class RecordExamVo  {
    private String examName;
    private  String timeStr;

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

//    private List<Map<String,Integer>> myAnswers;
    private List<String> myWritingAnswers;
    private List<String> myWritingAnnotation;
    private List<Float> myWritingScore;

    private List <String> readingOne;//第？篇所选的答案
    private List <String> readingTwo;
    private List <String> listeningOne;
    private List <String> listeningTwo;
    private List <String> listeningThree;
    private List <Integer> readingOneRight;//第？篇是否正确
    private List <Integer> readingTwoRight;
    private List <Integer> listeningOneRight;
    private List <Integer> listeningTwoRight;
    private List <Integer> listeningThreeRight;
}
