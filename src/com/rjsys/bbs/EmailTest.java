package com.rjsys.bbs;

import static org.junit.Assert.*;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.junit.Test;
import org.springframework.web.bind.annotation.RequestBody;

import com.rjsys.bbs.utils.MailUtils;

public class EmailTest {
	
	@Test
	public void testName() throws Exception {
		String email = "1579106394@qq.com";
		Integer code = (int) (Math.random() * 9000 + 1000);
		String emailMsg = "您正在尝试找回密码，验证码为"+code+"，如非本人操作，请无视本邮件<br/><b color='red'>井冈山大学软件协会，致力于打造井大最强IT协会</b>";
		MailUtils.sendMail(code, email, emailMsg);
	}

}
