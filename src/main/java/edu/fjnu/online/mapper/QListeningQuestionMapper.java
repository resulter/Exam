package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QListeningQuestion;
import edu.fjnu.online.bean.QListeningQuestionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QListeningQuestionMapper {
    long countByExample(QListeningQuestionExample example);

    int deleteByExample(QListeningQuestionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QListeningQuestion record);

    int insertSelective(QListeningQuestion record);

    List<QListeningQuestion> selectByExampleWithBLOBs(QListeningQuestionExample example);

    List<QListeningQuestion> selectByExample(QListeningQuestionExample example);

    QListeningQuestion selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QListeningQuestion record, @Param("example") QListeningQuestionExample example);

    int updateByExampleWithBLOBs(@Param("record") QListeningQuestion record, @Param("example") QListeningQuestionExample example);

    int updateByExample(@Param("record") QListeningQuestion record, @Param("example") QListeningQuestionExample example);

    int updateByPrimaryKeySelective(QListeningQuestion record);

    int updateByPrimaryKeyWithBLOBs(QListeningQuestion record);

    int updateByPrimaryKey(QListeningQuestion record);
}