package edu.fjnu.online.service.mock;

import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.QExam;
import edu.fjnu.online.bean.vo.*;

import java.util.List;
import java.util.Map;

public interface ExamPaperService {
    List<ExamVo> findAllExam();

    ExamVo getExamPaperById(Integer paperId);//拿到试卷

    List<ExamVo> getAllExam();

    PageInfo<ExamVo> getAllExamPage(Integer pageNo, Integer pageSize);

    Map<Integer, String> getAllReadingSection();

    Map<Integer, String> getAllListeningSection();

    Map<Integer, String> getAllSpeakingSection();

    Map<Integer, String> getAllWritingSection();

    Integer insertExamPaper(QExam qExam);//如果id为空，则插入；如果id存在，则更新

    void deleteExamPaper(Integer papaerId);

    QExam getExamById(Integer paperId);

    List<ExamQuestionReadingVo> getQuestionWithPassage(Integer paperId, Integer subjectOrder, Integer questionOrder);

    PageInfo<ExamQuestionReadingVo> getReadingQuestionWithPassagePage(Integer pageNo, Integer pageSize,Integer paperId, Integer subjectOrder, Integer questionOrder);

    PageInfo<ExamQuestionListeningVo> getListeningQuestionWithPassagePage(Integer pageNo, Integer pageSize, Integer paperId, Integer subjectOrder, Integer questionOrder);

    ExamQuestionSpeakingVo getSpeakingQuestionWithPassagePage(Integer paperId, Integer subjectOrder);

    ExamQuestionWritingVo getWritingQuestionWithPassagePage(Integer paperId, Integer subjectOrder);
}
