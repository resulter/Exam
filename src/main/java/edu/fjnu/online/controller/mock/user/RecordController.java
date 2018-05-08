package edu.fjnu.online.controller.mock.user;

import edu.fjnu.online.bean.vo.RRecordScoreVo;
import edu.fjnu.online.bean.vo.RecordExamVo;
import edu.fjnu.online.bean.vo.RecordVo;
import edu.fjnu.online.domain.*;
import edu.fjnu.online.service.*;
import edu.fjnu.online.service.mock.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 前端-考试-我的试卷
 */
@Controller
@RequestMapping("/mock")
public class RecordController {

    @Autowired
    UserService userService;
    @Autowired
    RecordService recordService;
    //跳转到我的答题记录页面
    @RequestMapping("/toMyBooksPage.action")
    public String toMyBooksPage(User user, Model model, HttpSession session){
        if(session.getAttribute("user")== null){
            session.setAttribute("user", userService.get(user.getUserId()));
        }
        List<RecordVo> record = recordService.getRecordByUserID(user.getUserId());
        model.addAttribute("record", record);
        model.addAttribute("user", user);
        return "/mock/user/record-books.jsp";
    }

    //跳转到我的答题记录详情页面
    @RequestMapping("/toMyBooksDetailPage.action")
    public String toMyBooksDetailPage(User user, Model model, HttpSession session,String timeStr){
        if("".equals(user.getUserId()) || user==null){
            user = (User) session.getAttribute("user");
        }
        if(session.getAttribute("user")== null){
            session.setAttribute("user", userService.get(user.getUserId()));
        }
        user = userService.getStu(user);
        System.out.println("时间戳是：" + timeStr);
        RecordExamVo recordExamVo = recordService.geteExamRecordInfoByTimeStr(timeStr, 0);
        System.out.println(recordExamVo);
        model.addAttribute("user", user);
        model.addAttribute("recordExamVo", recordExamVo);
        return "/mock/user/record-books-detail.jsp";
    }
}
