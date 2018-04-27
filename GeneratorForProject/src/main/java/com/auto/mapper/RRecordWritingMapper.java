package com.auto.mapper;

import com.auto.bean.RRecordWriting;
import com.auto.bean.RRecordWritingExample;
import com.auto.bean.RRecordWritingWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RRecordWritingMapper {
    long countByExample(RRecordWritingExample example);

    int deleteByExample(RRecordWritingExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RRecordWritingWithBLOBs record);

    int insertSelective(RRecordWritingWithBLOBs record);

    List<RRecordWritingWithBLOBs> selectByExampleWithBLOBs(RRecordWritingExample example);

    List<RRecordWriting> selectByExample(RRecordWritingExample example);

    RRecordWritingWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") RRecordWritingWithBLOBs record, @Param("example") RRecordWritingExample example);

    int updateByExampleWithBLOBs(@Param("record") RRecordWritingWithBLOBs record, @Param("example") RRecordWritingExample example);

    int updateByExample(@Param("record") RRecordWriting record, @Param("example") RRecordWritingExample example);

    int updateByPrimaryKeySelective(RRecordWritingWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(RRecordWritingWithBLOBs record);

    int updateByPrimaryKey(RRecordWriting record);
}