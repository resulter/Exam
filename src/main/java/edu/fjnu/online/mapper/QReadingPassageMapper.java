package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QReadingPassage;
import edu.fjnu.online.bean.QReadingPassageExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QReadingPassageMapper {
    long countByExample(QReadingPassageExample example);

    int deleteByExample(QReadingPassageExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QReadingPassage record);

    int insertSelective(QReadingPassage record);

    List<QReadingPassage> selectByExampleWithBLOBs(QReadingPassageExample example);

    List<QReadingPassage> selectByExample(QReadingPassageExample example);

    QReadingPassage selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QReadingPassage record, @Param("example") QReadingPassageExample example);

    int updateByExampleWithBLOBs(@Param("record") QReadingPassage record, @Param("example") QReadingPassageExample example);

    int updateByExample(@Param("record") QReadingPassage record, @Param("example") QReadingPassageExample example);

    int updateByPrimaryKeySelective(QReadingPassage record);

    int updateByPrimaryKeyWithBLOBs(QReadingPassage record);

    int updateByPrimaryKey(QReadingPassage record);
}