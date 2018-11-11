package com.rjsys.bbs.service.impl;

import com.rjsys.bbs.mapper.UserMapper;
import com.rjsys.bbs.mapper.UserVoMapper;
import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.User;
import com.rjsys.bbs.pojo.UserExample;
import com.rjsys.bbs.pojo.UserExample.Criteria;
import com.rjsys.bbs.pojo.UserWithBLOBs;
import com.rjsys.bbs.service.UserService;
import com.rjsys.bbs.vo.CartVo;
import com.rjsys.bbs.vo.UserVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper user1Mapper;
    @Autowired
    private UserVoMapper userMapper;


    //根据用户名或手机号或邮箱查询用户
    @Override
    public UserVo getUserByUsernameOrMobile(User user) {
        UserVo u = userMapper.selectUserByUsernameOrMobile(user);
        return u;
    }

    //注册
    @Override
    public void addUser(User user) {
        //补充user属性
        //注册时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");

        user.setTime(sdf.format(new Date()));
        userMapper.addUser(user);
    }

    @Override
    public UserWithBLOBs getUserById(Long userId) {
        return user1Mapper.selectByPrimaryKey(userId);
    }

    @Override
    public void addZanId(User user, Cart cart, CartVo cartVo) {
        boolean flag = true;
        //查询用户
        UserWithBLOBs u = user1Mapper.selectByPrimaryKey(user.getId());
        String zanStr = u.getZan();
        if (StringUtils.isNotBlank(zanStr)) {
            String[] zanIds = zanStr.split("-");
            for (String string : zanIds) {
                Long zanId = Long.parseLong(string);
                if (zanId.longValue() == cart.getCartId()) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                if (cart.getZan() == cartVo.getZan() - 1) {
                    //赞之前比赞之后要小，添加赞
                    zanStr = zanStr + cart.getCartId() + "-";
                }
            } else {
                //赞之前比赞之后要大：取消赞
                zanStr = null;
                for (String string : zanIds) {
                    Long zanId = Long.parseLong(string);
                    if (zanId.longValue() != cart.getCartId()) {
                        zanStr = zanId + "-";
                    }
                }
            }
            u.setZan(zanStr);
            user1Mapper.updateByPrimaryKeyWithBLOBs(u);
        } else {
            if (flag) {
                zanStr = cart.getCartId() + "-";
                u.setZan(zanStr);
                user1Mapper.updateByPrimaryKeyWithBLOBs(u);
            }

        }


    }

    @Override
    public void addShoucangId(User user, Cart cart, CartVo cartBefore) {
        boolean flag = true;
        //查询用户
        UserWithBLOBs u = user1Mapper.selectByPrimaryKey(user.getId());
        String shoucangStr = u.getShoucang();
        if (StringUtils.isNotBlank(shoucangStr)) {
            String[] shoucangIds = shoucangStr.split("-");
            for (String string : shoucangIds) {
                Long shoucangId = Long.parseLong(string);
                if (shoucangId.longValue() == cart.getCartId()) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                if (cart.getShoucang() == cartBefore.getShoucang() + 1) {
                    //收藏之前比收藏之后要小，添加收藏
                    shoucangStr = shoucangStr + cart.getCartId() + "-";
                } else {
                    //赞之前比赞之后要大：取消赞
                    shoucangStr = null;
                    for (String string : shoucangIds) {
                        Long shoucangId = Long.parseLong(string);
                        if (shoucangId.longValue() != cart.getCartId()) {
                            shoucangStr = shoucangId + "-";
                        }
                    }
                }
            }
            u.setShoucang(shoucangStr);
            user1Mapper.updateByPrimaryKeyWithBLOBs(u);
        } else {
            if (flag) {
                shoucangStr = cart.getCartId() + "-";
                u.setShoucang(shoucangStr);
                user1Mapper.updateByPrimaryKeyWithBLOBs(u);
            }

        }


    }

    @Override
    public UserVo updateBase(UserWithBLOBs user) {
        user1Mapper.updateByPrimaryKeySelective(user);
        return userMapper.selectUserById(user.getId());
    }

    @Override
    public UserVo updateImage(UserWithBLOBs user) {
        user1Mapper.updateByPrimaryKeySelective(user);
        return userMapper.selectUserById(user.getId());
    }

    @Override
    public User getUserByEmail(String email) {
        UserExample example = new UserExample();
        Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(email);
        List<User> list = user1Mapper.selectByExample(example);
        try {
            return list.get(0);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<User> getUserList() {

        UserExample example = new UserExample();
        Criteria criteria = example.createCriteria();
        criteria.andFlagNotEqualTo(3);
        List<User> userList = user1Mapper.selectByExample(example);

        return userList;
    }

    @Override
    public void deleteUser(Long id) {

        UserWithBLOBs user = new UserWithBLOBs();
        user.setId(id);
        UserWithBLOBs u = user1Mapper.selectByPrimaryKey(id);
        user.setFlag(3);
        user1Mapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void vip(Long id) {
        UserWithBLOBs user = new UserWithBLOBs();
        user.setId(id);
        UserWithBLOBs u = user1Mapper.selectByPrimaryKey(id);
        if(u.getFlag() == 1) {
            user.setFlag(2);
        }else if(u.getFlag() == 2) {
            user.setFlag(1);
        }else {
            user.setFlag(3);
        }
        user1Mapper.updateByPrimaryKeySelective(user);
    }


}
