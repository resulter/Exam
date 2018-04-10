package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QReadingQuestion;
import edu.fjnu.online.bean.QReadingQuestionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QReadingQuestionMapper {
    long countByExample(QReadingQuestionExample example);

    int deleteByExample(QReadingQuestionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QReadingQuestion record);

    int insertSelective(QReadingQuestion record);

    List<QReadingQuestion> selectByExampleWithBLOBs(QReadingQuestionExample example);

    List<QReadingQuestion> selectByExample(QReadingQuestionExample example);

    QReadingQuestion selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QReadingQuestion record, @Param("example") QReadingQuestionExample example);

    int updateByExampleWithBLOBs(@Param("record") QReadingQuestion record, @Param("example") QReadingQuestionExample example);

    int updateByExample(@Param("record") QReadingQuestion record, @Param("example") QReadingQuestionExample example);

    int updateByPrimaryKeySelective(QReadingQuestion record);

    int updateByPrimaryKeyWithBLOBs(QReadingQuestion record);

    int updateByPrimaryKey(QReadingQuestion record);
}