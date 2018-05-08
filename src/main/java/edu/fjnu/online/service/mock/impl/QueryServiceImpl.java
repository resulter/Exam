package edu.fjnu.online.service.mock.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.*;
import edu.fjnu.online.bean.vo.*;
import edu.fjnu.online.domain.User;
import edu.fjnu.online.mapper.*;
import edu.fjnu.online.service.UserService;
import edu.fjnu.online.service.mock.ExamPaperService;
import edu.fjnu.online.service.mock.QueryService;
import edu.fjnu.online.util.BaseConstant;
import edu.fjnu.online.util.DateUtils;
import edu.fjnu.online.util.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.beans.Beans;
import java.util.*;

@Service
public class QueryServiceImpl implements QueryService {
    @Autowired
    RRecordScoreMapper rRecordScoreMapper;

    @Autowired
    RRecordWritingMapper rRecordWritingMapper;

    @Autowired
    QExamMapper qExamMapper;

    @Override
    public List<RRecordScoreVo> getQueryScoreByUserID(String userId) {
        RRecordScoreExample rRecordScoreExample = new RRecordScoreExample();
        rRecordScoreExample.createCriteria().andUserIdEqualTo(userId);
        List<RRecordScore> rRecordScores = rRecordScoreMapper.selectByExample(rRecordScoreExample);
        List<RRecordScoreVo> result = new ArrayList<>();
        for (RRecordScore rRecordScore:rRecordScores) {
            RRecordScoreVo rRecordScoreVo = new RRecordScoreVo();
            rRecordScoreVo.setId(rRecordScore.getId());
            rRecordScoreVo.setCreateTime(DateUtils.formatDateTime(rRecordScore.getCreateTime()));
            rRecordScoreVo.setSubmitTime(DateUtils.formatDateTime(rRecordScore.getSubmitTime()));
            rRecordScoreVo.setUserId(rRecordScore.getUserId());
            rRecordScoreVo.setTimeStr(rRecordScore.getTimeStr());
            rRecordScoreVo.setReadingScore(rRecordScore.getReadingScore());
            rRecordScoreVo.setListeningScore(rRecordScore.getListeningScore());
            rRecordScoreVo.setWritingScore(rRecordScore.getWritingScore());
            rRecordScoreVo.setSpeakingScore(rRecordScore.getSpeakingScore());
            rRecordScoreVo.setSumScore(rRecordScore.getSumScore());
            rRecordScoreVo.setRemark(rRecordScore.getRemark());

            RRecordWritingExample rRecordWritingExample = new RRecordWritingExample();
            rRecordWritingExample.createCriteria().andTimeStrEqualTo(rRecordScore.getTimeStr());
            RRecordWritingWithBLOBs rRecordWritingWithBLOBs = rRecordWritingMapper.selectByExampleWithBLOBs(rRecordWritingExample).get(0);

            QExamExample qExamExample = new QExamExample();
            qExamExample.createCriteria().andIdEqualTo(rRecordWritingWithBLOBs.getExamId());
            rRecordScoreVo.setExamName(qExamMapper.selectByExample(qExamExample).get(0).getName());
            result.add(rRecordScoreVo);
        }
        return result;
    }

    @Override
    public String getExamName(String timeStr) {
        RRecordWritingExample rRecordWritingExample = new RRecordWritingExample();
        rRecordWritingExample.createCriteria().andTimeStrEqualTo(timeStr);
        RRecordWritingWithBLOBs rRecordWritingWithBLOBs = rRecordWritingMapper.selectByExampleWithBLOBs(rRecordWritingExample).get(0);

        QExamExample qExamExample = new QExamExample();
        qExamExample.createCriteria().andIdEqualTo(rRecordWritingWithBLOBs.getExamId());

        return qExamMapper.selectByExample(qExamExample).get(0).getName();
    }
}
