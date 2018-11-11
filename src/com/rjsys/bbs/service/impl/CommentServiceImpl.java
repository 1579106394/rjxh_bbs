package com.rjsys.bbs.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjsys.bbs.mapper.CartMapper;
import com.rjsys.bbs.mapper.CommentMapper;
import com.rjsys.bbs.mapper.UserMapper;
import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.Comment;
import com.rjsys.bbs.pojo.CommentExample;
import com.rjsys.bbs.pojo.CommentExample.Criteria;
import com.rjsys.bbs.pojo.UserWithBLOBs;
import com.rjsys.bbs.service.CommentService;
import com.rjsys.bbs.vo.CommentVo;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper comment1Mapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CartMapper cartMapper;

	@Override
	public Comment comment(Comment comment) {
		//补全属性
		//评论时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		comment.setArtTime(date);
		//评论的另一个id
		//前台传入
		
		//将评论存入
		comment1Mapper.insertSelective(comment);
		//将帖子的回复数+1
		Cart cart = cartMapper.selectByPrimaryKey(comment.getCartId());
		cart.setHuifunum(cart.getHuifunum()+1);
		cartMapper.updateByPrimaryKeySelective(cart);
		
		//将comment返回
		return comment;
	}

	@Override
	public List<CommentVo> getCartCommentList(Cart cart) {
		List<CommentVo> list = new ArrayList<>();
		CommentExample example = new CommentExample();
		Criteria criteria = example.createCriteria();
		criteria.andCartIdEqualTo(cart.getCartId());
		//查找帖子下所有的评论
		List<Comment> commentList = comment1Mapper.selectByExampleWithBLOBs(example);
		//遍历评论，查找每个评论的用户
		for (Comment comment : commentList) {
			UserWithBLOBs user = userMapper.selectByPrimaryKey(comment.getUserId1());
			CommentVo vo = new CommentVo(comment, user);
			list.add(vo);
		}
		return list;
	}

	@Override
	public CommentVo getCommentComment(Comment comment) {
		//查找评论下的评论
		Comment comment2 = comment1Mapper.selectByPrimaryKey(comment.getCommentId());
		//查找这条评论的用户
		UserWithBLOBs user = userMapper.selectByPrimaryKey(comment.getUserId1());
		
		return new CommentVo(comment2, user);
	}

	@Override
	public Integer zanCommentById(Comment comment) {
		//修改这个帖子的点赞数为之前的数量+1
		int i = comment1Mapper.updateByPrimaryKeySelective(comment);
		
		return i;
	}

	@Override
	public List<Comment> getMyCommentById(Long id) {
		CommentExample example = new CommentExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserId2EqualTo(id);
		List<Comment> list = comment1Mapper.selectByExampleWithBLOBs(example);
		return list;
	}
	
}
