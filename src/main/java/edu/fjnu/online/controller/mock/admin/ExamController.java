package edu.fjnu.online.controller.mock.admin;

import com.alibaba.fastjson.JSON;
import edu.fjnu.online.bean.vo.ExamVo;
import edu.fjnu.online.controller.BaseController;
import edu.fjnu.online.mapper.*;
import edu.fjnu.online.service.mock.ExamService;
import edu.fjnu.online.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/mock")
public class ExamController extends BaseController {
    @Autowired
    ExamService examService;


    //返回所有试卷
    @RequestMapping("/allExam.action")
    public  String findAllExam(Model model){
        List<ExamVo> allExam = examService.findAllExam();
        for (ExamVo ev:allExam ) {
            System.out.println("=========>>>> " + ev);
        }

        String toJSONString = JSON.toJSONString(allExam);
        model.addAttribute("jsonString",toJSONString);
        model.addAttribute("abc","123456");
        return "mock/a.jsp";
    }

}
