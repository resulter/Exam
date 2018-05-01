package edu.fjnu.online.controller.mock.admin;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.QExam;
import edu.fjnu.online.bean.vo.*;
import edu.fjnu.online.controller.BaseController;
import edu.fjnu.online.service.mock.*;
import edu.fjnu.online.util.BaseConstant;
import edu.fjnu.online.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 后台-题库管理controller，
 * 阅读-听力-口语-写作相关试卷操作
 */
@Controller
@RequestMapping(value = "/mock")
public class ExamPaperController extends BaseController {
    @Autowired
    ExamReadingService examReadingService;
    @Autowired
    ExamListeningService examListeningService;
    @Autowired
    ExamSpeakingService examSpeakingService;
    @Autowired
    ExamWritingService examWritingService;
    @Autowired
    ExamPaperService examPaperService;



    /**
     * 跳转到写作判分页面过程页（正经判分~~）
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toWritingJudgmentSaveScore.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg toWritingJudgmentSaveScore(Model model, HttpSession session,Integer id,String score,String anno) {
        System.out.println("----->>>-id:" + id + "     score:" + score + "    anno:" + anno);
        examPaperService.saveWritingScore(id,Float.parseFloat(score),anno);
        return Msg.success();
    }
    /**
     * 跳转到写作判分页面
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toWritingJudgmentDetailPage.action")
    public String toWritingJudgmentDetailPage(Model model, HttpSession session,Integer id) {
        JudgmentWritingVo dataInfo = examPaperService.getOneWritingRecord(id);
        model.addAttribute("dataInfo", dataInfo);
        return "/mock/admin/judgment-writing-detail.jsp";
    }
    /**
     * 跳转到写作判分页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toWritingJudgmentPage.action")
    public String toWritingJudgmentPage(@RequestParam(value = "page", defaultValue = "1") int page,
                                        Model model, HttpSession session,
                                        @RequestParam(value="examName",defaultValue = "") String examName,
                                        @RequestParam(value = "userName",defaultValue = "") String userName,
                                        @RequestParam(value = "startDate",defaultValue = "") String startDate,
                                        @RequestParam(value = "endDate",defaultValue = "") String endDate,
                                        @RequestParam(value = "type",defaultValue = "") Integer type) {
        PageInfo<JudgmentWritingVo> pageInfo = examPaperService.getAllWritingRecord(page, BaseConstant.adminPageNum);
        PageInfo<JudgmentWritingVo> pageInfo2 = examPaperService.getAllWritingRecordWithCondition(page, BaseConstant.adminPageNum,userName.trim(),examName.trim(),startDate,endDate,type);
        List<JudgmentWritingVo> dataList = pageInfo2.getList();
        System.out.println(JSON.toJSONString(dataList));
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo2);
        model.addAttribute("examName", examName);
        model.addAttribute("userName", userName);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("type", type);
        return "/mock/admin/judgment-writing.jsp";
    }
    /**
     * 获取到题库管理-阅读数据，与上一个方法一致
     *
     * @return
     */
    @RequestMapping("/toWritingJudgmentPageData.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg toWritingJudgmentPageData(@RequestParam(value = "page", defaultValue = "1") int page,
                                         @RequestParam(value="examName",defaultValue = "") String examName,
                                         @RequestParam(value = "userName",defaultValue = "") String userName,
                                         @RequestParam(value = "startDate",defaultValue = "2000-00-00 00:00:00") String startDate,
                                         @RequestParam(value = "endDate",defaultValue = "2000-00-00 00:00:00") String endDate,
                                         @RequestParam(value = "type",defaultValue = "") Integer type) {
        PageInfo<JudgmentWritingVo> pageInfo = examPaperService.getAllWritingRecord(page, BaseConstant.adminPageNum);
        PageInfo<JudgmentWritingVo> pageInfo2 = examPaperService.getAllWritingRecordWithCondition(page, BaseConstant.adminPageNum,userName.trim(),examName.trim(),startDate,endDate,type);
        List<JudgmentWritingVo> dataList = pageInfo2.getList();
        System.out.println("===>>>> start:" + startDate + "endtime: "+ endDate);
        System.out.println(JSON.toJSONString(dataList));
        return Msg.success().add("dataList", dataList).add("pageInfo", pageInfo2).add("examName",examName).add("userName",userName).add("startDate",startDate).add("endDate",endDate).add("type",type);
    }

