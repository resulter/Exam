package edu.fjnu.online.controller.mock;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.vo.ExamVo;
import edu.fjnu.online.bean.vo.SectionReadingVo;
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

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 后台-题库管理controller，
 * 阅读-听力-口语-写作相顾炎题库操作
 */
@Controller
@RequestMapping(value = "/mock")
public class RepositoryController extends BaseController {
    @Autowired
    ExamReadingService examReadingService;

    /**
     * 跳转到题库管理页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toRepositoryReading.action")
    public String toQuestionPage(@RequestParam(value = "page", defaultValue = "1") int page,
                                 Model model, HttpSession session) {
//		List<Question> dataList = questionService.find(question);
        PageInfo<SectionReadingVo> pageInfo = examReadingService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionReadingVo> dataList = pageInfo.getList();

        System.out.println(JSON.toJSONString(dataList));
        String jsonString = JSON.toJSONString(dataList);
//        System.out.println(JSON.toJSONString(JsonUtils));
// TODO: 2018/4/9 json格式不符合要求所有解析失败 
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        return "/mock/admin/repository-reading.jsp";
    }
    /**
     * 跳转到题库管理页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toRepositoryReadingDate.action")
    public Msg toQuestionPageDate(@RequestParam(value = "page", defaultValue = "1") int page) {
//		List<Question> dataList = questionService.find(question);
        PageInfo<SectionReadingVo> pageInfo = examReadingService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionReadingVo> dataList = pageInfo.getList();

        System.out.println(JSON.toJSONString(dataList));
        String jsonString = JSON.toJSONString(dataList);
//        System.out.println(JSON.toJSONString(JsonUtils));
//        model.addAttribute("dataList", dataList);
//        model.addAttribute("pageInfo", pageInfo);
        return Msg.success().add("deps", dataList).add("pageInfo", pageInfo);
    }


}
