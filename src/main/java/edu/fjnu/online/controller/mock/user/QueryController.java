package edu.fjnu.online.controller.mock.user;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.QDescription;
import edu.fjnu.online.bean.RRecordScore;
import edu.fjnu.online.bean.vo.*;
import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Paper;
import edu.fjnu.online.domain.User;
import edu.fjnu.online.service.*;
import edu.fjnu.online.service.mock.*;
import edu.fjnu.online.util.BaseConstant;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 前端-考试-我的试卷
 */
@Controller
@RequestMapping("/mock")
public class QueryController {

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


    @Autowired
    QueryService queryService;


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
        List<RRecordScoreVo> queryScoreByUserID = queryService.getQueryScoreByUserID(user.getUserId());

        List<Paper> paper = paperService.getUserPaperById(user.getUserId());
        Course course = null;
        for(Paper p : paper){
            course = courseService.get(Integer.parseInt(p.getCourseId()));
            p.setCourseId(course.getCourseName());
        }
        model.addAttribute("user", user);
        model.addAttribute("paper", paper);
        model.addAttribute("queryScoreByUserID", queryScoreByUserID);
        return "/mock/user/score-query.jsp";
    }
}
