package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QReadingSubject;
import edu.fjnu.online.bean.QReadingSubjectExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QReadingSubjectMapper {
    long countByExample(QReadingSubjectExample example);

    int deleteByExample(QReadingSubjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QReadingSubject record);

    int insertSelective(QReadingSubject record);

    List<QReadingSubject> selectByExample(QReadingSubjectExample example);

    QReadingSubject selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QReadingSubject record, @Param("example") QReadingSubjectExample example);

    int updateByExample(@Param("record") QReadingSubject record, @Param("example") QReadingSubjectExample example);

    int updateByPrimaryKeySelective(QReadingSubject record);

    int updateByPrimaryKey(QReadingSubject record);
}