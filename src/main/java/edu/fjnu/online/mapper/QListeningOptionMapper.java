package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QListeningOption;
import edu.fjnu.online.bean.QListeningOptionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QListeningOptionMapper {
    long countByExample(QListeningOptionExample example);

    int deleteByExample(QListeningOptionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QListeningOption record);

    int insertSelective(QListeningOption record);

    List<QListeningOption> selectByExample(QListeningOptionExample example);

    QListeningOption selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QListeningOption record, @Param("example") QListeningOptionExample example);

    int updateByExample(@Param("record") QListeningOption record, @Param("example") QListeningOptionExample example);

    int updateByPrimaryKeySelective(QListeningOption record);

    int updateByPrimaryKey(QListeningOption record);
}