package edu.fjnu.online.service.mock.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.*;
import edu.fjnu.online.bean.vo.*;
import edu.fjnu.online.mapper.*;
import edu.fjnu.online.service.mock.ExamPaperService;
import edu.fjnu.online.service.mock.ExamService;
import edu.fjnu.online.util.BaseConstant;
import edu.fjnu.online.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ExamPaperServiceImpl implements ExamPaperService{
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
    public List<ExamVo> findAllExam() {
        List<ExamVo> result = new ArrayList<>();
        List<QExam> qExams = qExamMapper.selectByExample(null);
        for (QExam qExam:qExams ) {
            ExamVo examVo = new ExamVo();
            examVo.setName(qExam.getName());




            //阅读部分
            SectionReadingVo sectionReadingVo = new SectionReadingVo();
            Integer readingSectionId = qExam.getReadingSectionId();
            QReadingSection qReadingSection = qReadingSectionMapper.selectByPrimaryKey(readingSectionId);
            sectionReadingVo.setId(qReadingSection.getId());
            sectionReadingVo.setName(qReadingSection.getName());
            QReadingSubjectExample qReadingSubjectExample = new QReadingSubjectExample();
            qReadingSubjectExample.createCriteria().andSectionIdEqualTo(readingSectionId);
            List<QReadingSubject> qReadingSubjects = qReadingSubjectMapper.selectByExample(qReadingSubjectExample);
            List<SubjectReadingVo> subjectReadingVos = new ArrayList<>();
            for (QReadingSubject qReadingSubject: qReadingSubjects) {
                SubjectReadingVo subjectReadingVo = new SubjectReadingVo();
                Integer passageId = qReadingSubject.getPassageId();
                QReadingPassage qReadingPassage = qReadingPassageMapper.selectByPrimaryKey(passageId);
                subjectReadingVo.setId(qReadingSubject.getId());
                subjectReadingVo.setPassage(qReadingPassage.getContent());
                subjectReadingVo.setPassageTitle(qReadingPassage.getTitle());
                subjectReadingVo.setPassageTitleCn(qReadingPassage.getTitleCn());
                subjectReadingVo.setOrderNum(qReadingSubject.getOrderNum());
                QReadingQuestionExample qReadingQuestionExample = new QReadingQuestionExample();
                qReadingQuestionExample.createCriteria().andSubjectIdEqualTo(qReadingSubject.getId());
                List<QReadingQuestion> qReadingQuestions = qReadingQuestionMapper.selectByExampleWithBLOBs(qReadingQuestionExample);
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
            examVo.setReading(sectionReadingVo);

            //听力部分
            SectionListeningVo sectionListeningVo = new SectionListeningVo();
            Integer listeningSectionId = qExam.getListeningSectionId();
            QListeningSection qListeningSection = qListeningSectionMapper.selectByPrimaryKey(listeningSectionId);
            sectionListeningVo.setId(qListeningSection.getId());
            sectionListeningVo.setName(qListeningSection.getName());
            QListeningSubjectExample qListeningSubjectExample = new QListeningSubjectExample();
            qListeningSubjectExample.createCriteria().andSectionIdEqualTo(listeningSectionId);
            List<QListeningSubject> qListeningSubjects = qListeningSubjectMapper.selectByExample(qListeningSubjectExample);
            List<SubjectListeningVo> subjectListeningVos = new ArrayList<>();
            for (QListeningSubject qListeningSubject:qListeningSubjects) {
                SubjectListeningVo subjectListeningVo = new SubjectListeningVo();
                subjectListeningVo.setId(qListeningSubject.getId());
                Integer passageId = qListeningSubject.getPassageId();
                QListeningPassage qListeningPassage = qListeningPassageMapper.selectByPrimaryKey(passageId);
                subjectListeningVo.setAudioURL(BaseConstant.audioURL + qListeningPassage.getAudioUrl());
                subjectListeningVo.setImageURL(BaseConstant.audioURL + qListeningPassage.getImageUrl());
                subjectListeningVo.setTitle(qListeningPassage.getTitle());
                subjectListeningVo.setTitleCn(qListeningPassage.getTitleCn());
                QListeningQuestionExample qListeningQuestionExample = new QListeningQuestionExample();
                qListeningQuestionExample.createCriteria().andSubjectIdEqualTo(qListeningSubject.getId());
                List<QListeningQuestion> qListeningQuestions = qListeningQuestionMapper.selectByExample(qListeningQuestionExample);
                List<QuestionListeningVo> questionListeningVos = new ArrayList<>();
                for (QListeningQuestion qListeningQuestion: qListeningQuestions) {
                    QuestionListeningVo questionListeningVo = new QuestionListeningVo();
                    questionListeningVo.setId(qListeningQuestion.getId());
                    questionListeningVo.setOrderNum(qListeningQuestion.getOrderNum());
                    questionListeningVo.setQuestion(qListeningQuestion.getQuestion());
                    questionListeningVo.setQuestionURL(BaseConstant.audioURL + qListeningQuestion.getQuestionUrl());
                    questionListeningVo.setRightAnswer(qListeningQuestion.getRightAnswer());
                    QListeningOptionExample qListeningOptionExample = new QListeningOptionExample();
                    qListeningOptionExample.createCriteria().andQuestionIdEqualTo(qListeningQuestion.getId());
                    List<QListeningOption> qListeningOptions = qListeningOptionMapper.selectByExample(qListeningOptionExample);
                    List<OptionListeningVo> optionListeningVos = new ArrayList<>();
                    for (QListeningOption qListeningOption: qListeningOptions) {
                        OptionListeningVo optionListeningVo = new OptionListeningVo();
                        optionListeningVo.setId(qListeningOption.getId());
                        optionListeningVo.setItemCode(qListeningOption.getItemCode());
                        optionListeningVo.setItemName(qListeningOption.getItemName());
                        optionListeningVo.setOrderNum(qListeningOption.getOrderNum());
                        optionListeningVos.add(optionListeningVo);
                    }
                    questionListeningVo.setOptionListeningVos(optionListeningVos);
                    questionListeningVos.add(questionListeningVo);
                }
                subjectListeningVo.setQuestionListeningVos(questionListeningVos);
                subjectListeningVos.add(subjectListeningVo);
            }
            sectionListeningVo.setSubjectListeningVos(subjectListeningVos);
            examVo.setListening(sectionListeningVo);

            //口语
            SectionSpeakingVo sectionSpeakingVo = new SectionSpeakingVo();
            Integer speakingSectionId = qExam.getSpeakingSectionId();
            QSpeakingSection qSpeakingSection = qSpeakingSectionMapper.selectByPrimaryKey(speakingSectionId);
            sectionSpeakingVo.setName(qSpeakingSection.getName());
            sectionSpeakingVo.setOrderNum(qSpeakingSection.getOrderNum());
            QSpeakingSubjectExample qSpeakingSubjectExample = new QSpeakingSubjectExample();
            qSpeakingSubjectExample.createCriteria().andSectionIdEqualTo(speakingSectionId);
            List<SubjectSpeakingVo> subjectSpeakingVos = new ArrayList<>();
            List<QSpeakingSubject> qSpeakingSubjects = qSpeakingSubjectMapper.selectByExample(qSpeakingSubjectExample);
            for (QSpeakingSubject qSpeakingSubject: qSpeakingSubjects) {
                SubjectSpeakingVo subjectSpeakingVo = new SubjectSpeakingVo();
                subjectSpeakingVo.setId(qSpeakingSubject.getId());
                subjectSpeakingVo.setOrderNum(qSpeakingSubject.getOrderNum());
                QSpeakingQuestionExample qSpeakingQuestionExample = new QSpeakingQuestionExample();
                qSpeakingQuestionExample.createCriteria().andSubjectIdEqualTo(qSpeakingSubject.getId());
                List<QSpeakingQuestionWithBLOBs> qSpeakingQuestionWithBLOBs = qSpeakingQuestionMapper.selectByExampleWithBLOBs(qSpeakingQuestionExample);
                List<QuestionSpeakingVo> questionSpeakingVos = new ArrayList<>();
                for (QSpeakingQuestionWithBLOBs qSpeakingQuestion: qSpeakingQuestionWithBLOBs) {
                    QuestionSpeakingVo questionSpeakingVo = new QuestionSpeakingVo();
                    questionSpeakingVo.setId(qSpeakingQuestion.getId());
                    questionSpeakingVo.setQuestionDescription(qSpeakingQuestion.getQuestionDescription());
                    questionSpeakingVo.setQuestionURL(BaseConstant.audioURL + qSpeakingQuestion.getQuestionUrl());
                    questionSpeakingVo.setDemo1(qSpeakingQuestion.getDemo1());
                    questionSpeakingVo.setDemo2(qSpeakingQuestion.getDemo2());
                    questionSpeakingVo.setOrderNum(qSpeakingQuestion.getOrderNum());
                    questionSpeakingVos.add(questionSpeakingVo);
                }
                subjectSpeakingVo.setQuestionSpeakingVos(questionSpeakingVos);
                subjectSpeakingVos.add(subjectSpeakingVo);
            }
            sectionSpeakingVo.setSubjectSpeakingVos(subjectSpeakingVos);
            examVo.setSpeaking(sectionSpeakingVo);
            //写作部分
            SectionWritingVo sectionWritingVo =new SectionWritingVo();
            Integer writingSectionId = qExam.getWritingSectionId();
            QWritingSection qWritingSection = qWritingSectionMapper.selectByPrimaryKey(writingSectionId);
            sectionWritingVo.setId(qWritingSection.getId());
            sectionWritingVo.setName(qWritingSection.getName());

            QWritingSubjectExample qWritingSubjectExample = new QWritingSubjectExample();
            qWritingSubjectExample.createCriteria().andSectionIdEqualTo(writingSectionId);
            List<SubjectWritingVo> subjectWritingVos = new ArrayList<>();
            List<QWritingSubject> qWritingSubjects = qWritingSubjectMapper.selectByExample(qWritingSubjectExample);
            for (QWritingSubject qWritingSubject:qWritingSubjects) {
                SubjectWritingVo subjectWritingVo = new SubjectWritingVo();
                subjectWritingVo.setId(qWritingSubject.getId());
                subjectWritingVo.setOrderNum(qWritingSubject.getOrderNum());
                QWritingQuestionExample qWritingQuestionExample = new QWritingQuestionExample();
                qWritingQuestionExample.createCriteria().andSubjectIdEqualTo(qWritingSubject.getId());
                List<QuestionWritingVo> questionWritingVos = new ArrayList<>();
                List<QWritingQuestion> qWritingQuestions = qWritingQuestionMapper.selectByExampleWithBLOBs(qWritingQuestionExample);
                for (QWritingQuestion qWritingQuestion:qWritingQuestions) {
                    QuestionWritingVo questionWritingVo = new QuestionWritingVo();
                    questionWritingVo.setId(qWritingQuestion.getId());
                    questionWritingVo.setQuestion(qWritingQuestion.getQuestion());
                    questionWritingVo.setRemark1(qWritingQuestion.getRemark1());
                    questionWritingVo.setRemark2(qWritingQuestion.getRemark());
                    questionWritingVo.setOrderNum(qWritingQuestion.getOrderNum());
                    questionWritingVos.add(questionWritingVo);
                }
                subjectWritingVo.setQuestionWritingVos(questionWritingVos);
                subjectWritingVos.add(subjectWritingVo);
            }
            sectionWritingVo.setSubjectWritingVos(subjectWritingVos);
            examVo.setWriting(sectionWritingVo);
            result.add(examVo);
        }
        return result;
    }

    @Override
    public List<ExamVo> getAllExam() {
        List<ExamVo> examVolist = new ArrayList<>();
        List<QExam> qExams = qExamMapper.selectByExample(null);
        for (QExam qExam:qExams) {
            ExamVo examVo = new ExamVo();
            examVo.setId(qExam.getId());
            examVo.setName(qExam.getName());
            examVo.setRemark(qExam.getReamrk());
            examVo.setCreateTime(DateUtils.changeDate(qExam.getCreateTime()));
            examVo.setReadingName(qReadingSectionMapper.selectByPrimaryKey(qExam.getReadingSectionId()).getName());
            examVo.setListeningName(qListeningSectionMapper.selectByPrimaryKey(qExam.getListeningSectionId()).getName());
            examVo.setSpeakingName(qSpeakingSectionMapper.selectByPrimaryKey(qExam.getSpeakingSectionId()).getName());
            examVo.setWritingName(qWritingSectionMapper.selectByPrimaryKey(qExam.getWritingSectionId()).getName());
            examVo.setReadingId(qReadingSectionMapper.selectByPrimaryKey(qExam.getReadingSectionId()).getId());
            examVo.setListeningId(qListeningSectionMapper.selectByPrimaryKey(qExam.getListeningSectionId()).getId());
            examVo.setSpeakingId(qSpeakingSectionMapper.selectByPrimaryKey(qExam.getSpeakingSectionId()).getId());
            examVo.setWritingId(qWritingSectionMapper.selectByPrimaryKey(qExam.getWritingSectionId()).getId());
            examVolist.add(examVo);
        }
        return examVolist;
    }

    @Override
    public PageInfo<ExamVo> getAllExamPage(Integer pageNo, Integer pageSize) {
        pageNo = pageNo == null ? 1 : pageNo;
        pageSize = pageSize == null ? 10 : pageSize;
        PageHelper.startPage(pageNo, pageSize);
        List<QExam> qExams = qExamMapper.selectByExample(null);
        //用PageInfo对结果进行包装
        PageInfo page = new PageInfo(qExams);
        List<ExamVo> examVolist = new ArrayList<>();
        for (QExam qExam:qExams) {
            ExamVo examVo = new ExamVo();
            examVo.setId(qExam.getId());
            examVo.setName(qExam.getName());
            examVo.setRemark(qExam.getReamrk());
            examVo.setCreateTime(DateUtils.changeDate(qExam.getCreateTime()));
            examVo.setReadingName(qReadingSectionMapper.selectByPrimaryKey(qExam.getReadingSectionId()).getName());
            examVo.setListeningName(qListeningSectionMapper.selectByPrimaryKey(qExam.getListeningSectionId()).getName());
            examVo.setSpeakingName(qSpeakingSectionMapper.selectByPrimaryKey(qExam.getSpeakingSectionId()).getName());
            examVo.setWritingName(qWritingSectionMapper.selectByPrimaryKey(qExam.getWritingSectionId()).getName());
            examVo.setReadingId(qReadingSectionMapper.selectByPrimaryKey(qExam.getReadingSectionId()).getId());
            examVo.setListeningId(qListeningSectionMapper.selectByPrimaryKey(qExam.getListeningSectionId()).getId());
            examVo.setSpeakingId(qSpeakingSectionMapper.selectByPrimaryKey(qExam.getSpeakingSectionId()).getId());
            examVo.setWritingId(qWritingSectionMapper.selectByPrimaryKey(qExam.getWritingSectionId()).getId());
            examVolist.add(examVo);
        }
        page.setList(examVolist);
        return page;
    }



    @Override
    public Map<Integer, String> getAllReadingSection() {
        Map<Integer, String> reading = new HashMap<>();
        List<QReadingSection> qReadingSections = qReadingSectionMapper.selectByExample(null);
        for (QReadingSection qReadingSection : qReadingSections) {
            reading.put(qReadingSection.getId(), qReadingSection.getName());
        }
        return reading;
    }

    @Override
    public Map<Integer, String> getAllListeningSection() {
        Map<Integer, String> listening = new HashMap<>();
        List<QListeningSection> qListeningSections = qListeningSectionMapper.selectByExample(null);
        for (QListeningSection qListeningSection : qListeningSections) {
            listening.put(qListeningSection.getId(), qListeningSection.getName());
        }
        return listening;
    }

    @Override
    public Map<Integer, String> getAllSpeakingSection() {
        Map<Integer,String> speaking = new HashMap<>();
        List<QSpeakingSection> qSpeakingSections = qSpeakingSectionMapper.selectByExample(null);
        for (QSpeakingSection qSpeakingSection:qSpeakingSections) {
            speaking.put(qSpeakingSection.getId(),qSpeakingSection.getName());
        }
        return speaking;
    }

    @Override
    public Map<Integer, String> getAllWritingSection() {
        Map<Integer,String> writing = new HashMap<>();
        List<QWritingSection> qWritingSections = qWritingSectionMapper.selectByExample(null);
        for (QWritingSection qWritingSection:qWritingSections) {
            writing.put(qWritingSection.getId(),qWritingSection.getName());
        }
        return writing;
    }

    @Override
    public Integer insertExamPaper(QExam qExam) {
        if(qExam.getId()==null) {
            qExamMapper.insertAndGetId(qExam);
            return qExam.getId();
        }else {
            qExamMapper.updateByPrimaryKey(qExam);
            return 0;
        }
    }

    @Override
    public void deleteExamPaper(Integer papaerId) {
        qExamMapper.deleteByPrimaryKey(papaerId);
    }

    @Override
    public QExam getExamById(Integer paperId) {
        return qExamMapper.selectByPrimaryKey(paperId);
    }
}
