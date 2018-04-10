package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QListeningSubject;
import edu.fjnu.online.bean.QListeningSubjectExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QListeningSubjectMapper {
    long countByExample(QListeningSubjectExample example);

    int deleteByExample(QListeningSubjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QListeningSubject record);

    int insertSelective(QListeningSubject record);

    List<QListeningSubject> selectByExample(QListeningSubjectExample example);

    QListeningSubject selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QListeningSubject record, @Param("example") QListeningSubjectExample example);

    int updateByExample(@Param("record") QListeningSubject record, @Param("example") QListeningSubjectExample example);

    int updateByPrimaryKeySelective(QListeningSubject record);

    int updateByPrimaryKey(QListeningSubject record);
}