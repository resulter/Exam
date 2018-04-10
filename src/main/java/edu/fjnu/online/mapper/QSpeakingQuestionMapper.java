package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QSpeakingQuestion;
import edu.fjnu.online.bean.QSpeakingQuestionExample;
import edu.fjnu.online.bean.QSpeakingQuestionWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QSpeakingQuestionMapper {
    long countByExample(QSpeakingQuestionExample example);

    int deleteByExample(QSpeakingQuestionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QSpeakingQuestionWithBLOBs record);

    int insertSelective(QSpeakingQuestionWithBLOBs record);

    List<QSpeakingQuestionWithBLOBs> selectByExampleWithBLOBs(QSpeakingQuestionExample example);

    List<QSpeakingQuestion> selectByExample(QSpeakingQuestionExample example);

    QSpeakingQuestionWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QSpeakingQuestionWithBLOBs record, @Param("example") QSpeakingQuestionExample example);

    int updateByExampleWithBLOBs(@Param("record") QSpeakingQuestionWithBLOBs record, @Param("example") QSpeakingQuestionExample example);

    int updateByExample(@Param("record") QSpeakingQuestion record, @Param("example") QSpeakingQuestionExample example);

    int updateByPrimaryKeySelective(QSpeakingQuestionWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(QSpeakingQuestionWithBLOBs record);

    int updateByPrimaryKey(QSpeakingQuestion record);
}