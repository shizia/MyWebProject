<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String nowname=(String)session.getAttribute("uname");
   String toemail=(String)session.getAttribute("uemail");
   //String content=request.getParameter("totalprice");

	// 以下变量为用户根据自己的情况设置
	String smtphost = "smtp.163.com"; // 发送邮件服务器
	String user = "shiziaemail@163.com"; // 邮件服务器登录用户名
	String password = "HDPLOKWBQMVTVISG"; // 邮件服务器登录密码
	String from = "shiziaemail@163.com"; // 发送人邮件地址
	String to = toemail; // 接受人邮件地址
	String subject = "订单确认"; // 邮件标题
	String body = "您已成功下单！047的杂货店感谢您的惠顾！"; // 邮件内容
	
	
	// 以下为发送程序，无需改动
	try {
	//初始化Properties类对象
	Properties props = new Properties();
	
	//阿里云禁用了25端口
	props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	props.setProperty("mail.smtp.socketFactory.port", "465");
	props.setProperty("mail.smtp.port", "465");
	
	//设置mail.smtp.host属性
	props.put("mail.smtp.host", smtphost);
	//设置使用验证
	props.put("mail.smtp.auth","true");
	// 获取非共享的session对象
	Session ssn= Session.getInstance(props,null);
	//创建一个默认的MimeMessage对象。
	MimeMessage message = new MimeMessage(ssn);
	//创建InternetAddress对象
	InternetAddress fromAddress = new InternetAddress(from);
	//设置From: 头部的header字段
	message.setFrom(fromAddress);
	//创建InternetAddress对象
	InternetAddress toAddress = new InternetAddress(to);
	//设置 To: 头部的header字段
	message.addRecipient(Message.RecipientType.TO, toAddress);
	//设置 Subject: header字段
	message.setSubject(subject);
	// 现在设置的实际消息
	message.setText(body);
	//定义发送协议
	Transport transport = ssn.getTransport("smtp");
	//建立与服务器的链接
	transport.connect(smtphost, user, password);
	//发送邮件
	transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
	//transport.send(message);
	//关闭邮件传输
	transport.close();
	session.setAttribute("cart",null);
	response.getWriter().write("<script > alert(\"订单确认邮件已发送到您的邮箱,请注意查收！\");location='cart.jsp';</script>");
	
// 	<p>订单确认邮件已发送到您的邮箱！</p>
	
	} catch(Exception m) //捕获异常
	{
	out.println(m.toString());
	m.printStackTrace();
	}
	%>
	
</body>
</html>