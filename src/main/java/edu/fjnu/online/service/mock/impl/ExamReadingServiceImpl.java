package edu.fjnu.online.service.mock.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.*;
import edu.fjnu.online.bean.vo.*;
import edu.fjnu.online.domain.Question;
import edu.fjnu.online.mapper.*;
import edu.fjnu.online.service.mock.ExamReadingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ExamReadingServiceImpl implements ExamReadingService{
    @Autowired
    QExamMapper qExamMapper;
    @Autowired
    QReadingSectionMapper qReadingSectionMapper;
    @Autowired
    QListeningSectionMapper qListeningSectionMapper;
    @Autowired
    QSpeakingSectionMapper qSpeakingSectionMapper;
    @Autowired
    QWritingSectionMapper qWritingSectionMapper;
    @Autowired
    QReadingSubjectMapper qReadingSubjectMapper;
    @Autowired
    QReadingPassageMapper qReadingPassageMapper;
    @Autowired
    QReadingQuestionMapper qReadingQuestionMapper;
    @Autowired
    QReadingOptionMapper qReadingOptionMapper;
    @Autowired
    QListeningSubjectMapper qListeningSubjectMapper;
    @Autowired
    QListeningPassageMapper qListeningPassageMapper;
    @Autowired
    QListeningQuestionMapper qListeningQuestionMapper;
    @Autowired
    QListeningOptionMapper qListeningOptionMapper;
    @Autowired
    QSpeakingSubjectMapper qSpeakingSubjectMapper;
    @Autowired
    QSpeakingQuestionMapper qSpeakingQuestionMapper;
    @Autowired
    QWritingSubjectMapper qWritingSubjectMapper;
    @Autowired
    QWritingQuestionMapper qWritingQuestionMapper;


    @Override
    public List<SectionReadingVo> getAllReading() {

        List<QReadingSection> qReadingSections = qReadingSectionMapper.selectByExample(null);
        List<SectionReadingVo> sectionReadingVos = new ArrayList<>();
        for (QReadingSection qReadingSecton:qReadingSections) {
            SectionReadingVo sectionReadingVo = new SectionReadingVo();
            sectionReadingVo.setId(qReadingSecton.getId());
            sectionReadingVo.setName(qReadingSecton.getName());
            QReadingSubjectExample qReadingSubjectExample = new QReadingSubjectExample();
            qReadingSubjectExample.createCriteria().andSectionIdEqualTo(qReadingSecton.getId());
            List<QReadingSubject> qReadingSubjects = qReadingSubjectMapper.selectByExample(qReadingSubjectExample);
            List<SubjectReadingVo> subjectReadingVos = new ArrayList<>();
            for (QReadingSubject qReadingSubject: qReadingSubjects) {
                SubjectReadingVo subjectReadingVo = new SubjectReadingVo();
                Integer passageId = qReadingSubject.getPassageId();
                QReadingPassage qReadingPassage = qReadingPassageMapper.selectByPrimaryKey(passageId);
                subjectReadingVo.setPassage(qReadingPassage.getContent());
                subjectReadingVo.setPassageTitle(qReadingPassage.getTitle());
                subjectReadingVo.setPassageTitleCn(qReadingPassage.getTitleCn());
                subjectReadingVo.setOrderNum(qReadingSubject.getOrderNum());
                QReadingQuestionExample qReadingQuestionExample = new QReadingQuestionExample();
                qReadingQuestionExample.createCriteria().andSubjectIdEqualTo(qReadingSubject.getId());
                List<QReadingQuestion> qReadingQuestions = qReadingQuestionMapper.selectByExample(qReadingQuestionExample);
                List<QuestionReadingVo> questionReadingVos = new ArrayList<>();
                for (QReadingQuestion qReadingQuestion:  qReadingQuestions) {
                    QuestionReadingVo questionReadingVo = new QuestionReadingVo();
                    questionReadingVo.setId(qReadingQuestion.getId());
                    questionReadingVo.setQuestion(qReadingQuestion.getQuestion());
                    questionReadingVo.setRightAnswer(qReadingQuestion.getRightAnswer());
                    questionReadingVo.setOrderNum(qReadingQuestion.getOrderNum());
                    QReadingOptionExample qReadingOptionExample = new QReadingOptionExample();
                    qReadingOptionExample.createCriteria().andQuestionIdEqualTo(qReadingQuestion.getId());
                    List<QReadingOption> qReadingOptions = qReadingOptionMapper.selectByExample(qReadingOptionExample);
                    List<OptionReadingVo> optionReadingVos= new ArrayList<>();
                    for (QReadingOption qReadingOption: qReadingOptions) {
                        OptionReadingVo optionReadingVo = new OptionReadingVo();
                        optionReadingVo.setId(qReadingOption.getId());
                        optionReadingVo.setItemCode(qReadingOption.getItemCode());
                        optionReadingVo.setItemName(qReadingOption.getItemName());
                        optionReadingVo.setOrderNum(qReadingOption.getOrderNum());
                        optionReadingVos.add(optionReadingVo);
                    }
                    questionReadingVo.setOptionReadingVos(optionReadingVos);
                    questionReadingVos.add(questionReadingVo);
                }
                subjectReadingVo.setQuestionReadingVos(questionReadingVos);
                subjectReadingVos.add(subjectReadingVo);
            }
            sectionReadingVo.setSubjectReadingVos(subjectReadingVos);
            sectionReadingVos.add(sectionReadingVo);
        }
        return sectionReadingVos;
    }

    public PageInfo<SectionReadingVo> findByPage(Integer pageNo,Integer pageSize) {

        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null?10:pageSize;
        PageHelper.startPage(pageNo, pageSize);
        List<QReadingSection> qReadingSections = qReadingSectionMapper.selectByExample(null);
        //用PageInfo对结果进行包装
        PageInfo page = new PageInfo(qReadingSections);
        List<SectionReadingVo> sectionReadingVos = new ArrayList<>();
        for (QReadingSection qReadingSecton:qReadingSections) {
            SectionReadingVo sectionReadingVo = new SectionReadingVo();
            sectionReadingVo.setId(qReadingSecton.getId());
            sectionReadingVo.setName(qReadingSecton.getName());
            QReadingSubjectExample qReadingSubjectExample = new QReadingSubjectExample();
            qReadingSubjectExample.createCriteria().andSectionIdEqualTo(qReadingSecton.getId());
            List<QReadingSubject> qReadingSubjects = qReadingSubjectMapper.selectByExample(qReadingSubjectExample);
            List<SubjectReadingVo> subjectReadingVos = new ArrayList<>();
            for (QReadingSubject qReadingSubject: qReadingSubjects) {
                SubjectReadingVo subjectReadingVo = new SubjectReadingVo();
                Integer passageId = qReadingSubject.getPassageId();
                QReadingPassage qReadingPassage = qReadingPassageMapper.selectByPrimaryKey(passageId);
                subjectReadingVo.setPassage(qReadingPassage.getContent());
                subjectReadingVo.setPassageTitle(qReadingPassage.getTitle());
                subjectReadingVo.setPassageTitleCn(qReadingPassage.getTitleCn());
                subjectReadingVo.setOrderNum(qReadingSubject.getOrderNum());
                QReadingQuestionExample qReadingQuestionExample = new QReadingQuestionExample();
                qReadingQuestionExample.createCriteria().andSubjectIdEqualTo(qReadingSubject.getId());
                List<QReadingQuestion> qReadingQuestions = qReadingQuestionMapper.selectByExample(qReadingQuestionExample);
                List<QuestionReadingVo> questionReadingVos = new ArrayList<>();
                for (QReadingQuestion qReadingQuestion:  qReadingQuestions) {
                    QuestionReadingVo questionReadingVo = new QuestionReadingVo();
                    questionReadingVo.setId(qReadingQuestion.getId());
                    questionReadingVo.setQuestion(qReadingQuestion.getQuestion());
                    questionReadingVo.setRightAnswer(qReadingQuestion.getRightAnswer());
                    questionReadingVo.setOrderNum(qReadingQuestion.getOrderNum());
                    QReadingOptionExample qReadingOptionExample = new QReadingOptionExample();
                    qReadingOptionExample.createCriteria().andQuestionIdEqualTo(qReadingQuestion.getId());
                    List<QReadingOption> qReadingOptions = qReadingOptionMapper.selectByExample(qReadingOptionExample);
                    List<OptionReadingVo> optionReadingVos= new ArrayList<>();
                    for (QReadingOption qReadingOption: qReadingOptions) {
                        OptionReadingVo optionReadingVo = new OptionReadingVo();
                        optionReadingVo.setId(qReadingOption.getId());
                        optionReadingVo.setItemCode(qReadingOption.getItemCode());
                        optionReadingVo.setItemName(qReadingOption.getItemName());
                        optionReadingVo.setOrderNum(qReadingOption.getOrderNum());
                        optionReadingVos.add(optionReadingVo);
                    }
                    questionReadingVo.setOptionReadingVos(optionReadingVos);
                    questionReadingVos.add(questionReadingVo);
                }
                subjectReadingVo.setQuestionReadingVos(questionReadingVos);
                subjectReadingVos.add(subjectReadingVo);
            }
            sectionReadingVo.setSubjectReadingVos(subjectReadingVos);
            sectionReadingVos.add(sectionReadingVo);
        }
//        System.out.println(sectionReadingVos.toString());

        page.setList(sectionReadingVos);
        return page;
    }
}
