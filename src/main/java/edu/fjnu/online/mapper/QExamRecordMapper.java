package edu.fjnu.online.mapper;


import edu.fjnu.online.bean.QExamRecord;
import edu.fjnu.online.bean.QExamRecordExample;
import edu.fjnu.online.bean.QExamRecordWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QExamRecordMapper {
    long countByExample(QExamRecordExample example);

    int deleteByExample(QExamRecordExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QExamRecordWithBLOBs record);

    int insertSelective(QExamRecordWithBLOBs record);

    List<QExamRecordWithBLOBs> selectByExampleWithBLOBs(QExamRecordExample example);

    List<QExamRecord> selectByExample(QExamRecordExample example);

    QExamRecordWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QExamRecordWithBLOBs record, @Param("example") QExamRecordExample example);

    int updateByExampleWithBLOBs(@Param("record") QExamRecordWithBLOBs record, @Param("example") QExamRecordExample example);

    int updateByExample(@Param("record") QExamRecord record, @Param("example") QExamRecordExample example);

    int updateByPrimaryKeySelective(QExamRecordWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(QExamRecordWithBLOBs record);

    int updateByPrimaryKey(QExamRecord record);
}