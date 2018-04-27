package edu.fjnu.online.controller.mock.user;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.QDescription;
import edu.fjnu.online.bean.vo.*;
import edu.fjnu.online.domain.*;
import edu.fjnu.online.service.*;
import edu.fjnu.online.service.mock.*;
import edu.fjnu.online.util.BaseConstant;
import edu.fjnu.online.util.Computeclass;
import edu.fjnu.online.util.DateUtils;
import edu.fjnu.online.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 前端-考试-我的试卷
 */
@Controller
@RequestMapping("/mock")
public class ExaminationController {

    @Autowired
    UserService userService;
    @Autowired
    GradeService gradeService;
    @Autowired
    PaperService paperService;
    @Autowired
    CourseService courseService;
    @Autowired
    QuestionService questionService;
    @Autowired
    ErrorBookService bookService;


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
	/*
	//跳转到成绩查询页面
	@RequestMapping("/toScoreQry.action")
	public String toScoreQry(User user, Model model, HttpSession session){
		if("".equals(user.getUserId()) || user==null){
			user = (User) session.getAttribute("user");
		}
		if(session.getAttribute("user")== null){
			session.setAttribute("user", userService.get(user.getUserId()));
		}
		user = userService.getStu(user);
		List<Paper> paper = paperService.getUserPaperById(user.getUserId());
		Course course = null;
		for(Paper p : paper){
			course = courseService.get(Integer.parseInt(p.getCourseId()));
			p.setCourseId(course.getCourseName());
		}
		model.addAttribute("user", user);
		model.addAttribute("paper", paper);
		return "/user/scorequery.jsp";			
	}
	
	*//**
     * 查看试卷详情
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @return
     *//*
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/qrypaper.action")
	public String qrypaper(String paperId,String userId,Model model, HttpSession session){
		Map map = new HashMap();
		map.put("paperId", paperId);
		map.put("userId", userId);
		Paper paper = paperService.getPaperDetail(map);
		Question question = null;
		String []ids = paper.getQuestionId().split(",");
		List<Question> selList = new ArrayList<Question>();
		List<Question> inpList = new ArrayList<Question>();
		List<Question> desList = new ArrayList<Question>();
		for(int i = 0;i<ids.length;i++){
			question = questionService.get(Integer.parseInt(ids[i]));
			if("1".equals(question.getTypeId())){//单选
				selList.add(question);
			}
			if("4".equals(question.getTypeId())){//填空
				inpList.add(question);
			}
			if("5".equals(question.getTypeId())){//简答题
				desList.add(question);
			}
		}
		
		if(selList.size()>0){
			model.addAttribute("selectQ", "单项选择题（每题5分）");
			model.addAttribute("selList", selList);
		}
		
		if(inpList.size()>0){
			model.addAttribute("inpQ", "填空题（每题5分）");
			model.addAttribute("inpList", inpList);
		}
		
		if(desList.size()>0){
			model.addAttribute("desQ", "简答题（每题5分）");
			model.addAttribute("desList", desList);
		}
		
		model.addAttribute("paper", paper);
		return "/user/qrypaper.jsp";			
	}
	
	*//**
     * 自动评分
     * @param paper
     * @param model
     * @param session
     * @return
     * @throws UnsupportedEncodingException
     *//*
	@SuppressWarnings("unchecked")
	@RequestMapping("/dealPaper.action")
	@ResponseBody
	public MsgItem dealPaper(Paper paper, Model model, HttpSession session) throws UnsupportedEncodingException{
		String paperId = paper.getPaperId();
		//答案临时存放
		String ans = paper.getScore();
		ans = URLDecoder.decode(ans,"UTF-8");
		String [] answer = null;
		if(ans.contains("&")){
			answer = ans.split("&");
		}
		Map map = new HashMap();
		User user = (User) session.getAttribute("user");
		map.put("paperId", paperId);
		map.put("userId", user.getUserId());
		Paper paperInfo = paperService.getPaperDetail(map);
		String []ids = paperInfo.getQuestionId().split(",");
		List<Question> question = new ArrayList<Question>();
		Question ques = null;
		int endScore = 0;
		ErrorBook book = new ErrorBook();
		book.setUserId(user.getUserId());
		for(int i = 1 ;i<answer.length;i++){
			String[] str = answer[i].split("=");
			//题号
			String str1 = str[0];
			ques = questionService.get(Integer.parseInt(str1));
			//数据库对应的答案
			String answer1 = ques.getAnswer();
			if(str.length>1){
				//学生的答案
				String str2 = str[1];
				if(!"5".equals(ques.getTypeId())){//判断是否为简答题
					if(str2.equals(answer1)){//如果用户答案和数据库中的答案一致
						endScore+=5;
					}else{//插入错题本
						book.setQuestion(ques);
						book.setCourseId(ques.getCourseId());
						book.setGradeId(ques.getGradeId());
						book.setUserAnswer(str2);
						bookService.insert(book);
					}
				}
				if("5".equals(ques.getTypeId())){//为简答题的时候
					String strA = answer1;
					String strB = URLDecoder.decode(str2, "UTF-8");//转码
					//计算相似
					double d = Computeclass.SimilarDegree(strA, strB);
					BigDecimal bg = new BigDecimal(d*5).setScale(1, RoundingMode.DOWN);
			        d = bg.doubleValue();
			        endScore+=d;
			        if(d<=2){//如果小于2分，认定错误
			        	book.setQuestion(ques);
						book.setCourseId(ques.getCourseId());
						book.setGradeId(ques.getGradeId());
						book.setUserAnswer(str2);
						bookService.insert(book);
			        }
				}
			}
		}
		System.out.println("最后得分："+endScore);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Date currentTime = new Date();//得到当前系统时间  
		String endTime = formatter.format(currentTime); //将日期时间格式化  
		map.put("beginTime", paper.getBeginTime());
		map.put("endTime", endTime);
		map.put("score", endScore);
		//将考试的试卷状态改为2
		map.put("paperState", "2");
		paperService.updateUserPaper(map);
		if(session.getAttribute("user")== null){
			session.setAttribute("user", user);
		}
		MsgItem msgItem = new MsgItem();
		msgItem.setErrorNo("1");
		msgItem.setErrorInfo("试卷提交成功，本次考试得分："+endScore +"分");
		return msgItem;		
	}
	
	*/