    /**
     * 跳转到试卷管理页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toExamPaper.action")
    public String toExamPaperPage(@RequestParam(value = "page", defaultValue = "1") int page,
                                  Model model, HttpSession session) {
        PageInfo<ExamVo> pageInfo = examPaperService.getAllExamPage(page, BaseConstant.adminPageNum);
        List<ExamVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        return "/mock/admin/exam-paper.jsp";
    }



    /**
     * 获取到题库管理-阅读数据，与上一个方法一致
     *
     * @return
     */
    @RequestMapping("/toExamPaperDate.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg toRepositoryReadingPageDate(@RequestParam(value = "page", defaultValue = "1") int page) {
        PageInfo<ExamVo> pageInfo = examPaperService.getAllExamPage(page, BaseConstant.adminPageNum);
        List<ExamVo> dataList = pageInfo.getList();
        System.out.println(JSON.toJSONString(dataList));
        return Msg.success().add("dataList", dataList).add("pageInfo", pageInfo);
    }

    /**
     * 跳转到新增试卷页面
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toAddExamPaperPage.action")
    public String toAddExamPaperPage(Model model, HttpSession session) {
        ExamAddVo examAddVo = new ExamAddVo();
        examAddVo.setReadingSelect(examPaperService.getAllReadingSection());
        examAddVo.setListeningSelect(examPaperService.getAllListeningSection());
        examAddVo.setSpeakingSelect(examPaperService.getAllSpeakingSection());
        examAddVo.setWritingSelect(examPaperService.getAllWritingSection());
        model.addAttribute("dataList",examAddVo);
        return "/mock/admin/exam-paper-add.jsp";
    }
    /**
     * 新增试卷
     * @param model
     * @param session
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/addExamPaper.action")
    public String addPaper(@ModelAttribute QExam qExam, Model model, HttpSession session){
        qExam.setCreateTime(new Date());
        examPaperService.insertExamPaper(qExam);
        return "redirect:/mock/toExamPaper.action";
    }
 /**
     * 跳转到编辑试卷页面
     * @param model
     * @param session
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/toEditExamPaperPage.action")
    public String toEditExamPaperPage(@RequestParam("paperId") Integer paperId,@ModelAttribute QExam qExam, Model model, HttpSession session){
        ExamAddVo examAddVo = new ExamAddVo();
        examAddVo.setReadingSelect(examPaperService.getAllReadingSection());
        examAddVo.setListeningSelect(examPaperService.getAllListeningSection());
        examAddVo.setSpeakingSelect(examPaperService.getAllSpeakingSection());
        examAddVo.setWritingSelect(examPaperService.getAllWritingSection());
        QExam localExam = examPaperService.getExamById(paperId);
        model.addAttribute("dataList",examAddVo);
        model.addAttribute("localExam",localExam);
        return "/mock/admin/exam-paper-edit.jsp";
    }

    /**
     * 编辑试卷
     * @param model
     * @param session
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/editExamPaper.action")
    public String editPaper(@RequestParam("paperId") Integer paperId,@ModelAttribute QExam qExam, Model model, HttpSession session){
        qExam.setId(paperId);
        qExam.setCreateTime(new Date());
        examPaperService.insertExamPaper(qExam);
        return "redirect:/mock/toExamPaper.action";
    }

    /**
     * 删除试卷信息
     * @param paperId	试卷编号，删除多个是，id用逗号分隔开
     * @param model
     * @return
     */
    @RequestMapping("/deleteExamPaper.action")
    public String deletePaper(String paperId, Model model){
        if(paperId != null){
            String ids[] = paperId.split(",");
            for(int i=0;i<ids.length;i++){
                examPaperService.deleteExamPaper(Integer.parseInt(ids[i]));
            }
        }
        return "redirect:/mock/toExamPaper.action";
    }
}
