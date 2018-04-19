package com.auto.mapper;

import com.auto.bean.QDescription;
import com.auto.bean.QDescriptionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

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