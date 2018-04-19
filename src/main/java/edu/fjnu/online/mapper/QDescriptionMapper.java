package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QDescription;
import edu.fjnu.online.bean.QDescriptionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QDescriptionMapper {
    long countByExample(QDescriptionExample example);

    int deleteByExample(QDescriptionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QDescription record);

    int insertSelective(QDescription record);

    List<QDescription> selectByExampleWithBLOBs(QDescriptionExample example);

    List<QDescription> selectByExample(QDescriptionExample example);

    QDescription selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QDescription record, @Param("example") QDescriptionExample example);

    int updateByExampleWithBLOBs(@Param("record") QDescription record, @Param("example") QDescriptionExample example);

    int updateByExample(@Param("record") QDescription record, @Param("example") QDescriptionExample example);

    int updateByPrimaryKeySelective(QDescription record);

    int updateByPrimaryKeyWithBLOBs(QDescription record);

    int updateByPrimaryKey(QDescription record);
}