    /**
     * 通过id获取到一个readingSubject,做题时用
     *
     * @return
     */
    @RequestMapping("/getReadingPassage.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg getReadingPassage(@RequestParam(value = "page", defaultValue = "1") int subjectId) {
        SubjectReadingVo paperPassage = examReadingService.getOneSubjectReadingVoById(subjectId);
        System.out.println(JSON.toJSONString(paperPassage));
        return Msg.success().add("paperPassage", paperPassage);
    }

    /**
     * 通过id获取到一个readingSubject,做题时用
     *
     * @return
     */
    @RequestMapping("/getReadingQuestion.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg getReadingQuestion(@RequestParam(value = "queationId", defaultValue = "1") int queationId) {
        QuestionReadingVo readingQueation = examReadingService.getOneQuestionReadingVoById(queationId);
        System.out.println(JSON.toJSONString(readingQueation));
        return Msg.success().add("readingQueation", readingQueation);
    }

    @RequestMapping("/saveReadingRecord.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg saveReadingRecord(String answer, @RequestParam(value = "subjectId", defaultValue = "1") String subjectId, Model model, HttpSession session,String userId,Integer paperId,String timeStr) {
        String[] answers = answer.split(",");
        System.out.println(".------------------------------------------->>>>");
        System.out.println("userId" + userId);
        System.out.println("paperId" + paperId);
        System.out.println("答案篇章：" + subjectId);
        for (int i = 0; i < answers.length; i++) {
            System.out.println("第" + (i + 1) + "题的答案是" + answers[i]);
        }
        examPaperService.saveReadingOption(userId,paperId,timeStr,subjectId,answer,BaseConstant.examTypeReading);
        return Msg.success().add("a", 777).add("subjectId", (Integer.parseInt(subjectId) + 1));
    }

    @RequestMapping("/saveListeningRecord.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg saveListeningRecord(String answer, @RequestParam(value = "subjectId", defaultValue = "1") String subjectId, Model model, HttpSession session,String userId,Integer paperId,String timeStr) {
        String[] answers = answer.split(",");
        System.out.println(".------------------------------------------->>>>");
        System.out.println("userId" + userId);
        System.out.println("paperId" + paperId);
        System.out.println("答案篇章：" + subjectId);
        for (int i = 0; i < answers.length; i++) {
            System.out.println("第" + (i + 1) + "题的答案是" + answers[i]);
        }
        System.out.println("new subjectid  " + (Integer.parseInt(subjectId) + 1));
        examPaperService.saveListeningOption(userId,paperId,timeStr,subjectId,answer,BaseConstant.examTypelistening);
        return Msg.success().add("a", 777).add("subjectId", (Integer.parseInt(subjectId) + 1));
    }
    @RequestMapping("/saveWritingRecord.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg saveWritingRecord(String answer, @RequestParam(value = "subjectId", defaultValue = "1") String subjectId, Model model, HttpSession session,String userId,Integer paperId,String timeStr) {
        System.out.println(".------------------------------------------->>>>");
        System.out.println("userId" + userId);
        System.out.println("paperId" + paperId);
        System.out.println("第" + subjectId + "的答案是：");
        System.out.println(answer);
        examPaperService.saveWriting(userId,paperId,timeStr,subjectId,answer);
        return Msg.success().add("a", 777).add("subjectId", (Integer.parseInt(subjectId) + 1));
    }



