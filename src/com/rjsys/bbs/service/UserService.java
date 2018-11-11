package com.rjsys.bbs.service;

import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.User;
import com.rjsys.bbs.pojo.UserWithBLOBs;
import com.rjsys.bbs.vo.CartVo;
import com.rjsys.bbs.vo.UserVo;

import java.util.List;

public interface UserService {

	//根据手机号和账号查询用户
	public UserVo getUserByUsernameOrMobile(User user);
	
	//注册
	public void addUser(User user);
	
	//根据id查询用户
	public UserWithBLOBs getUserById(Long userId);

	//给用户添加赞的功能
	public void addZanId(User user, Cart cart, CartVo cartBefore);

	//给用户添加收藏的功能
	public void addShoucangId(User user, Cart cart, CartVo cartBefore);

	//更新用户基本资料
	public UserVo updateBase(UserWithBLOBs user);

	///上传头像
	UserVo updateImage(UserWithBLOBs user);

	public User getUserByEmail(String email);

	// 获取用户列表
    List<User> getUserList();

    // 删除用户
	void deleteUser(Long id);

	// 设为管理员
	void vip(Long id);
}
