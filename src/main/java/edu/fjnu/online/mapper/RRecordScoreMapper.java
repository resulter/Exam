package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.RRecordScore;
import edu.fjnu.online.bean.RRecordScoreExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RRecordScoreMapper {
    long countByExample(RRecordScoreExample example);

    int deleteByExample(RRecordScoreExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RRecordScore record);

    int insertSelective(RRecordScore record);

    List<RRecordScore> selectByExample(RRecordScoreExample example);

    RRecordScore selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") RRecordScore record, @Param("example") RRecordScoreExample example);

    int updateByExample(@Param("record") RRecordScore record, @Param("example") RRecordScoreExample example);

    int updateByPrimaryKeySelective(RRecordScore record);

    int updateByPrimaryKey(RRecordScore record);
}