package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QWritingSubject;
import edu.fjnu.online.bean.QWritingSubjectExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QWritingSubjectMapper {
    long countByExample(QWritingSubjectExample example);

    int deleteByExample(QWritingSubjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QWritingSubject record);

    int insertSelective(QWritingSubject record);

    List<QWritingSubject> selectByExample(QWritingSubjectExample example);

    QWritingSubject selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QWritingSubject record, @Param("example") QWritingSubjectExample example);

    int updateByExample(@Param("record") QWritingSubject record, @Param("example") QWritingSubjectExample example);

    int updateByPrimaryKeySelective(QWritingSubject record);

    int updateByPrimaryKey(QWritingSubject record);
}