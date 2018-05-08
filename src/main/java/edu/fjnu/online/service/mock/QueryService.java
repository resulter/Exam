package edu.fjnu.online.service.mock;

import edu.fjnu.online.bean.RRecordScore;
import edu.fjnu.online.bean.vo.RRecordScoreVo;

import java.util.List;

public interface QueryService {
    List<RRecordScoreVo> getQueryScoreByUserID(String userId);
    String getExamName(String timeStr);
}
