package com.rjsys.bbs.mapper;

import com.rjsys.bbs.pojo.User;
import com.rjsys.bbs.pojo.UserExample;
import com.rjsys.bbs.pojo.UserWithBLOBs;
import com.rjsys.bbs.vo.UserVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserVoMapper {
    
    UserVo selectUserByUsernameOrMobile(User user);

	void addUser(User user);

	UserVo selectUserById(Long userId);
    
}