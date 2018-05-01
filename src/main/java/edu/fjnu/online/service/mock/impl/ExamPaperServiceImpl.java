package edu.fjnu.online.service.mock.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.fjnu.online.bean.*;
import edu.fjnu.online.bean.vo.*;
import edu.fjnu.online.domain.User;
import edu.fjnu.online.mapper.*;
import edu.fjnu.online.service.UserService;
import edu.fjnu.online.service.mock.ExamPaperService;
import edu.fjnu.online.service.mock.ExamService;
import edu.fjnu.online.util.BaseConstant;
import edu.fjnu.online.util.DateUtils;
import edu.fjnu.online.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ExamPaperServiceImpl implements ExamPaperService {
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

    @Autowired
    QDescriptionMapper qDescriptionMapper;

    @Autowired
    RRecordReadingAndListeningMapper rRecordReadingAndListeningMapper;
    @Autowired
    RRecordWritingMapper rRecordWritingMapper;
    @Autowired
    RRecordScoreMapper rRecordScoreMapper;
    @Autowired
    UserService userService;

    @Autowired
    TUserMapper tUserMapper;

    @Override
    public List<ExamVo> findAllExam() {
        List<ExamVo> result = new ArrayList<>();
        List<QExam> qExams = qExamMapper.selectByExample(null);
        for (QExam qExam : qExams) {
            result.add(getExamVo(qExam, null, null, null, null, null, null));
        }
        return result;
    }


    @Override
    public List<ExamQuestionReadingVo> getQuestionWithPassageReading(Integer paperId, Integer subjectOrder, Integer questionOrder) {
        List<ExamQuestionReadingVo> resultVo = new ArrayList<>();
        ExamVo examVo = getExamVo(qExamMapper.selectByPrimaryKey(paperId), subjectOrder, questionOrder, null, null, null, null);
        SectionReadingVo sectionReadingVo = examVo.getReading();
        ExamQuestionReadingVo examQuestionReadingVo = new ExamQuestionReadingVo();
        examQuestionReadingVo.setId(sectionReadingVo.getSubjectReadingVos().get(0).getOrderNum());
        examQuestionReadingVo.setPassage(sectionReadingVo.getSubjectReadingVos().get(0).getPassage());
        examQuestionReadingVo.setPassageTitle(sectionReadingVo.getSubjectReadingVos().get(0).getPassageTitle());
        examQuestionReadingVo.setQueation(sectionReadingVo.getSubjectReadingVos().get(0).getQuestionReadingVos().get(0).getQuestion());
        examQuestionReadingVo.setQuestionCount(sectionReadingVo.getSubjectReadingVos().get(0).getQuestionReadingVos().size());
        examQuestionReadingVo.setQuestionNum(sectionReadingVo.getSubjectReadingVos().get(0).getQuestionReadingVos().get(0).getOrderNum());
        examQuestionReadingVo.setOptionReadingVos(sectionReadingVo.getSubjectReadingVos().get(0).getQuestionReadingVos().get(0).getOptionReadingVos());
        resultVo.add(examQuestionReadingVo);
        return resultVo;
    }
    @Override
    public List<ExamQuestionListeningVo> getQuestionWithPassageListening(Integer paperId, Integer subjectOrder, Integer questionOrder) {
        List<ExamQuestionListeningVo> resultVo = new ArrayList<>();
        ExamVo examVo = getExamVo(qExamMapper.selectByPrimaryKey(paperId),  null, null, subjectOrder, questionOrder,null, null);
        SectionListeningVo sectionListeningVo = examVo.getListening();
        ExamQuestionListeningVo examQuestionListeningVo = new ExamQuestionListeningVo();
        examQuestionListeningVo.setId(sectionListeningVo.getSubjectListeningVos().get(0).getOrderNum());
        examQuestionListeningVo.setAudioURL(sectionListeningVo.getSubjectListeningVos().get(0).getAudioURL());
        examQuestionListeningVo.setImageURL(sectionListeningVo.getSubjectListeningVos().get(0).getImageURL());
        examQuestionListeningVo.setTitle(sectionListeningVo.getSubjectListeningVos().get(0).getTitle());
        examQuestionListeningVo.setQuestion(sectionListeningVo.getSubjectListeningVos().get(0).getQuestionListeningVos().get(0).getQuestion());
        examQuestionListeningVo.setQuestionURL(sectionListeningVo.getSubjectListeningVos().get(0).getQuestionListeningVos().get(0).getQuestionURL());
        examQuestionListeningVo.setOptionListeningVos(sectionListeningVo.getSubjectListeningVos().get(0).getQuestionListeningVos().get(0).getOptionListeningVos());
        examQuestionListeningVo.setQuestionNum(sectionListeningVo.getSubjectListeningVos().get(0).getQuestionListeningVos().get(0).getOrderNum());

        resultVo.add(examQuestionListeningVo);
        return resultVo;
    }
    @Override
    public List<ExamQuestionSpeakingVo> getQuestionWithPassageSpeaking(Integer paperId, Integer subjectOrder) {
        List<ExamQuestionSpeakingVo> resultVo = new ArrayList<>();
        ExamVo examVo = getExamVo(qExamMapper.selectByPrimaryKey(paperId), null, null, null, null, null, null);
        SectionSpeakingVo sectionSpeakingVo = examVo.getSpeaking();
        ExamQuestionSpeakingVo examQuestionSpeakingVo = new ExamQuestionSpeakingVo();
        examQuestionSpeakingVo.setId(sectionSpeakingVo.getSubjectSpeakingVos().get(0).getOrderNum());
        examQuestionSpeakingVo.setQuestion(sectionSpeakingVo.getSubjectSpeakingVos().get(0).getQuestionSpeakingVos().get(0).getQuestionDescription());
        examQuestionSpeakingVo.setQuestionURL(sectionSpeakingVo.getSubjectSpeakingVos().get(0).getQuestionSpeakingVos().get(0).getQuestionURL());
        resultVo.add(examQuestionSpeakingVo);
        return resultVo;
    }
    @Override
    public List<ExamQuestionWritingVo> getQuestionWithPassageWriting(Integer paperId, Integer subjectOrder) {
        List<ExamQuestionWritingVo> resultVo = new ArrayList<>();
        ExamVo examVo = getExamVo(qExamMapper.selectByPrimaryKey(paperId), null, null, null, null, null, null);
        SectionWritingVo sectionWritingVo = examVo.getWriting();
        ExamQuestionWritingVo examQuestionWritingVo = new ExamQuestionWritingVo();
        examQuestionWritingVo.setId(sectionWritingVo.getSubjectWritingVos().get(0).getOrderNum());
        examQuestionWritingVo.setQuestion(sectionWritingVo.getSubjectWritingVos().get(0).getQuestionWritingVos().get(0).getQuestion());
        examQuestionWritingVo.setRemark1(sectionWritingVo.getSubjectWritingVos().get(0).getQuestionWritingVos().get(0).getRemark1());
        examQuestionWritingVo.setRemark2(sectionWritingVo.getSubjectWritingVos().get(0).getQuestionWritingVos().get(0).getRemark2());
        resultVo.add(examQuestionWritingVo);
        return resultVo;
    }

    @Override
    public PageInfo<ExamQuestionReadingVo> getReadingQuestionWithPassagePage(Integer pageNo, Integer pageSize, Integer paperId, Integer subjectOrder, Integer questionOrder) {
        pageNo = pageNo == null ? 1 : pageNo;
        pageSize = pageSize == null ? 10 : pageSize;
        QExam qExam = qExamMapper.selectByPrimaryKey(paperId);
        Integer readingSectionId = qExam.getReadingSectionId();
        QReadingSubjectExample qReadingSubjectExample = new QReadingSubjectExample();
        QReadingSubjectExample.Criteria criteria = qReadingSubjectExample.createCriteria();
        criteria.andSectionIdEqualTo(readingSectionId);
        if (subjectOrder != null) {
            criteria.andOrderNumEqualTo(subjectOrder);
        }
        QReadingSubject qReadingSubject = qReadingSubjectMapper.selectByExample(qReadingSubjectExample).get(0);
        Integer passageId = qReadingSubject.getPassageId();
        QReadingPassage qReadingPassage = qReadingPassageMapper.selectByPrimaryKey(passageId);
        QReadingQuestionExample qReadingQuestionExample = new QReadingQuestionExample();
        QReadingQuestionExample.Criteria qReadingQuestionExampleCriteria = qReadingQuestionExample.createCriteria();
        qReadingQuestionExampleCriteria.andSubjectIdEqualTo(qReadingSubject.getId());
        if (questionOrder != null) {
            qReadingQuestionExampleCriteria.andOrderNumEqualTo(questionOrder);
        }
        PageHelper.startPage(pageNo, pageSize);
        List<QReadingQuestion> qReadingQuestions = qReadingQuestionMapper.selectByExampleWithBLOBs(qReadingQuestionExample);
        //用PageInfo对结果进行包装
        PageInfo page = new PageInfo(qReadingQuestions);
        List<ExamQuestionReadingVo> resultVo = new ArrayList<>();
        for (QReadingQuestion qReadingQuestion : qReadingQuestions) {
            ExamQuestionReadingVo examQuestionReadingVo = new ExamQuestionReadingVo();
            examQuestionReadingVo.setId(qReadingSubject.getOrderNum());//返回前端考试时需要展示的数据
            examQuestionReadingVo.setQueation(qReadingQuestion.getQuestion());//返回前端考试时需要展示的数据
            examQuestionReadingVo.setPassageTitle(qReadingPassage.getTitle());//返回前端考试时需要展示的数据
            examQuestionReadingVo.setPassage(qReadingPassage.getContent());//返回前端考试时需要展示的数据
            examQuestionReadingVo.setQuestionNum(qReadingQuestion.getOrderNum());//返回前端考试时需要展示的数据
            examQuestionReadingVo.setQuestionCount(10);//返回前端考试时需要展示的数据--------------------------阅读每篇10道题，固定
            QReadingOptionExample qReadingOptionExample = new QReadingOptionExample();
            qReadingOptionExample.createCriteria().andQuestionIdEqualTo(qReadingQuestion.getId());
            List<QReadingOption> qReadingOptions = qReadingOptionMapper.selectByExample(qReadingOptionExample);
            List<OptionReadingVo> optionReadingVos = new ArrayList<>();
            for (QReadingOption qReadingOption : qReadingOptions) {
                OptionReadingVo optionReadingVo = new OptionReadingVo();
                optionReadingVo.setId(qReadingOption.getId());
                optionReadingVo.setItemCode(qReadingOption.getItemCode());
                optionReadingVo.setItemName(qReadingOption.getItemName());
                optionReadingVo.setOrderNum(qReadingOption.getOrderNum());
                optionReadingVos.add(optionReadingVo);
            }
            examQuestionReadingVo.setOptionReadingVos(optionReadingVos);//返回前端考试时需要展示的数据
            resultVo.add(examQuestionReadingVo);
        }
        page.setList(resultVo);

        return page;
    }

    @Override
    public PageInfo<ExamQuestionListeningVo> getListeningQuestionWithPassagePage(Integer pageNo, Integer pageSize, Integer paperId, Integer subjectOrder, Integer questionOrder) {
        pageNo = pageNo == null ? 1 : pageNo;
        pageSize = pageSize == null ? 10 : pageSize;
        QExam qExam = qExamMapper.selectByPrimaryKey(paperId);
        Integer listeningSectionId = qExam.getListeningSectionId();
        QListeningSubjectExample qListeningSubjectExample = new QListeningSubjectExample();
        QListeningSubjectExample.Criteria listeningSubjectExampleCriteria = qListeningSubjectExample.createCriteria();
        listeningSubjectExampleCriteria.andSectionIdEqualTo(listeningSectionId);
        if (subjectOrder != null) {
            listeningSubjectExampleCriteria.andOrderNumEqualTo(subjectOrder);
        }
        listeningSubjectExampleCriteria.andSectionIdEqualTo(listeningSectionId);
        QListeningSubject qListeningSubject = qListeningSubjectMapper.selectByExample(qListeningSubjectExample).get(0);
//            SubjectListeningVo subjectListeningVo = new SubjectListeningVo();
//            subjectListeningVo.setId(qListeningSubject.getId());
        Integer passageId = qListeningSubject.getPassageId();
        QListeningPassage qListeningPassage = qListeningPassageMapper.selectByPrimaryKey(passageId);
//            subjectListeningVo.setAudioURL(BaseConstant.audioURL + qListeningPassage.getAudioUrl());
//            subjectListeningVo.setImageURL(BaseConstant.audioURL + qListeningPassage.getImageUrl());
//            subjectListeningVo.setTitle(qListeningPassage.getTitle());
//            subjectListeningVo.setTitleCn(qListeningPassage.getTitleCn());
        QListeningQuestionExample qListeningQuestionExample = new QListeningQuestionExample();
        QListeningQuestionExample.Criteria listeningQuestionExampleCriteria = qListeningQuestionExample.createCriteria();
        if (questionOrder != null) {
            listeningQuestionExampleCriteria.andOrderNumEqualTo(questionOrder);
        }
        listeningQuestionExampleCriteria.andSubjectIdEqualTo(qListeningSubject.getId());
        PageHelper.startPage(pageNo, pageSize);
        List<QListeningQuestion> qListeningQuestions = qListeningQuestionMapper.selectByExampleWithBLOBs(qListeningQuestionExample);
        //用PageInfo对结果进行包装
        PageInfo page = new PageInfo(qListeningQuestions);
        List<ExamQuestionListeningVo> examQuestionListeningVos = new ArrayList<>();
        for (QListeningQuestion qListeningQuestion : qListeningQuestions) {
            ExamQuestionListeningVo examQuestionListeningVo = new ExamQuestionListeningVo();
            examQuestionListeningVo.setId(qListeningSubject.getOrderNum());
            examQuestionListeningVo.setAudioURL(BaseConstant.audioURL + qListeningPassage.getAudioUrl());
            examQuestionListeningVo.setImageURL(qListeningPassage.getImageUrl());
            examQuestionListeningVo.setTitle(qListeningPassage.getTitle());
            examQuestionListeningVo.setQuestionNum(qListeningQuestion.getOrderNum());
            examQuestionListeningVo.setQuestionURL(BaseConstant.audioURL + qListeningQuestion.getQuestionUrl());
            examQuestionListeningVo.setQuestionCount(5);
            examQuestionListeningVo.setQuestion(qListeningQuestion.getQuestion());
            QListeningOptionExample qListeningOptionExample = new QListeningOptionExample();
            qListeningOptionExample.createCriteria().andQuestionIdEqualTo(qListeningQuestion.getId());
            List<QListeningOption> qListeningOptions = qListeningOptionMapper.selectByExample(qListeningOptionExample);
            List<OptionListeningVo> optionListeningVos = new ArrayList<>();
            for (QListeningOption qListeningOption : qListeningOptions) {
                OptionListeningVo optionListeningVo = new OptionListeningVo();
                optionListeningVo.setId(qListeningOption.getId());
                optionListeningVo.setItemCode(qListeningOption.getItemCode());
                optionListeningVo.setItemName(qListeningOption.getItemName());
                optionListeningVo.setOrderNum(qListeningOption.getOrderNum());
                optionListeningVos.add(optionListeningVo);
            }
            examQuestionListeningVo.setOptionListeningVos(optionListeningVos);
            examQuestionListeningVos.add(examQuestionListeningVo);
        }
        page.setList(examQuestionListeningVos);
//            subjectListeningVo.setQuestionListeningVos(questionListeningVos);
        return page;
    }

    @Override
    public ExamQuestionSpeakingVo getSpeakingQuestionWithPassagePage(Integer paperId, Integer subjectOrder) {
        QExam qExam = qExamMapper.selectByPrimaryKey(paperId);
        Integer speakingSectionId = qExam.getSpeakingSectionId();

        QSpeakingSubjectExample qSpeakingSubjectExample = new QSpeakingSubjectExample();
        QSpeakingSubjectExample.Criteria speakingSubjectExampleCriteria = qSpeakingSubjectExample.createCriteria();
        if (subjectOrder != null) {
            speakingSubjectExampleCriteria.andOrderNumEqualTo(subjectOrder);
        }
        speakingSubjectExampleCriteria.andSectionIdEqualTo(speakingSectionId);
        List<SubjectSpeakingVo> subjectSpeakingVos = new ArrayList<>();
        QSpeakingSubject qSpeakingSubject = qSpeakingSubjectMapper.selectByExample(qSpeakingSubjectExample).get(0);
        ExamQuestionSpeakingVo examQuestionSpeakingVo = new ExamQuestionSpeakingVo();
        examQuestionSpeakingVo.setId(qSpeakingSubject.getId());
        examQuestionSpeakingVo.setOrderNum(qSpeakingSubject.getOrderNum());

        QSpeakingQuestionExample qSpeakingQuestionExample = new QSpeakingQuestionExample();
        qSpeakingQuestionExample.createCriteria().andSubjectIdEqualTo(qSpeakingSubject.getId());
        QSpeakingQuestionWithBLOBs qSpeakingQuestion = qSpeakingQuestionMapper.selectByExampleWithBLOBs(qSpeakingQuestionExample).get(0);
        examQuestionSpeakingVo.setId(qSpeakingSubject.getOrderNum());
        examQuestionSpeakingVo.setQuestion(qSpeakingQuestion.getQuestionDescription());
        examQuestionSpeakingVo.setQuestionURL(BaseConstant.audioURL+qSpeakingQuestion.getQuestionUrl());
        examQuestionSpeakingVo.setQuestionCount(1);
        return examQuestionSpeakingVo;
    }

    @Override
    public ExamQuestionWritingVo getWritingQuestionWithPassagePage(Integer paperId, Integer subjectOrder) {
        QExam qExam = qExamMapper.selectByPrimaryKey(paperId);
        Integer writingSectionId = qExam.getWritingSectionId();

        QWritingSubjectExample qWritingSubjectExample = new QWritingSubjectExample();
        QWritingSubjectExample.Criteria writingSubjectExampleCriteria = qWritingSubjectExample.createCriteria();
        if (subjectOrder != null) {
            writingSubjectExampleCriteria.andOrderNumEqualTo(subjectOrder);
        }
        writingSubjectExampleCriteria.andSectionIdEqualTo(writingSectionId);
        QWritingSubject qWritingSubject = qWritingSubjectMapper.selectByExample(qWritingSubjectExample).get(0);
        ExamQuestionWritingVo examQuestionWritingVo = new ExamQuestionWritingVo();
        examQuestionWritingVo.setId(qWritingSubject.getOrderNum());
        examQuestionWritingVo.setOrderNum(qWritingSubject.getOrderNum());

        QWritingQuestionExample qWritingQuestionExample = new QWritingQuestionExample();
        qWritingQuestionExample.createCriteria().andSubjectIdEqualTo(qWritingSubject.getId());
        QWritingQuestion qWritingQuestion = qWritingQuestionMapper.selectByExampleWithBLOBs(qWritingQuestionExample).get(0);

        examQuestionWritingVo.setQuestion(qWritingQuestion.getQuestion());
        examQuestionWritingVo.setRemark1(qWritingQuestion.getRemark1());
        examQuestionWritingVo.setRemark2(qWritingQuestion.getRemark());
        return examQuestionWritingVo;
}

    @Override
    public ExamVo getExamPaperById(Integer paperId) {
        return getExamVo(qExamMapper.selectByPrimaryKey(paperId), null, null, null, null, null, null);
    }

    @Override
    public List<ExamVo> getAllExam() {
        List<ExamVo> examVolist = new ArrayList<>();
        List<QExam> qExams = qExamMapper.selectByExample(null);
        for (QExam qExam : qExams) {
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
    public PageInfo<JudgmentWritingVo> getAllWritingRecord(Integer pageNo, Integer pageSize) {
        pageNo = pageNo == null ? 1 : pageNo;
        pageSize = pageSize == null ? 10 : pageSize;
        PageHelper.startPage(pageNo, pageSize);
        List<RRecordWritingWithBLOBs> rRecordWritings = rRecordWritingMapper.selectByExampleWithBLOBs(null);
        //用PageInfo对结果进行包装
        PageInfo page = new PageInfo(rRecordWritings);
        List<JudgmentWritingVo> judgmentWritingVos = new ArrayList<>();
        for (RRecordWritingWithBLOBs rRecordWriting:rRecordWritings) {
            JudgmentWritingVo judgmentWritingVo = new JudgmentWritingVo();
            judgmentWritingVo.setId(rRecordWriting.getId());
            judgmentWritingVo.setTimeStr(rRecordWriting.getTimeStr());
            judgmentWritingVo.setSubmitTime(DateUtils.formatDateTime(rRecordWriting.getSubmitTime()));
            judgmentWritingVo.setCreateTime(DateUtils.formatDateTime(rRecordWriting.getStartTime()));
            judgmentWritingVo.setAnswer(rRecordWriting.getAnswer());
            judgmentWritingVo.setWordCount(rRecordWriting.getWordCount());
            if(rRecordWriting.getRemark()==null){
                judgmentWritingVo.setRemark("");
            }else {
                judgmentWritingVo.setRemark(rRecordWriting.getRemark());

            }
            judgmentWritingVo.setQuestionId(rRecordWriting.getSubjectId());
            judgmentWritingVo.setUserId(rRecordWriting.getUserId());
            if(rRecordWriting.getScore()==null){
                judgmentWritingVo.setJudgementStatus("否");
            }else {
                judgmentWritingVo.setJudgementStatus("是");
            }
            User user = userService.get(rRecordWriting.getUserId());
            judgmentWritingVo.setUserName(user.getUserName());
            judgmentWritingVo.setExamId(rRecordWriting.getExamId());
            judgmentWritingVo.setExamName(qExamMapper.selectByPrimaryKey(rRecordWriting.getExamId()).getName());
            QWritingQuestion qWritingQuestion = qWritingQuestionMapper.selectByPrimaryKey(rRecordWriting.getSubjectId());
            judgmentWritingVo.setQuestion(qWritingQuestion.getQuestion());
            if(rRecordWriting.getScore()!=null) {
                judgmentWritingVo.setScore(rRecordWriting.getScore());
            }
            judgmentWritingVos.add(judgmentWritingVo);
        }
        page.setList(judgmentWritingVos);

        return page;
    }

    @Override
    public PageInfo<JudgmentWritingVo> getAllWritingRecordWithCondition(Integer pageNo, Integer pageSize, String userName, String examName, String startDate, String endDate, Integer type) {
        pageNo = pageNo == null ? 1 : pageNo;
        pageSize = pageSize == null ? 10 : pageSize;
        RRecordWritingExample rRecordWritingExample = new RRecordWritingExample();
        RRecordWritingExample.Criteria rRecordWritingExampleCriteria = rRecordWritingExample.createCriteria();
        if(startDate!=null &&!("".equals(startDate))){
            rRecordWritingExampleCriteria.andStartTimeGreaterThanOrEqualTo(DateUtils.translateStringToDateFull(startDate));
        }
        if(endDate!=null &&!("".equals(endDate))){
            rRecordWritingExampleCriteria.andStartTimeLessThanOrEqualTo(DateUtils.translateStringToDateFull(endDate));
        }
        if(type!=null) {
            if (type == 2) {
                rRecordWritingExampleCriteria.andScoreIsNull();
                System.out.println("====>>>待判");
            } else if (type == 3) {
                rRecordWritingExampleCriteria.andScoreIsNotNull();
                System.out.println("====>>>已判");
            }
        }
        if(!"".equals(examName)&&examName!=null){
            QExamExample qExamExample = new QExamExample();
            qExamExample.createCriteria().andNameLike("%"+examName+"%");
            List<QExam> qExams = qExamMapper.selectByExample(qExamExample);
            List<Integer> ids = new ArrayList<>();
            for (int i = 0; i < qExams.size(); i++) {
                ids.add(qExams.get(i).getId());
            }
            rRecordWritingExampleCriteria.andExamIdIn(ids);

        }
        if(!"".equals(userName)&&userName!=null){
          TUserExample tUserExample = new TUserExample();
          tUserExample.createCriteria().andUsernameLike("%"+userName+"%");
            List<TUser> tUsers = tUserMapper.selectByExample(tUserExample);
            for (int i = 0; i < tUsers.size(); i++) {
                rRecordWritingExampleCriteria.andUserIdEqualTo(tUsers.get(i).getUserid());
            }
        }
        PageHelper.startPage(pageNo, pageSize);
        List<RRecordWritingWithBLOBs> rRecordWritings = rRecordWritingMapper.selectByExampleWithBLOBs(rRecordWritingExample);
        //用PageInfo对结果进行包装
        PageInfo page = new PageInfo(rRecordWritings);
        List<JudgmentWritingVo> judgmentWritingVos = new ArrayList<>();
        for (RRecordWritingWithBLOBs rRecordWriting:rRecordWritings) {
            JudgmentWritingVo judgmentWritingVo = new JudgmentWritingVo();
            judgmentWritingVo.setId(rRecordWriting.getId());
            judgmentWritingVo.setTimeStr(rRecordWriting.getTimeStr());
            judgmentWritingVo.setSubmitTime(DateUtils.formatDateTime(rRecordWriting.getSubmitTime()));
            judgmentWritingVo.setCreateTime(DateUtils.formatDateTime(rRecordWriting.getStartTime()));
            judgmentWritingVo.setAnswer(rRecordWriting.getAnswer());
            judgmentWritingVo.setWordCount(rRecordWriting.getWordCount());
            if(rRecordWriting.getRemark()==null){
                judgmentWritingVo.setRemark("");
            }else {
                judgmentWritingVo.setRemark(rRecordWriting.getRemark());

            }
            judgmentWritingVo.setQuestionId(rRecordWriting.getSubjectId());
            judgmentWritingVo.setUserId(rRecordWriting.getUserId());
            if(rRecordWriting.getScore()==null){
                judgmentWritingVo.setJudgementStatus("否");
            }else {
                judgmentWritingVo.setJudgementStatus("是");
            }
            User user = userService.get(rRecordWriting.getUserId());
            judgmentWritingVo.setUserName(user.getUserName());
            judgmentWritingVo.setExamId(rRecordWriting.getExamId());
            judgmentWritingVo.setExamName(qExamMapper.selectByPrimaryKey(rRecordWriting.getExamId()).getName());
            QWritingQuestion qWritingQuestion = qWritingQuestionMapper.selectByPrimaryKey(rRecordWriting.getSubjectId());
            judgmentWritingVo.setQuestion(qWritingQuestion.getQuestion());
            if(rRecordWriting.getScore()!=null) {
                judgmentWritingVo.setScore(rRecordWriting.getScore());
            }
            judgmentWritingVos.add(judgmentWritingVo);
        }
        if(!"".equals(userName)&&userName!=null){
            for (int i = 0;i<judgmentWritingVos.size();i++) {
                if(!(judgmentWritingVos.get(i).getUserName().contains(userName))){
                    judgmentWritingVos.remove(i);
                }
            }
        }
        page.setList(judgmentWritingVos);

        return page;
    }

    @Override
    public JudgmentWritingVo getOneWritingRecord(Integer id) {
        RRecordWritingWithBLOBs rRecordWriting = rRecordWritingMapper.selectByPrimaryKey(id);
        JudgmentWritingVo judgmentWritingVo = new JudgmentWritingVo();
        judgmentWritingVo.setId(rRecordWriting.getId());
        judgmentWritingVo.setTimeStr(rRecordWriting.getTimeStr());
        judgmentWritingVo.setSubmitTime(DateUtils.formatDateTime(rRecordWriting.getSubmitTime()));
        judgmentWritingVo.setCreateTime(DateUtils.formatDateTime(rRecordWriting.getStartTime()));
        judgmentWritingVo.setAnswer("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rRecordWriting.getAnswer().replaceAll("\n","<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"));
        judgmentWritingVo.setWordCount(rRecordWriting.getWordCount());
        if(rRecordWriting.getRemark()==null){
            judgmentWritingVo.setRemark("");
        }else {
            judgmentWritingVo.setRemark(rRecordWriting.getRemark());

        }
        judgmentWritingVo.setQuestionId(rRecordWriting.getSubjectId());
        judgmentWritingVo.setUserId(rRecordWriting.getUserId());
        if(rRecordWriting.getScore()==null){
            judgmentWritingVo.setJudgementStatus("否");
        }else {
            judgmentWritingVo.setJudgementStatus("是");
        }
        User user = userService.get(rRecordWriting.getUserId());
        judgmentWritingVo.setUserName(user.getUserName());
        judgmentWritingVo.setExamId(rRecordWriting.getExamId());
        judgmentWritingVo.setAnnotation(rRecordWriting.getAnnotation());
        judgmentWritingVo.setExamName(qExamMapper.selectByPrimaryKey(rRecordWriting.getExamId()).getName());
        QWritingQuestion qWritingQuestion = qWritingQuestionMapper.selectByPrimaryKey(rRecordWriting.getSubjectId());
        judgmentWritingVo.setQuestion(qWritingQuestion.getQuestion());
        if(rRecordWriting.getScore()!=null) {
            judgmentWritingVo.setScore(rRecordWriting.getScore());
        }
        return judgmentWritingVo;
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
        for (QExam qExam : qExams) {
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
        Map<Integer, String> speaking = new HashMap<>();
        List<QSpeakingSection> qSpeakingSections = qSpeakingSectionMapper.selectByExample(null);
        for (QSpeakingSection qSpeakingSection : qSpeakingSections) {
            speaking.put(qSpeakingSection.getId(), qSpeakingSection.getName());
        }
        return speaking;
    }

    @Override
    public Map<Integer, String> getAllWritingSection() {
        Map<Integer, String> writing = new HashMap<>();
        List<QWritingSection> qWritingSections = qWritingSectionMapper.selectByExample(null);
        for (QWritingSection qWritingSection : qWritingSections) {
            writing.put(qWritingSection.getId(), qWritingSection.getName());
        }
        return writing;
    }

    @Override
    public Integer insertExamPaper(QExam qExam) {
        if (qExam.getId() == null) {
            qExamMapper.insertAndGetId(qExam);
            return qExam.getId();
        } else {
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

    /**
     * 通过qExam对象拿到examVo对象
     *
     * @param qExam
     * @return
     */
    private ExamVo getExamVo(QExam qExam, Integer readingSubjectOrder, Integer readingQuestionOrder, Integer listeningSubjectOrder, Integer listeningQuestionOrder, Integer speakingSubjectOrder, Integer writingSubjectOrder) {
        ExamVo examVo = new ExamVo();
        examVo.setName(qExam.getName());

        //阅读部分
        SectionReadingVo sectionReadingVo = new SectionReadingVo();
        Integer readingSectionId = qExam.getReadingSectionId();
        QReadingSection qReadingSection = qReadingSectionMapper.selectByPrimaryKey(readingSectionId);
        sectionReadingVo.setId(qReadingSection.getId());
        sectionReadingVo.setName(qReadingSection.getName());
        QReadingSubjectExample qReadingSubjectExample = new QReadingSubjectExample();
        QReadingSubjectExample.Criteria criteria = qReadingSubjectExample.createCriteria();
        criteria.andSectionIdEqualTo(readingSectionId);
        if (readingSubjectOrder != null) {
            criteria.andOrderNumEqualTo(readingSubjectOrder);
        }
        List<QReadingSubject> qReadingSubjects = qReadingSubjectMapper.selectByExample(qReadingSubjectExample);
        List<SubjectReadingVo> subjectReadingVos = new ArrayList<>();
        for (QReadingSubject qReadingSubject : qReadingSubjects) {
            SubjectReadingVo subjectReadingVo = new SubjectReadingVo();
            Integer passageId = qReadingSubject.getPassageId();
            QReadingPassage qReadingPassage = qReadingPassageMapper.selectByPrimaryKey(passageId);
            subjectReadingVo.setId(qReadingSubject.getId());
            subjectReadingVo.setPassage(qReadingPassage.getContent());
            subjectReadingVo.setPassageTitle(qReadingPassage.getTitle());
            subjectReadingVo.setPassageTitleCn(qReadingPassage.getTitleCn());
            subjectReadingVo.setOrderNum(qReadingSubject.getOrderNum());
            QReadingQuestionExample qReadingQuestionExample = new QReadingQuestionExample();
            QReadingQuestionExample.Criteria qReadingQuestionExampleCriteria = qReadingQuestionExample.createCriteria();
            if (readingQuestionOrder != null) {
                qReadingQuestionExampleCriteria.andOrderNumEqualTo(readingQuestionOrder);
            }
            qReadingQuestionExampleCriteria.andSubjectIdEqualTo(qReadingSubject.getId());
            List<QReadingQuestion> qReadingQuestions = qReadingQuestionMapper.selectByExampleWithBLOBs(qReadingQuestionExample);
            List<QuestionReadingVo> questionReadingVos = new ArrayList<>();
            for (QReadingQuestion qReadingQuestion : qReadingQuestions) {
                QuestionReadingVo questionReadingVo = new QuestionReadingVo();
                questionReadingVo.setId(qReadingQuestion.getId());
                questionReadingVo.setQuestion(qReadingQuestion.getQuestion());
                questionReadingVo.setRightAnswer(qReadingQuestion.getRightAnswer());
                questionReadingVo.setOrderNum(qReadingQuestion.getOrderNum());
                QReadingOptionExample qReadingOptionExample = new QReadingOptionExample();
                qReadingOptionExample.createCriteria().andQuestionIdEqualTo(qReadingQuestion.getId());
                List<QReadingOption> qReadingOptions = qReadingOptionMapper.selectByExample(qReadingOptionExample);
                List<OptionReadingVo> optionReadingVos = new ArrayList<>();
                for (QReadingOption qReadingOption : qReadingOptions) {
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
        QListeningSubjectExample.Criteria qListeningSubjectExampleCriteria = qListeningSubjectExample.createCriteria();
        if(listeningSubjectOrder !=null){
            qListeningSubjectExampleCriteria.andOrderNumEqualTo(listeningSubjectOrder);
        }
        qListeningSubjectExampleCriteria.andSectionIdEqualTo(listeningSectionId);


        List<QListeningSubject> qListeningSubjects = qListeningSubjectMapper.selectByExample(qListeningSubjectExample);
        List<SubjectListeningVo> subjectListeningVos = new ArrayList<>();
        for (QListeningSubject qListeningSubject : qListeningSubjects) {
            SubjectListeningVo subjectListeningVo = new SubjectListeningVo();
            subjectListeningVo.setId(qListeningSubject.getId());
            Integer passageId = qListeningSubject.getPassageId();
            QListeningPassage qListeningPassage = qListeningPassageMapper.selectByPrimaryKey(passageId);
            subjectListeningVo.setAudioURL(BaseConstant.audioURL + qListeningPassage.getAudioUrl());
            subjectListeningVo.setImageURL(qListeningPassage.getImageUrl());
            subjectListeningVo.setTitle(qListeningPassage.getTitle());
            subjectListeningVo.setTitleCn(qListeningPassage.getTitleCn());
            QListeningQuestionExample qListeningQuestionExample = new QListeningQuestionExample();
            QListeningQuestionExample.Criteria qListeningQuestionExampleCriteria = qListeningQuestionExample.createCriteria();
            if(listeningQuestionOrder !=null){
                qListeningQuestionExampleCriteria.andOrderNumEqualTo(listeningQuestionOrder);
            }
            qListeningQuestionExampleCriteria.andSubjectIdEqualTo(qListeningSubject.getId());

            List<QListeningQuestion> qListeningQuestions = qListeningQuestionMapper.selectByExampleWithBLOBs(qListeningQuestionExample);
            List<QuestionListeningVo> questionListeningVos = new ArrayList<>();
            for (QListeningQuestion qListeningQuestion : qListeningQuestions) {
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
                for (QListeningOption qListeningOption : qListeningOptions) {
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
        QSpeakingSubjectExample.Criteria qSpeakingSubjectExampleCriteria = qSpeakingSubjectExample.createCriteria();
        if(speakingSubjectOrder !=null){
            qSpeakingSubjectExampleCriteria.andOrderNumEqualTo(speakingSubjectOrder);
        }
        qSpeakingSubjectExampleCriteria.andSectionIdEqualTo(speakingSectionId);
        List<SubjectSpeakingVo> subjectSpeakingVos = new ArrayList<>();
        List<QSpeakingSubject> qSpeakingSubjects = qSpeakingSubjectMapper.selectByExample(qSpeakingSubjectExample);
        for (QSpeakingSubject qSpeakingSubject : qSpeakingSubjects) {
            SubjectSpeakingVo subjectSpeakingVo = new SubjectSpeakingVo();
            subjectSpeakingVo.setId(qSpeakingSubject.getId());
            subjectSpeakingVo.setOrderNum(qSpeakingSubject.getOrderNum());
            QSpeakingQuestionExample qSpeakingQuestionExample = new QSpeakingQuestionExample();
            qSpeakingQuestionExample.createCriteria().andSubjectIdEqualTo(qSpeakingSubject.getId());
            List<QSpeakingQuestionWithBLOBs> qSpeakingQuestionWithBLOBs = qSpeakingQuestionMapper.selectByExampleWithBLOBs(qSpeakingQuestionExample);
            List<QuestionSpeakingVo> questionSpeakingVos = new ArrayList<>();
            for (QSpeakingQuestionWithBLOBs qSpeakingQuestion : qSpeakingQuestionWithBLOBs) {
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
        SectionWritingVo sectionWritingVo = new SectionWritingVo();
        Integer writingSectionId = qExam.getWritingSectionId();
        QWritingSection qWritingSection = qWritingSectionMapper.selectByPrimaryKey(writingSectionId);
        sectionWritingVo.setId(qWritingSection.getId());
        sectionWritingVo.setName(qWritingSection.getName());

        QWritingSubjectExample qWritingSubjectExample = new QWritingSubjectExample();
        QWritingSubjectExample.Criteria qWritingSubjectExampleCriteria = qWritingSubjectExample.createCriteria();
        if(writingSubjectOrder!=null){
            qWritingSubjectExampleCriteria.andOrderNumEqualTo(writingSubjectOrder);
        }
        qWritingSubjectExampleCriteria.andSectionIdEqualTo(writingSectionId);
        List<SubjectWritingVo> subjectWritingVos = new ArrayList<>();
        List<QWritingSubject> qWritingSubjects = qWritingSubjectMapper.selectByExample(qWritingSubjectExample);
        for (QWritingSubject qWritingSubject : qWritingSubjects) {
            SubjectWritingVo subjectWritingVo = new SubjectWritingVo();
            subjectWritingVo.setId(qWritingSubject.getId());
            subjectWritingVo.setOrderNum(qWritingSubject.getOrderNum());
            QWritingQuestionExample qWritingQuestionExample = new QWritingQuestionExample();
            qWritingQuestionExample.createCriteria().andSubjectIdEqualTo(qWritingSubject.getId());
            List<QuestionWritingVo> questionWritingVos = new ArrayList<>();
            List<QWritingQuestion> qWritingQuestions = qWritingQuestionMapper.selectByExampleWithBLOBs(qWritingQuestionExample);
            for (QWritingQuestion qWritingQuestion : qWritingQuestions) {
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
        return examVo;
    }

    @Override
    public QDescription getDescription(Integer sectionId) {
        return qDescriptionMapper.selectByPrimaryKey(sectionId);
    }


    @Override
    public void saveReadingOption(String userId, Integer paperId, String timeStr, String subjectOrder, String answer, Integer examType) {
        String[] split = timeStr.split("@");
        String tStr = split[0];
        Date createDate = DateUtils.parseDate(split[1]);


        QExam qExam = qExamMapper.selectByPrimaryKey(paperId);//getExamPaper
        QReadingSubjectExample qReadingSubjectExample = new QReadingSubjectExample();
        qReadingSubjectExample.createCriteria().andSectionIdEqualTo(qExam.getReadingSectionId()).andOrderNumEqualTo(Integer.parseInt(subjectOrder));
        QReadingSubject qReadingSubject = qReadingSubjectMapper.selectByExample(qReadingSubjectExample).get(0);
        String[] answers = answer.split(",");
        int rightCount = 0;
        for (int i = 0; i < answers.length; i++) {
            System.out.println("第" + (i + 1) + "题的答案是" + answers[i]);
            RRecordReadingAndListening rRecordReadingAndListening = new RRecordReadingAndListening();
            rRecordReadingAndListening.setExamId(paperId);
            rRecordReadingAndListening.setUserId(userId);
            rRecordReadingAndListening.setSubjectId(qReadingSubject.getId());

            QReadingQuestionExample qReadingQuestionExample = new QReadingQuestionExample();
            qReadingQuestionExample.createCriteria().andSubjectIdEqualTo(qReadingSubject.getId()).andOrderNumEqualTo((i+1));
            QReadingQuestion qReadingQuestion = qReadingQuestionMapper.selectByExample(qReadingQuestionExample).get(0);

            rRecordReadingAndListening.setQuestionId(qReadingQuestion.getId());
            rRecordReadingAndListening.setAnswer(answers[i]);

            if(answers[i].equals(qReadingQuestion.getRightAnswer())){
                rRecordReadingAndListening.setIsRight(1);
                rightCount++;
            }else {
                rRecordReadingAndListening.setIsRight(0);
            }
            rRecordReadingAndListening.setType(examType);
            rRecordReadingAndListening.setSubmitTime(new Date());
            rRecordReadingAndListening.setStartTime(createDate);
            rRecordReadingAndListening.setTimeStr(tStr);
            rRecordReadingAndListeningMapper.insert(rRecordReadingAndListening);
        }

        //根据时间戳来计算分数
        RRecordScoreExample rRecordScoreExample = new RRecordScoreExample();
        rRecordScoreExample.createCriteria().andTimeStrEqualTo(tStr);
        List<RRecordScore> rRecordScores = rRecordScoreMapper.selectByExample(rRecordScoreExample);
        if(rRecordScores.size()==0){
            RRecordScore rRecordScore = new RRecordScore();
            rRecordScore.setUserId(userId);
            rRecordScore.setTimeStr(tStr);
            rRecordScore.setCreateTime(createDate);
            rRecordScore.setSubmitTime(new Date());
            rRecordScore.setReadingScore(rightCount * BaseConstant.readingValue);
            rRecordScore.setSumScore(rightCount * BaseConstant.readingValue);
            rRecordScoreMapper.insert(rRecordScore);
        }else {
            RRecordScore oldScore = rRecordScores.get(0);//这里只获取了通过时间戳拿到的第一条数据，暂未考虑多余错误数据
            RRecordScore rRecordScore = new RRecordScore();
            rRecordScore.setId(oldScore.getId());
            rRecordScore.setUserId(userId);
            rRecordScore.setTimeStr(tStr);
            rRecordScore.setCreateTime(createDate);
            rRecordScore.setSubmitTime(new Date());
            rRecordScore.setReadingScore(rightCount * BaseConstant.readingValue+oldScore.getReadingScore());
            rRecordScore.setSumScore(rightCount * BaseConstant.readingValue + oldScore.getSumScore());
            rRecordScoreMapper.updateByPrimaryKey(rRecordScore);
        }
    }

    @Override
    public void saveListeningOption(String userId, Integer paperId, String timeStr, String subjectOrder, String answer, Integer examType) {
        String[] split = timeStr.split("@");
        String tStr = split[0];
        Date createDate = DateUtils.parseDate(split[1]);


        QExam qExam = qExamMapper.selectByPrimaryKey(paperId);//getExamPaper
        QListeningSubjectExample qListeningSubjectExample = new QListeningSubjectExample();
        qListeningSubjectExample.createCriteria().andSectionIdEqualTo(qExam.getReadingSectionId()).andOrderNumEqualTo(Integer.parseInt(subjectOrder));
        QListeningSubject qListeningSubject = qListeningSubjectMapper.selectByExample(qListeningSubjectExample).get(0);
        String[] answers = answer.split(",");
        int rightCount = 0;
        for (int i = 0; i < answers.length; i++) {
            System.out.println("第" + (i + 1) + "题的答案是" + answers[i]);
            RRecordReadingAndListening rRecordReadingAndListening = new RRecordReadingAndListening();
            rRecordReadingAndListening.setExamId(paperId);
            rRecordReadingAndListening.setUserId(userId);
            rRecordReadingAndListening.setSubjectId(qListeningSubject.getId());

            QListeningQuestionExample qListeningQuestionExample = new QListeningQuestionExample();
            qListeningQuestionExample.createCriteria().andSubjectIdEqualTo(qListeningSubject.getId()).andOrderNumEqualTo((i+1));
            QListeningQuestion qListeningQuestion = qListeningQuestionMapper.selectByExample(qListeningQuestionExample).get(0);

            rRecordReadingAndListening.setQuestionId(qListeningQuestion.getId());
            rRecordReadingAndListening.setAnswer(answers[i]);

            if(answers[i].equals(qListeningQuestion.getRightAnswer())){
                rRecordReadingAndListening.setIsRight(1);
                rightCount++;
            }else {
                rRecordReadingAndListening.setIsRight(0);
            }
            rRecordReadingAndListening.setType(examType);
            rRecordReadingAndListening.setSubmitTime(new Date());
            rRecordReadingAndListening.setStartTime(createDate);
            rRecordReadingAndListening.setTimeStr(tStr);
            rRecordReadingAndListeningMapper.insert(rRecordReadingAndListening);
        }
        //根据时间戳来计算分数
        RRecordScoreExample rRecordScoreExample = new RRecordScoreExample();
        rRecordScoreExample.createCriteria().andTimeStrEqualTo(tStr);
        List<RRecordScore> rRecordScores = rRecordScoreMapper.selectByExample(rRecordScoreExample);
        if(rRecordScores.size()==0){
            RRecordScore rRecordScore = new RRecordScore();
            rRecordScore.setUserId(userId);
            rRecordScore.setTimeStr(tStr);
            rRecordScore.setCreateTime(createDate);
            rRecordScore.setSubmitTime(new Date());
            rRecordScore.setListeningScore(rightCount * BaseConstant.listeningValue);
            rRecordScore.setSumScore(rightCount * BaseConstant.listeningValue);
            rRecordScoreMapper.insert(rRecordScore);
        }else {
            RRecordScore oldScore = rRecordScores.get(0);//这里只获取了通过时间戳拿到的第一条数据，暂未考虑多余错误数据
            RRecordScore rRecordScore = new RRecordScore();
            rRecordScore.setId(oldScore.getId());
            rRecordScore.setUserId(userId);
            rRecordScore.setTimeStr(tStr);
            rRecordScore.setCreateTime(createDate);
            rRecordScore.setSubmitTime(new Date());
            rRecordScore.setReadingScore(oldScore.getReadingScore());
            float oldListening = oldScore.getListeningScore()==null?0.0f:oldScore.getListeningScore();
            rRecordScore.setListeningScore(rightCount * BaseConstant.listeningValue+oldListening);
            rRecordScore.setSumScore(rightCount * BaseConstant.listeningValue + oldScore.getSumScore());
            rRecordScoreMapper.updateByPrimaryKey(rRecordScore);
        }
    }

    @Override
    public void saveWriting(String userId, Integer paperId, String timeStr, String subjectOrder, String answer) {
        String[] split = timeStr.split("@");
        String tStr = split[0];
        Date createDate = DateUtils.parseDate(split[1]);


        QExam qExam = qExamMapper.selectByPrimaryKey(paperId);//getExamPaper
        QWritingSubjectExample qWritingSubjectExample = new QWritingSubjectExample();
        qWritingSubjectExample.createCriteria().andSectionIdEqualTo(qExam.getReadingSectionId()).andOrderNumEqualTo(Integer.parseInt(subjectOrder));
        QWritingSubject qWritingSubject = qWritingSubjectMapper.selectByExample(qWritingSubjectExample).get(0);
        String[] answers = answer.split(",");

        RRecordWritingWithBLOBs rRecordWriting = new RRecordWritingWithBLOBs();

        rRecordWriting.setUserId(userId);
        rRecordWriting.setExamId(paperId);
        rRecordWriting.setSubjectId(qWritingSubject.getId());
        rRecordWriting.setAnswer(answer);
        rRecordWriting.setWordCount(StringUtils.getWordCount(answer));
        rRecordWriting.setSubmitTime(new Date());
        rRecordWriting.setStartTime(createDate);
        rRecordWriting.setTimeStr(tStr);
        rRecordWritingMapper.insert(rRecordWriting);
    }

    @Override
    public void saveWritingScore(Integer id, float score, String annotation) {
        RRecordWritingWithBLOBs rRecordWritingWithBLOBs = rRecordWritingMapper.selectByPrimaryKey(id);
        rRecordWritingWithBLOBs.setScore(score);
        rRecordWritingWithBLOBs.setAnnotation(annotation);
        rRecordWritingMapper.updateByPrimaryKeyWithBLOBs(rRecordWritingWithBLOBs);
    }
}
