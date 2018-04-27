package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.RRecordReadingAndListening;
import edu.fjnu.online.bean.RRecordReadingAndListeningExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RRecordReadingAndListeningMapper {
    long countByExample(RRecordReadingAndListeningExample example);

    int deleteByExample(RRecordReadingAndListeningExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RRecordReadingAndListening record);

    int insertSelective(RRecordReadingAndListening record);

    List<RRecordReadingAndListening> selectByExample(RRecordReadingAndListeningExample example);

    RRecordReadingAndListening selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") RRecordReadingAndListening record, @Param("example") RRecordReadingAndListeningExample example);

    int updateByExample(@Param("record") RRecordReadingAndListening record, @Param("example") RRecordReadingAndListeningExample example);

    int updateByPrimaryKeySelective(RRecordReadingAndListening record);

    int updateByPrimaryKey(RRecordReadingAndListening record);
}