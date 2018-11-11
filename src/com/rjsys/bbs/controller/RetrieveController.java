package com.rjsys.bbs.controller;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rjsys.bbs.pojo.User;
import com.rjsys.bbs.pojo.UserWithBLOBs;
import com.rjsys.bbs.service.UserService;
import com.rjsys.bbs.utils.MailUtils;
import com.rjsys.bbs.vo.UserVo;

@Controller
public class RetrieveController {
	
	@Autowired
	private UserService userService;

	//发送验证码
	@RequestMapping("/getCode.action")
	@ResponseBody
	public Integer retrieve(@RequestBody User user) throws AddressException, MessagingException {
		UserVo vo;
		try {
			vo = userService.getUserByUsernameOrMobile(user);
		} catch (Exception e) {
			//用户名不存在
			return 1;
		}
			try {
				Integer code = (int) (Math.random() * 9000 + 1000);
				String emailMsg = "您正在尝试找回账号为"+vo.getUsername()+"的密码，验证码为"+code+"，如非本人操作，请无视本邮件<br/><b color='red'>井冈山大学软件协会，致力于打造井大最强IT协会</b>";
				MailUtils.sendMail(code, vo.getEmail(), emailMsg);
				return code;
			} catch (Exception e) {
				//邮箱没注册
				return 0;
			}
			
		
	}
	
	@RequestMapping("/zhaohui.html")
	public String zhaohui(UserWithBLOBs user, Model model) throws AddressException, MessagingException {
		
		try {
			UserVo vo = userService.getUserByUsernameOrMobile(user);
			vo.setPassword("123456");
			userService.updateBase(vo);
			
			//修改成功
			model.addAttribute("zhaohui", "找回成功！密码重置为123456，请及时登录修改密码");
			return "login";
		} catch (Exception e) {
			//修改失败
			model.addAttribute("zhaohui", "找回失败！请重新获取验证码，或者联系软协管理人员协助修改密码");
			return "zhaohui";
		}
		
	}
}
