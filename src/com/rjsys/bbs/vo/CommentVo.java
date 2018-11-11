package com.rjsys.bbs.vo;
//Comment的包装类，包装Comment和User的信息

import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.Comment;
import com.rjsys.bbs.pojo.User;

import java.io.Serializable;

public class CommentVo implements Serializable {

	private Comment comment;
	private User user;
	private Cart cart;
	public CommentVo(Comment comment) {
		super();
		this.comment = comment;
	}
	public CommentVo(Comment comment, User user) {
		super();
		this.comment = comment;
		this.user = user;
	}
	/**
	 * @return the comment
	 */
	public Comment getComment() {
		return comment;
	}
	/**
	 * @param comment the comment to set
	 */
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
}