    /**
     * 考试页面-写作----------------------------------------------------------------------------------------------------
     *
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @return
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/queryWritingExamPaperDetail.action")
    public String queryWritingPaperDetail(int paperId, String userId, Model model, HttpSession session,String timeStr,
                                           @RequestParam(value = "subjectOrder", defaultValue = "1") int subjectOrder) {
        QDescription description = examPaperService.getDescription(BaseConstant.sectionDescriptionWriting);
        ExamQuestionWritingVo dataInfo = examPaperService.getWritingQuestionWithPassagePage( paperId, subjectOrder);
        model.addAttribute("userId", userId);
        model.addAttribute("subjectId", dataInfo.getId());//判断是哪一个subject
        model.addAttribute("description", description);
        model.addAttribute("paperId", paperId);
        model.addAttribute("dataInfo", dataInfo);
        model.addAttribute("timeStr", timeStr);
        System.out.println("写作接收到的时间戳： " + timeStr);
        System.out.println(JSON.toJSONString(dataInfo));
        return "/mock/user/exam-paper-detail-writing.jsp";
    }

    /**
     * 与上一个方法一直，返回数据专用
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @param subjectOrder
     * @return
     */
    @RequestMapping("/queryWritingPaperDetailData.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg queryWritingPaperDetailData(int paperId, String userId, Model model, HttpSession session,
                                                @RequestParam(value = "subjectOrder", defaultValue = "1") int subjectOrder) {
        QDescription description = examPaperService.getDescription(BaseConstant.sectionDescriptionWriting);
        ExamQuestionWritingVo dataInfo = examPaperService.getWritingQuestionWithPassagePage( paperId, subjectOrder);
        model.addAttribute("userId", userId);
        model.addAttribute("subjectId", dataInfo.getId());//判断是哪一个subject
        model.addAttribute("description", description);
        model.addAttribute("paperId", paperId);
        model.addAttribute("dataInfo", dataInfo);
        return Msg.success().add("dataInfo", dataInfo).add("userId", userId).add("paperId",paperId).add("description",description).add("subjectId",dataInfo.getId());
    }

    /**
     * 考试页面-口语----------------------------------------------------------------------------------------------------
     *
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @return
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/querySpeakingExamPaperDetail.action")
    public String querySpeakingExamPaperDetail(int paperId, String userId, Model model, HttpSession session,String timeStr,
                                            @RequestParam(value = "subjectOrder", defaultValue = "1") int subjectOrder) {
        QDescription description = examPaperService.getDescription(BaseConstant.sectionDescriptionSpeaking);
        ExamQuestionSpeakingVo dataInfo = examPaperService.getSpeakingQuestionWithPassagePage( paperId, subjectOrder);
        model.addAttribute("userId", userId);
        model.addAttribute("subjectId", dataInfo.getId());//判断是哪一个subject
        model.addAttribute("description", description);
        model.addAttribute("paperId", paperId);
        model.addAttribute("dataInfo", dataInfo);
        model.addAttribute("timeStr", timeStr);
        System.out.println("口语接收到的时间戳：  " + timeStr);
        System.out.println(JSON.toJSONString(dataInfo));
        return "/mock/user/exam-paper-detail-speaking.jsp";
    }

    /**
     * 与上一个方法一直，返回数据专用
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @param subjectOrder
     * @return
     */
    @RequestMapping("/querySpeakingExamPaperDetailData.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg querySpeakingExamPaperDetailData(int paperId, String userId, Model model, HttpSession session,
                                                @RequestParam(value = "subjectOrder", defaultValue = "1") int subjectOrder) {
        QDescription description = examPaperService.getDescription(BaseConstant.sectionDescriptionSpeaking);
        ExamQuestionSpeakingVo dataInfo = examPaperService.getSpeakingQuestionWithPassagePage( paperId, subjectOrder);
        return Msg.success().add("dataInfo", dataInfo).add("userId", userId).add("paperId",paperId).add("description",description).add("subjectId",dataInfo.getId());
    }

