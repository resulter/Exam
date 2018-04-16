package edu.fjnu.online.service.mock;

import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.vo.ExamVo;
import edu.fjnu.online.bean.vo.SectionSpeakingVo;
import edu.fjnu.online.bean.vo.SubjectSpeakingVo;

import java.util.List;

public interface ExamSpeakingService {
    List<ExamVo> findAllExam();
    PageInfo<SectionSpeakingVo> findByPage(Integer pageNo, Integer pageSize);
    List<SubjectSpeakingVo> getListeningSubjectBySectionId(Integer sectionId);
}
