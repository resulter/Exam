package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QListeningPassage;
import edu.fjnu.online.bean.QListeningPassageExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QListeningPassageMapper {
    long countByExample(QListeningPassageExample example);

    int deleteByExample(QListeningPassageExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QListeningPassage record);

    int insertSelective(QListeningPassage record);

    List<QListeningPassage> selectByExample(QListeningPassageExample example);

    QListeningPassage selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QListeningPassage record, @Param("example") QListeningPassageExample example);

    int updateByExample(@Param("record") QListeningPassage record, @Param("example") QListeningPassageExample example);

    int updateByPrimaryKeySelective(QListeningPassage record);

    int updateByPrimaryKey(QListeningPassage record);
}