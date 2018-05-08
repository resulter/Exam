package edu.fjnu.online.service.mock;

import edu.fjnu.online.bean.vo.RRecordScoreVo;
import edu.fjnu.online.bean.vo.RecordExamVo;
import edu.fjnu.online.bean.vo.RecordVo;

import java.util.List;

public interface RecordService {
   List<RecordVo> getRecordByUserID(String userID);
   RecordExamVo geteExamRecordInfoByTimeStr(String timeStr,Integer onlyWrong);//onlyWrong用来标记是否只要错题 默认0不是，设置选中后为1则是
}
