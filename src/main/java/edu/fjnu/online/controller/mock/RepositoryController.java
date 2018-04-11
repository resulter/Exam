package edu.fjnu.online.controller.mock;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.vo.ExamVo;
import edu.fjnu.online.bean.vo.SectionReadingVo;
import edu.fjnu.online.bean.vo.SubjectReadingVo;
import edu.fjnu.online.controller.BaseController;
import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Question;
import edu.fjnu.online.domain.Type;
import edu.fjnu.online.service.mock.ExamReadingService;
import edu.fjnu.online.service.mock.ExamService;
import edu.fjnu.online.util.BaseConstant;
import edu.fjnu.online.util.JsonUtils;
import edu.fjnu.online.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 后台-题库管理controller，
 * 阅读-听力-口语-写作相关题库操作
 */
@Controller
@RequestMapping(value = "/mock")
public class RepositoryController extends BaseController {
    @Autowired
    ExamReadingService examReadingService;

    /**
     * 跳转到题库管理-阅读页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toRepositoryReading.action")
    public String toRepositoryReadingPage(@RequestParam(value = "page", defaultValue = "1") int page,
                                 Model model, HttpSession session) {
        PageInfo<SectionReadingVo> pageInfo = examReadingService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionReadingVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        String jsonString = JSON.toJSONString(dataList);
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        return "/mock/admin/repository-reading.jsp";
    }
    /**
     * 获取到题库管理-阅读数据，与上一个方法一致
     *
     * @return
     */
    @RequestMapping("/toRepositoryReadingDate.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg toRepositoryReadingPageDate(@RequestParam(value = "page", defaultValue = "1") int page) {
        PageInfo<SectionReadingVo> pageInfo = examReadingService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionReadingVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        return Msg.success().add("dataList", dataList).add("pageInfo", pageInfo);
    }

    /**
     * 查看问题信息
     * @param subjectId 编号
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toQueryRepositorReading.action")
    public String toQueryRepositorReading(int[] subjectId, Model model, HttpSession session){
        SubjectReadingVo readingSubjectBySubject1 = examReadingService.getReadingSubjectBySubjectId(subjectId[0]);
        SubjectReadingVo readingSubjectBySubject2= examReadingService.getReadingSubjectBySubjectId(subjectId[1]);
        List<SubjectReadingVo> subjectReadingVos = new ArrayList<>();
        subjectReadingVos.add(readingSubjectBySubject1);
        subjectReadingVos.add(readingSubjectBySubject2);
        model.addAttribute("readingSubject", subjectReadingVos);
        return "/admin/repositor-reading-query.jsp";
    }


}
