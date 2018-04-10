package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QWritingSection;
import edu.fjnu.online.bean.QWritingSectionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QWritingSectionMapper {
    long countByExample(QWritingSectionExample example);

    int deleteByExample(QWritingSectionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QWritingSection record);

    int insertSelective(QWritingSection record);

    List<QWritingSection> selectByExample(QWritingSectionExample example);

    QWritingSection selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QWritingSection record, @Param("example") QWritingSectionExample example);

    int updateByExample(@Param("record") QWritingSection record, @Param("example") QWritingSectionExample example);

    int updateByPrimaryKeySelective(QWritingSection record);

    int updateByPrimaryKey(QWritingSection record);
}