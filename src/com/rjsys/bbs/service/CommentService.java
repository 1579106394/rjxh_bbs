package com.rjsys.bbs.service;

import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.Comment;
import com.rjsys.bbs.vo.CommentVo;

import java.util.List;

public interface CommentService {

	//评论功能
	public Comment comment(Comment comment);

	//加载这个帖子的所有评论
	public List<CommentVo> getCartCommentList(Cart cart);

	//加载这个评论是评论谁的
	public CommentVo getCommentComment(Comment comment);

	//点赞评论
	public Integer zanCommentById(Comment comment);

	//加载评论我的
	public List<Comment> getMyCommentById(Long id);

}