    /**--------------------------------------------------------------------------------------------------------------------------
     * 考试页面-听力
     *
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @return
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/queryListeningExamPaperDetail.action")
    public String queryListeningExamPaperDetail(int paperId, String userId, Model model, HttpSession session,String timeStr,
                                   @RequestParam(value = "questionOrder", defaultValue = "1") int questionOrder,
                                   @RequestParam(value = "subjectOrder", defaultValue = "1") int subjectOrder) {
        QDescription description = examPaperService.getDescription(BaseConstant.sectionDescriptionListening);
        PageInfo<ExamQuestionListeningVo> pageInfo = examPaperService.getListeningQuestionWithPassagePage(1, BaseConstant.examPageQueationCount, paperId, subjectOrder, null);
        List<ExamQuestionListeningVo> dataList = pageInfo.getList();
        model.addAttribute("userId", userId);
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("subjectId", dataList.get(0).getId());//判断是哪一个subject
        model.addAttribute("description", description);
        model.addAttribute("paperId", paperId);
        model.addAttribute("timeStr", timeStr);
        System.out.println("听力接收到的时间戳" + timeStr);
        System.out.println(JSON.toJSONString(dataList));
        return "/mock/user/exam-paper-detail-listening.jsp";
    }

    /**
     * 与上一方法一直，返回数据专用
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @param questionOrder
     * @param subjectOrder
     * @return
     */
    @RequestMapping("/queryListeningExamPaperDetailData.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg queryListeningExamPaperDetailData(int paperId, String userId, Model model, HttpSession session,
                                                @RequestParam(value = "questionOrder", defaultValue = "1") int questionOrder,
                                                @RequestParam(value = "subjectOrder", defaultValue = "1") int subjectOrder,@RequestParam(value = "page", defaultValue = "1") int page) {
        Map map = new HashMap();
        map.put("paperId", paperId);
        map.put("userId", userId);
        PageInfo<ExamQuestionListeningVo> pageInfo = examPaperService.getListeningQuestionWithPassagePage(page, BaseConstant.examPageQueationCount, paperId, subjectOrder, null);
        List<ExamQuestionListeningVo> dataList = pageInfo.getList();
        model.addAttribute("userId", userId);
        model.addAttribute("dataList", JSON.toJSONString(dataList));
        System.out.println(JSON.toJSONString(dataList));
        return Msg.success().add("dataList", dataList).add("userId", userId).add("pageInfo",pageInfo).add("subjectId", dataList.get(0).getId());
    }
    /**
     * 加载某一题的信息，这里用来加载切换到第二、三篇听力的第一题
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @param questionOrder
     * @param subjectOrder
     * @return
     */
    @RequestMapping("/queryListeningExamPaperDetailFirstData.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg queryListeningExamPaperDetailFirstData(Integer paperId, String userId, Model model, HttpSession session,
                                                    @RequestParam(value = "questionOrder", defaultValue = "1") Integer questionOrder,
                                                    @RequestParam(value = "subjectOrder", defaultValue = "1") Integer subjectOrder) {
        Map map = new HashMap();
        map.put("paperId", paperId);
        map.put("userId", userId);
        List<ExamQuestionListeningVo> dataList = examPaperService.getQuestionWithPassageListening(paperId, subjectOrder, questionOrder);
        model.addAttribute("userId", userId);
        model.addAttribute("dataList", JSON.toJSONString(dataList));
        System.out.println(JSON.toJSONString(dataList));
        System.out.println("subject:   " +dataList.get(0).getId());
        return Msg.success().add("dataList", dataList).add("userId", userId).add("paperId",paperId).add("subjectId", dataList.get(0).getId());
    }


