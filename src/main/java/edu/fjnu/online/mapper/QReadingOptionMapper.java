package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QReadingOption;
import edu.fjnu.online.bean.QReadingOptionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QReadingOptionMapper {
    long countByExample(QReadingOptionExample example);

    int deleteByExample(QReadingOptionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QReadingOption record);

    int insertSelective(QReadingOption record);

    List<QReadingOption> selectByExample(QReadingOptionExample example);

    QReadingOption selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QReadingOption record, @Param("example") QReadingOptionExample example);

    int updateByExample(@Param("record") QReadingOption record, @Param("example") QReadingOptionExample example);

    int updateByPrimaryKeySelective(QReadingOption record);

    int updateByPrimaryKey(QReadingOption record);
}