package com.rjsys.bbs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.rjsys.bbs.pojo.UserWithBLOBs;
import com.rjsys.bbs.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;

//只用于页面跳转的Controller，不涉及功能
@Controller
public class DirectController {
	
	@Autowired
	private UserService userService;

	//跳转到发帖
	@RequestMapping("/fatie.html")
	public String fatie() {
		return "fatie";
	}
	
	//跳转到基本设置
	@RequestMapping("/base.html")
	public String base() {
		return "base";
	}
	
	//跳转到我的帖子
	@RequestMapping("/mycart.html")
	public String myCart() {
		return "mycart";
	}
	
	//跳转到我的回复
	@RequestMapping("/myhuifu.html")
	public String myHuifu() {
		return "myhuifu";
	}

	//跳转到模块管理
	@RequestMapping("/mokuai.html")
	public String mokuai() {
		return "mokuai";
	}

	//跳转到帖子管理
	@RequestMapping("/cart.html")
	public String cart() {
		return "cart";
	}

	//跳转到用户管理
	@RequestMapping("/user.html")
	public String user() {
		return "user";
	}

	//跳转到个人主页
	@RequestMapping("/homepage{id}.html")
	public String homePage(@PathVariable Long id, Model model) {
		UserWithBLOBs user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "homepage";
	}

	
}
