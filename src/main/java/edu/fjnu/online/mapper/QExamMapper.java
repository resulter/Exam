package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.QExam;
import edu.fjnu.online.bean.QExamExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Repository
public interface QExamMapper {
    long countByExample(QExamExample example);

    int deleteByExample(QExamExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QExam record);

    int insertSelective(QExam record);

    List<QExam> selectByExample(QExamExample example);

    QExam selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QExam record, @Param("example") QExamExample example);

    int updateByExample(@Param("record") QExam record, @Param("example") QExamExample example);

    int updateByPrimaryKeySelective(QExam record);

    int updateByPrimaryKey(QExam record);
}