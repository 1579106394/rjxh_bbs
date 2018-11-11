package com.rjsys.bbs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rjsys.bbs.pojo.User;
import com.rjsys.bbs.service.UserService;
import com.rjsys.bbs.vo.UserVo;

//登录功能
@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/login.html")
	public String login(User user, Model model, HttpSession session) {
		//根据账号查询用户
		UserVo u = userService.getUserByUsernameOrMobile(user);
		if(u != null && user.getPassword().equals(u.getPassword())) {
			session.setAttribute("user", u);
			return "redirect:/cart/cartList.html";
		}else {
			model.addAttribute("error", "用户名或密码错误！");
			return "login";
		}
	}
	
	@RequestMapping("/logout.html")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		
		return "redirect:/cart/cartList.html";
	}
	
}
