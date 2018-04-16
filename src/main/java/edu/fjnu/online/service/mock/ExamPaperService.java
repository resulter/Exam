package edu.fjnu.online.service.mock;

import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.QExam;
import edu.fjnu.online.bean.vo.ExamVo;

import java.util.List;
import java.util.Map;

public interface ExamPaperService {
    List<ExamVo> findAllExam();

    List<ExamVo> getAllExam();

    PageInfo<ExamVo> getAllExamPage(Integer pageNo, Integer pageSize);

    Map<Integer, String> getAllReadingSection();

    Map<Integer, String> getAllListeningSection();

    Map<Integer, String> getAllSpeakingSection();

    Map<Integer, String> getAllWritingSection();

    Integer insertExamPaper(QExam qExam);//如果id为空，则插入；如果id存在，则更新

    void deleteExamPaper(Integer papaerId);

    QExam getExamById(Integer paperId);
}
