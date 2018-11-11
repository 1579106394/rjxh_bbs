package com.rjsys.bbs.vo;

import com.rjsys.bbs.pojo.Cart;
import com.rjsys.bbs.pojo.Type;
import com.rjsys.bbs.pojo.User;

import java.io.Serializable;

//Cart的包装类
public class CartVo extends Cart implements Serializable {

	private Type type;
	
	private User user;

	private Integer jubao;

	public Integer getJubao() {
		return jubao;
	}

	public void setJubao(Integer jubao) {
		this.jubao = jubao;
	}

	/**
	 * @return the type
	 */
	public Type getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(Type type) {
		this.type = type;
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
	
	
	
}
