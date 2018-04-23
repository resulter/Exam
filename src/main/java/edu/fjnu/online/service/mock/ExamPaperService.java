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

    QDescription getDescription(Integer sectionId);
}
