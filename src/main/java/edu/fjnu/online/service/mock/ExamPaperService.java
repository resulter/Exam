package edu.fjnu.online.service.mock;

import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.QDescription;
import edu.fjnu.online.bean.QExam;
import edu.fjnu.online.bean.vo.*;

import java.util.List;
import java.util.Map;

public interface ExamPaperService {
    List<ExamVo> findAllExam();

    ExamVo getExamPaperById(Integer paperId);//拿到试卷

    List<ExamVo> getAllExam();

    PageInfo<ExamVo> getAllExamPage(Integer pageNo, Integer pageSize);

    PageInfo<JudgmentWritingVo> getAllWritingRecord(Integer pageNo, Integer pageSize);
    PageInfo<JudgmentWritingVo> getAllWritingRecordWithCondition(Integer pageNo, Integer pageSize, String userName, String examName, String startDate, String endDate, Integer type);

    JudgmentWritingVo getOneWritingRecord(Integer id);

    Map<Integer, String> getAllReadingSection();

    Map<Integer, String> getAllListeningSection();

    Map<Integer, String> getAllSpeakingSection();

    Map<Integer, String> getAllWritingSection();

    Integer insertExamPaper(QExam qExam);//如果id为空，则插入；如果id存在，则更新

    void deleteExamPaper(Integer papaerId);

    QExam getExamById(Integer paperId);

    List<ExamQuestionReadingVo> getQuestionWithPassageReading(Integer paperId, Integer subjectOrder, Integer questionOrder);

    List<ExamQuestionListeningVo> getQuestionWithPassageListening(Integer paperId, Integer subjectOrder, Integer questionOrder);

    List<ExamQuestionSpeakingVo> getQuestionWithPassageSpeaking(Integer paperId, Integer subjectOrder);

    List<ExamQuestionWritingVo> getQuestionWithPassageWriting(Integer paperId, Integer subjectOrder);

    PageInfo<ExamQuestionReadingVo> getReadingQuestionWithPassagePage(Integer pageNo, Integer pageSize, Integer paperId, Integer subjectOrder, Integer questionOrder);

    PageInfo<ExamQuestionListeningVo> getListeningQuestionWithPassagePage(Integer pageNo, Integer pageSize, Integer paperId, Integer subjectOrder, Integer questionOrder);

    ExamQuestionSpeakingVo getSpeakingQuestionWithPassagePage(Integer paperId, Integer subjectOrder);

    ExamQuestionWritingVo getWritingQuestionWithPassagePage(Integer paperId, Integer subjectOrder);

    QDescription getDescription(Integer sectionId);//获取答题前题目描述

    void saveReadingOption(String userId,Integer paperId,String timeStr,String subjectOrder,String answer,Integer examType);//保存阅读答题记录
    void saveListeningOption(String userId,Integer paperId,String timeStr,String subjectOrder,String answer,Integer examType);//保存听力答题记录
    void saveWriting(String userId,Integer paperId,String timeStr,String subjectOrder,String answer);//保存写作记录
    void saveWritingScore(Integer id,float score,String annotation);//保存写作分数

}
