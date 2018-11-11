package com.rjsys.bbs.utils;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import java.util.Properties;

public class MailUtils {
    //email：邮件发给谁
    //emailMSG：邮件内容
    public static void sendMail(Integer yanzhengma, String email, String emailMsg)
            throws AddressException, MessagingException {
        // 1.创建一个程序与邮件服务器会话对象 Session

        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "SMTP");	//发邮件的协议
        props.setProperty("mail.host", "smtp.126.com");		//发送邮件的服务器地址
        props.setProperty("mail.smtp.auth", "true");// 指定验证为true

        // 创建验证器
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("rjsys1579106394", "yangdeshi1234");	//发邮件的账号的验证：账号密码
            }
        };

        Session session = Session.getInstance(props, auth);

        // 2.创建一个Message，它相当于是邮件内容
        Message message = new MimeMessage(session);

        message.setFrom(new InternetAddress("rjsys1579106394@126.com")); // 设置发送者

        message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者

        message.setSubject("找回密码");	//主题
        message.setText("您正在尝试找回密码，验证码为"+yanzhengma+"，如非本人操作，请无视本邮件<br/>");
        message.setText("<b color='red'>井冈山大学软件协会，致力于打造井大最强IT协会</b>");

        message.setContent(emailMsg, "text/html;charset=utf-8");

        // 3.创建 Transport用于将邮件发送

        Transport.send(message);
    }
}
