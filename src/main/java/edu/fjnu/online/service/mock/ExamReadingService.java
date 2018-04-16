package edu.fjnu.online.service.mock;

import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.vo.ExamVo;
import edu.fjnu.online.bean.vo.SectionReadingVo;
import edu.fjnu.online.bean.vo.SubjectReadingVo;

import java.util.List;
import java.util.Map;

public interface ExamReadingService {
    public List<SectionReadingVo> getAllReading();
    public PageInfo<SectionReadingVo> findByPage(Integer pageNo, Integer pageSize);
    public List<SubjectReadingVo> getReadingSubjectBysectionId(Integer sectionId);

}
