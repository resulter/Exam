package com.auto.mapper;

import com.auto.bean.QWritingQuestion;
import com.auto.bean.QWritingQuestionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QWritingQuestionMapper {
    long countByExample(QWritingQuestionExample example);

    int deleteByExample(QWritingQuestionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QWritingQuestion record);

    int insertSelective(QWritingQuestion record);

    List<QWritingQuestion> selectByExampleWithBLOBs(QWritingQuestionExample example);

    List<QWritingQuestion> selectByExample(QWritingQuestionExample example);

    QWritingQuestion selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QWritingQuestion record, @Param("example") QWritingQuestionExample example);

    int updateByExampleWithBLOBs(@Param("record") QWritingQuestion record, @Param("example") QWritingQuestionExample example);

    int updateByExample(@Param("record") QWritingQuestion record, @Param("example") QWritingQuestionExample example);

    int updateByPrimaryKeySelective(QWritingQuestion record);

    int updateByPrimaryKeyWithBLOBs(QWritingQuestion record);

    int updateByPrimaryKey(QWritingQuestion record);
}