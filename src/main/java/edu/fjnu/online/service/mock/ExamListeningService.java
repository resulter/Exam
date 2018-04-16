package edu.fjnu.online.service.mock;

import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.vo.ExamVo;
import edu.fjnu.online.bean.vo.SectionListeningVo;
import edu.fjnu.online.bean.vo.SubjectListeningVo;

import java.util.List;

public interface ExamListeningService {
    public List<ExamVo> findAllExam();

    PageInfo<SectionListeningVo> findByPage(Integer pageNo, Integer pageSize);

    public List<SubjectListeningVo> getListeningSubjectBySectionId(Integer sectionId);
}
