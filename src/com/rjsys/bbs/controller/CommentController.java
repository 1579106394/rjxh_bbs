package com.rjsys.bbs.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.Comment;
import com.rjsys.bbs.service.CartService;
import com.rjsys.bbs.service.CommentService;
import com.rjsys.bbs.service.TypeService;
import com.rjsys.bbs.service.UserService;
import com.rjsys.bbs.utils.JsonUtils;
import com.rjsys.bbs.vo.CommentVo;

@Controller
public class CommentController {

	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private CommentService commentService;

	//帖子评论功能
	@RequestMapping("/comment/comment.html")
	public String commentCart(Comment comment) {
		
		commentService.comment(comment);
		
		return "redirect:/cart/"+comment.getCartId()+".html";
		
	}
	
	//AJAX加载评论
	@RequestMapping("/comment/ajaxLoadComment.action")
	@ResponseBody
	public Map<String, CommentVo> loadComment(@RequestBody Cart cart) {
		//获取到所有该帖子的评论
		List<CommentVo> list1 = commentService.getCartCommentList(cart);
		Map<String, CommentVo> commentMap = new LinkedHashMap<>();
		for (CommentVo comment : list1) {
			//遍历，查找这个评论下是否有其他评论
		CommentVo commentcomment = commentService.getCommentComment(comment.getComment());
		commentMap.put(JsonUtils.objectToJson(comment), commentcomment);
		}
		
		return commentMap;
	}
	
	//AJAX给评论点赞
	@RequestMapping("/comment/ajaxZanHuiFu.action")
	@ResponseBody
	public Integer zanHuiFu(@RequestBody Comment comment, HttpSession session) {
	
		Integer ok = commentService.zanCommentById(comment);
	
		
		return ok;
	}
	
	
}
