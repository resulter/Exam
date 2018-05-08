package edu.fjnu.online.service.mock.impl;

import edu.fjnu.online.bean.*;
import edu.fjnu.online.bean.vo.ExamVo;
import edu.fjnu.online.bean.vo.RRecordScoreVo;
import edu.fjnu.online.bean.vo.RecordExamVo;
import edu.fjnu.online.bean.vo.RecordVo;
import edu.fjnu.online.mapper.QExamMapper;
import edu.fjnu.online.mapper.RRecordReadingAndListeningMapper;
import edu.fjnu.online.mapper.RRecordScoreMapper;
import edu.fjnu.online.mapper.RRecordWritingMapper;
import edu.fjnu.online.service.mock.ExamPaperService;
import edu.fjnu.online.service.mock.QueryService;
import edu.fjnu.online.service.mock.RecordService;
import edu.fjnu.online.util.DateUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecordServiceImpl implements RecordService {
    @Autowired
    RRecordReadingAndListeningMapper rRecordReadingAndListeningMapper;
    @Autowired
    RRecordWritingMapper rRecordWritingMapper;
    @Autowired
    QExamMapper qExamMapper;
    @Autowired
    ExamPaperService examPaperService;

    @Override
    public List<RecordVo> getRecordByUserID(String userID) {
        RRecordReadingAndListeningExample rRecordReadingAndListeningExample = new RRecordReadingAndListeningExample();
        rRecordReadingAndListeningExample.createCriteria().andUserIdEqualTo(userID);
        List<RRecordReadingAndListening> rRecordReadingAndListenings = rRecordReadingAndListeningMapper.selectByExample(rRecordReadingAndListeningExample);
        List<RecordVo> recordVos = new ArrayList<>();
        List<String> timeStrList = new ArrayList<>();
        for (RRecordReadingAndListening rRecordReadingAndListening : rRecordReadingAndListenings) {

            if (timeStrList.contains(rRecordReadingAndListening.getTimeStr())) {
                continue;
            }
            RecordVo recordVo = new RecordVo();
            recordVo.setCreateTime(DateUtils.changeDate(rRecordReadingAndListening.getStartTime()));
            recordVo.setTimeStr(rRecordReadingAndListening.getTimeStr());
            recordVo.setExamName(qExamMapper.selectByPrimaryKey(rRecordReadingAndListening.getExamId()).getName());
            timeStrList.add(rRecordReadingAndListening.getTimeStr());
            recordVos.add(recordVo);
        }
        return recordVos;
    }


    @Override
    public RecordExamVo geteExamRecordInfoByTimeStr(String timeStr, Integer onlyWrong) {
        RecordExamVo recordExamVo = new RecordExamVo();
        List<String> readingOne = new ArrayList<>();
        List<String> readingTwo= new ArrayList<>();;
        List<String> listeningOne= new ArrayList<>();;
        List<String> listeningTwo= new ArrayList<>();;
        List<String> listeningThree= new ArrayList<>();;
        List<Integer> readingOneRight= new ArrayList<>();;//第？篇是否正确
        List<Integer> readingTwoRight= new ArrayList<>();;
        List<Integer> listeningOneRight= new ArrayList<>();;
        List<Integer> listeningTwoRight= new ArrayList<>();;
        List<Integer> listeningThreeRight= new ArrayList<>();;
        RRecordReadingAndListeningExample rRecordReadingAndListeningExample = new RRecordReadingAndListeningExample();
        RRecordReadingAndListeningExample.Criteria rRecordReadingAndListeningExampleCriteria = rRecordReadingAndListeningExample.createCriteria();
        if (onlyWrong != 0) {
            rRecordReadingAndListeningExampleCriteria.andIsRightEqualTo(0);
        }
        rRecordReadingAndListeningExampleCriteria.andTimeStrEqualTo(timeStr);
        List<RRecordReadingAndListening> rRecordReadingAndListenings = rRecordReadingAndListeningMapper.selectByExample(rRecordReadingAndListeningExample);
//        List<Map<String, Integer>> answers = new ArrayList<>();
        Map<String, Integer> answer = new HashMap<>();
        List<RRecordReadingAndListening> readingList = new ArrayList<>();
        List<RRecordReadingAndListening> listeningList = new ArrayList<>();
        for (RRecordReadingAndListening rrral : rRecordReadingAndListenings) {
            if (rrral.getType() == 1) {//阅读
               readingList.add(rrral);
            } else if ( rrral.getType() == 2) {//听力
                listeningList.add(rrral);
            }
        }
        //把阅读的20个结果分给两个list
        String reading = "";
        Integer readingRight = null;
        String myAnswer = null;
        Integer myAnswerIsRight = null;
        for (int i = 0; i < readingList.size(); i++) {
            myAnswer = readingList.get(i).getAnswer();
            myAnswerIsRight= readingList.get(i).getIsRight();
            if(i<10){
//                recordExamVo.getReading().getSubjectReadingVos().get(0).getQuestionReadingVos().get(i).setMyAnswer(myAnswer);
//                recordExamVo.getReading().getSubjectReadingVos().get(0).getQuestionReadingVos().get(i).setMyAnswerIsRight(myAnswerIsRight);
                readingOne.add(readingList.get(i).getAnswer());
                readingOneRight.add(readingList.get(i).getIsRight());
            }else  if(i>=10&&i<20){
//                recordExamVo.getReading().getSubjectReadingVos().get(1).getQuestionReadingVos().get(i).setMyAnswer(myAnswer);
//                recordExamVo.getReading().getSubjectReadingVos().get(1).getQuestionReadingVos().get(i).setMyAnswerIsRight(myAnswerIsRight);
                readingTwo.add(readingList.get(i).getAnswer());
                readingTwoRight.add(readingList.get(i).getIsRight());
            }
        }
        //把听力的20个结果分给两个list
        for (int i = 0; i < listeningList.size(); i++) {
            myAnswer = listeningList.get(i).getAnswer();
            myAnswerIsRight= listeningList.get(i).getIsRight();
            if(i<5){
//                recordExamVo.getListening().getSubjectListeningVos().get(0).getQuestionListeningVos().get(i).setMyAnswer(myAnswer);
//                recordExamVo.getListening().getSubjectListeningVos().get(0).getQuestionListeningVos().get(i).setMyAnswerIsRight(myAnswerIsRight);
                listeningOne.add(listeningList.get(i).getAnswer());
                listeningOneRight.add(listeningList.get(i).getIsRight());
            }else  if(i>=5&&i<10){
//                recordExamVo.getListening().getSubjectListeningVos().get(1).getQuestionListeningVos().get(i).setMyAnswer(myAnswer);
//                recordExamVo.getListening().getSubjectListeningVos().get(1).getQuestionListeningVos().get(i).setMyAnswerIsRight(myAnswerIsRight);
                listeningTwo.add(listeningList.get(i).getAnswer());
                listeningTwoRight.add(listeningList.get(i).getIsRight());
            }else if(i>=10&&i<15){
//                recordExamVo.getListening().getSubjectListeningVos().get(2).getQuestionListeningVos().get(i).setMyAnswer(myAnswer);
//                recordExamVo.getListening().getSubjectListeningVos().get(2).getQuestionListeningVos().get(i).setMyAnswerIsRight(myAnswerIsRight);
                listeningThree.add(listeningList.get(i).getAnswer());
                listeningThreeRight.add(listeningList.get(i).getIsRight());
            }
        }

        RRecordWritingExample rRecordWritingExample = new RRecordWritingExample();
        rRecordWritingExample.createCriteria().andTimeStrEqualTo(timeStr);
        List<RRecordWritingWithBLOBs> rRecordWriting = rRecordWritingMapper.selectByExampleWithBLOBs(rRecordWritingExample);
        List<String> writingAnswers = new ArrayList<>();
        List<String> writingAnnotations = new ArrayList<>();
        List<Float> writingScores = new ArrayList<>();
        for (RRecordWritingWithBLOBs rrwwb : rRecordWriting) {
            writingAnswers.add(rrwwb.getAnswer());
            writingAnnotations.add(rrwwb.getAnnotation());
            writingScores.add(rrwwb.getScore());
        }

        ExamVo examPaperById = examPaperService.getExamPaperById(rRecordWriting.get(0).getExamId());//通过examId拿到一整套试卷信息
        BeanUtils.copyProperties(examPaperById, recordExamVo);
        recordExamVo.setTimeStr(timeStr);

        recordExamVo.setMyWritingAnswers(writingAnswers);
        recordExamVo.setMyWritingAnnotation(writingAnnotations);
        recordExamVo.setMyWritingScore(writingScores);
        recordExamVo.setReadingOne(readingOne);
        recordExamVo.setReadingOneRight(readingOneRight);
        recordExamVo.setReadingTwo(readingTwo);
        recordExamVo.setReadingTwoRight(readingTwoRight);
        recordExamVo.setListeningOne(listeningOne);
        recordExamVo.setListeningOneRight(listeningOneRight);
        recordExamVo.setListeningTwo(listeningTwo);
        recordExamVo.setListeningTwoRight(listeningTwoRight);
        recordExamVo.setListeningThree(listeningThree);
        recordExamVo.setListeningThreeRight(listeningThreeRight);
        return recordExamVo;
    }
}
