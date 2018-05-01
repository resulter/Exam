package edu.fjnu.online.mapper;

import edu.fjnu.online.bean.TUser;
import edu.fjnu.online.bean.TUserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TUserMapper {
    long countByExample(TUserExample example);

    int deleteByExample(TUserExample example);

    int deleteByPrimaryKey(String userid);

    int insert(TUser record);

    int insertSelective(TUser record);

    List<TUser> selectByExample(TUserExample example);

    TUser selectByPrimaryKey(String userid);

    int updateByExampleSelective(@Param("record") TUser record, @Param("example") TUserExample example);

    int updateByExample(@Param("record") TUser record, @Param("example") TUserExample example);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
}