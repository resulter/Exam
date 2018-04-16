package edu.fjnu.online.service.mock;

import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.vo.ExamVo;
import edu.fjnu.online.bean.vo.SectionWritingVo;
import edu.fjnu.online.bean.vo.SubjectWritingVo;

import java.util.List;

public interface ExamWritingService {
    public List<ExamVo> findAllExam();
    PageInfo<SectionWritingVo> findByPage(Integer pageNo, Integer pageSize);
    List<SubjectWritingVo> getWritingSubjectBySectionId(Integer sectionId);
}
