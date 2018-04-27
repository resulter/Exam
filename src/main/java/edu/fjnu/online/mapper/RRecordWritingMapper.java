package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.RRecordWriting;
import edu.fjnu.online.bean.RRecordWritingExample;
import edu.fjnu.online.bean.RRecordWritingWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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