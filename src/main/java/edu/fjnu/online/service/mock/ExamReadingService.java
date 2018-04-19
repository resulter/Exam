package edu.fjnu.online.service.mock;

import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.vo.ExamVo;
import edu.fjnu.online.bean.vo.QuestionReadingVo;
import edu.fjnu.online.bean.vo.SectionReadingVo;
import edu.fjnu.online.bean.vo.SubjectReadingVo;

import java.util.List;
import java.util.Map;

public interface ExamReadingService {
    List<SectionReadingVo> getAllReading();

    PageInfo<SectionReadingVo> findByPage(Integer pageNo, Integer pageSize);

    List<SubjectReadingVo> getReadingSubjectBysectionId(Integer subjectId);

    SubjectReadingVo getOneSubjectReadingVoById(Integer subjectId);//主要用来获取readingPassage ；question用不到；

    QuestionReadingVo getOneQuestionReadingVoById(Integer questionId);//获取question

}
