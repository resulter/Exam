package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QReadingSection;
import edu.fjnu.online.bean.QReadingSectionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QReadingSectionMapper {
    long countByExample(QReadingSectionExample example);

    int deleteByExample(QReadingSectionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QReadingSection record);

    int insertSelective(QReadingSection record);

    List<QReadingSection> selectByExample(QReadingSectionExample example);

    QReadingSection selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QReadingSection record, @Param("example") QReadingSectionExample example);

    int updateByExample(@Param("record") QReadingSection record, @Param("example") QReadingSectionExample example);

    int updateByPrimaryKeySelective(QReadingSection record);

    int updateByPrimaryKey(QReadingSection record);
}