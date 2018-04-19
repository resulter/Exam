package edu.fjnu.online.controller.mock.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.vo.*;
import edu.fjnu.online.controller.BaseController;
import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Question;
import edu.fjnu.online.domain.Type;
import edu.fjnu.online.service.mock.*;
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
    @Autowired
    ExamListeningService examListeningService;
    @Autowired
    ExamSpeakingService examSpeakingService;
    @Autowired
    ExamWritingService examWritingService;


    //--------------------------------------以下为阅读------------------------------------------------------------------

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
     *
     * @param sectionId 编号
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toQueryRepositorReading.action")
    public String toQueryRepositorReading(int sectionId, Model model, HttpSession session) {
        List<SubjectReadingVo> subjectReadingVos = examReadingService.getReadingSubjectBysectionId(sectionId);
        model.addAttribute("readingSubject", subjectReadingVos);
        return "/admin/repositor-reading-query.jsp";
    }

    //--------------------------------------以上为阅读------------------------------------------------------------------
    //--------------------------------------以下为听力------------------------------------------------------------------
    /**
     * 跳转到题库管理-听力页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toRepositoryListening.action")
    public String toRepositoryListeningPage(@RequestParam(value = "page", defaultValue = "1") int page,
                                          Model model, HttpSession session) {
        PageInfo<SectionListeningVo> pageInfo = examListeningService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionListeningVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        return "/mock/admin/repository-listening.jsp";
    }

    /**
     * 获取到题库管理-听力数据，与上一个方法一致
     *
     * @return
     */
    @RequestMapping("/toRepositoryListeningDate.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg toRepositoryListeningPageDate(@RequestParam(value = "page", defaultValue = "1") int page) {
        PageInfo<SectionListeningVo> pageInfo = examListeningService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionListeningVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        return Msg.success().add("dataList", dataList).add("pageInfo", pageInfo);
    }

    /**
     * 查看问题信息
     *
     * @param sectionId 编号
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toQueryRepositorListening.action")
    public String toQueryRepositorListening(int sectionId, Model model, HttpSession session) {
        List<SubjectListeningVo> subjectListeningVos = examListeningService.getListeningSubjectBySectionId(sectionId);
        model.addAttribute("readingSubject", subjectListeningVos);
        return "/admin/repositor-listening-query.jsp";
    }
    //--------------------------------------以上为听力------------------------------------------------------------------
    //--------------------------------------以下为口语------------------------------------------------------------------

    /**
     * 跳转到题库管理-口语页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toRepositorySpeaking.action")
    public String toRepositorySpeakingPage(@RequestParam(value = "page", defaultValue = "1") int page,
                                            Model model, HttpSession session) {
        PageInfo<SectionSpeakingVo> pageInfo = examSpeakingService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionSpeakingVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        return "/mock/admin/repository-speaking.jsp";
    }

    /**
     * 获取到题库管理-口语数据，与上一个方法一致
     *
     * @return
     */
    @RequestMapping("/toRepositorySpeakingDate.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg toRepositorySpeakingPageDate(@RequestParam(value = "page", defaultValue = "1") int page) {
        PageInfo<SectionSpeakingVo> pageInfo = examSpeakingService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionSpeakingVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        return Msg.success().add("dataList", dataList).add("pageInfo", pageInfo);
    }

    /**
     * 查看问题信息
     *
     * @param sectionId 编号
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toQueryRepositorSpeaking.action")
    public String toQueryRepositorSpeaking(int sectionId, Model model, HttpSession session) {
        List<SubjectSpeakingVo> subjectSpeakingVos = examSpeakingService.getListeningSubjectBySectionId(sectionId);
        model.addAttribute("speakingSubject", subjectSpeakingVos);
        return "/admin/repositor-speaking-query.jsp";
    }
    //--------------------------------------以上为口语------------------------------------------------------------------
    //--------------------------------------以下为写作------------------------------------------------------------------

    /**
     * 跳转到题库管理-写作页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toRepositoryWriting.action")
    public String toRepositoryWritingPage(@RequestParam(value = "page", defaultValue = "1") int page,
                                            Model model, HttpSession session) {
        PageInfo<SectionWritingVo> pageInfo = examWritingService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionWritingVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        return "/mock/admin/repository-writing.jsp";
    }

    /**
     * 获取到题库管理-写作数据，与上一个方法一致
     *
     * @return
     */
    @RequestMapping("/toRepositoryWritingDate.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg toRepositoryWritingPageDate(@RequestParam(value = "page", defaultValue = "1") int page) {
        PageInfo<SectionWritingVo> pageInfo = examWritingService.findByPage(page, BaseConstant.adminPageNum);
        List<SectionWritingVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        return Msg.success().add("dataList", dataList).add("pageInfo", pageInfo);
    }

    /**
     * 查看问题信息
     *
     * @param sectionId 编号
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toQueryRepositorWriting.action")
    public String toQueryRepositorWriting(int sectionId, Model model, HttpSession session) {
        List<SubjectWritingVo> subjectWritingVos = examWritingService.getWritingSubjectBySectionId(sectionId);
        model.addAttribute("writingSubject", subjectWritingVos);
        return "/admin/repositor-writing-query.jsp";
    }
    //--------------------------------------以上为写作------------------------------------------------------------------

}