    /**--------------------------------------------------------------------------------------------------------------------
     * 考试页面,这里进入的是阅读的第一题
     *
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @return
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/queryReadingExamPaperDetail.action")
    public String queryReadingExamPaperDetail(Integer paperId, String userId, Model model, HttpSession session,
                                   @RequestParam(value = "questionOrder", defaultValue = "1") Integer questionOrder,
                                   @RequestParam(value = "subjectOrder", defaultValue = "1") Integer subjectOrder,@RequestParam(value = "page", defaultValue = "1") int page) {
        String createDate = DateUtils.getDateFormatter();
        String timeStr = UUID.randomUUID().toString().replace("-", "");
        timeStr = timeStr + "@"+createDate;
        Map map = new HashMap();
        map.put("paperId", paperId);
        map.put("userId", userId);
        QDescription description = examPaperService.getDescription(BaseConstant.sectionDescriptionReading);
        PageInfo<ExamQuestionReadingVo> pageInfo = examPaperService.getReadingQuestionWithPassagePage(page, BaseConstant.examPageQueationCount, paperId, subjectOrder, null);
        List<ExamQuestionReadingVo> dataList = pageInfo.getList();
        model.addAttribute("userId", userId);
        model.addAttribute("paperId", paperId);
        model.addAttribute("dataList", dataList);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("description", description);
        model.addAttribute("timeStr",timeStr);
        System.out.println("阅读生成的时间戳：  " + timeStr);
        model.addAttribute("subjectId", dataList.get(0).getId());//判断是哪一个subject
        System.out.println(JSON.toJSONString(dataList));
        return "/mock/user/exam-paper-detail.jsp";
    }

    /**
     * 与上一方法为一组，此方法请求数据用的
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @param questionOrder
     * @param subjectOrder
     * @return
     */
    @RequestMapping("/queryReadingExamPaperDetailData.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg queryReadingExamPaperDetailData(Integer paperId, String userId, Model model, HttpSession session,
                                                @RequestParam(value = "questionOrder", defaultValue = "1") Integer questionOrder,
                                                @RequestParam(value = "subjectOrder", defaultValue = "1") Integer subjectOrder,@RequestParam(value = "page", defaultValue = "1") int page) {
        Map map = new HashMap();
        map.put("paperId", paperId);
        map.put("userId", userId);
        PageInfo<ExamQuestionReadingVo> pageInfo = examPaperService.getReadingQuestionWithPassagePage(page, BaseConstant.examPageQueationCount, paperId, subjectOrder, null);
        List<ExamQuestionReadingVo> dataList = pageInfo.getList();
        model.addAttribute("userId", userId);
        model.addAttribute("dataList", JSON.toJSONString(dataList));
        System.out.println(JSON.toJSONString(dataList));
        return Msg.success().add("dataList", dataList).add("userId", userId).add("pageInfo",pageInfo).add("paperId",paperId).add("subjectId", dataList.get(0).getId());
    }

    /**
     * 加载某一题的信息，这里用来加载切换到第二篇阅读的第一题
     * @param paperId
     * @param userId
     * @param model
     * @param session
     * @param questionOrder
     * @param subjectOrder
     * @return
     */
    @RequestMapping("/queryReadingExamPaperDetailFirstData.action")
    @ResponseBody //加上次注解才可以直接返回json等信息，否则只能返回web-inf下的页面
    public Msg queryReadingExamPaperDetailFirstData(Integer paperId, String userId, Model model, HttpSession session,
                                               @RequestParam(value = "questionOrder", defaultValue = "1") Integer questionOrder,
                                               @RequestParam(value = "subjectOrder", defaultValue = "1") Integer subjectOrder) {
        Map map = new HashMap();
        map.put("paperId", paperId);
        map.put("userId", userId);
        List<ExamQuestionReadingVo> dataList = examPaperService.getQuestionWithPassageReading(paperId, subjectOrder, questionOrder);
        model.addAttribute("userId", userId);
        model.addAttribute("dataList", JSON.toJSONString(dataList));
        System.out.println(JSON.toJSONString(dataList));
        System.out.println("subject:   " +dataList.get(0).getId());
        return Msg.success().add("dataList", dataList).add("userId", userId).add("paperId",paperId).add("subjectId", dataList.get(0).getId());
    }


    /**
     * 获取未考试试卷，并将为考试的试卷添加用户信息
     *
     * @param user
     * @param model
     * @param session
     * @return
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/toMyExamPaperPage.action")
    public String toMyExamPaperPage(User user, Model model, HttpSession session) {
        if ("".equals(user.getUserId()) || user.getUserId() == null) {
            user = (User) session.getAttribute("user");
        }
        if (session.getAttribute("user") == null) {
            session.setAttribute("user", userService.get(user.getUserId()));
        }
        user = userService.getStu(user);
        Map map = new HashMap();
        map.put("userId", user.getUserId());
        //List<Paper> paper = paperService.getUserPaperById(user.getUserId());
        List<ExamVo> allExam = examPaperService.getAllExam();
        model.addAttribute("user", user);
        model.addAttribute("allExam", allExam);
        return "/mock/user/my-paper.jsp";
    }
}
