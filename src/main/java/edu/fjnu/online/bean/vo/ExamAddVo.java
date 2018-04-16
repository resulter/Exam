package edu.fjnu.online.bean.vo;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class ExamAddVo {
    private  Integer id;
    private String name;
    Map<Integer,String> readingSelect;
    Map<Integer,String> listeningSelect;
    Map<Integer,String> speakingSelect;
    Map<Integer,String> writingSelect;
    private String createTime;
    private String remark;
}
