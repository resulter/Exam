package edu.fjnu.online.bean.vo;

import lombok.Data;
/**
 * 成绩查询页面数据vo
 */
import java.util.Date;

@Data
public class RRecordScoreVo {
    private Integer id;

    private String userId;

    private String timeStr;

    private String createTime;

    private String submitTime;

    private Float readingScore;

    private Float listeningScore;

    private Float writingScore;

    private Float speakingScore;

    private Float sumScore;

    private String remark;

    private  String examName;
}
