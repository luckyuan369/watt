package com.watt.framework.common.util;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class SimpleMailDemo {

	public static void main(String[] args) {
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
        // 设定 Mail Server
        senderImpl.setHost("smtp.qq.com");
        
        //SMTP验证时，需要用户名和密码
        senderImpl.setUsername("249213271");
        senderImpl.setPassword("yuanyi369");
        
        // 建立邮件讯息
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        
        // 设定收件人、寄件人、主题与内文
        mailMessage.setTo("249213271@qq.com");
        mailMessage.setFrom("249213271@qq.com");
        mailMessage.setSubject("Test");
        mailMessage.setText("This is a test!!!");
        
        // 传送邮件
        senderImpl.send(mailMessage);
        
        System.out.println("邮件传送OK..");
	}

}
