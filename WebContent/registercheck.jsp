<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//设置编码
		request.setCharacterEncoding("UTF-8");
	    //根据name属性值获取value属性值
		String name=request.getParameter("uname");
		String email=request.getParameter("uemail");
		String pwd=request.getParameter("upwd");
		String pwd2=request.getParameter("upwd2");
		if(pwd.equals(pwd2)==true){
		
		//加入到数据库
		String url="jdbc:mysql://localhost:3306/webdb?serverTimezone=UTC";
		String user="root";
		String dbpwd="L0S4Q701047root";
			
		Connection connection=null;
		PreparedStatement prepareStatement=null;
		PreparedStatement prepareStatement2=null;
		PreparedStatement prepareStatement3=null;
		ResultSet results=null;
		
		//1、导入驱动,加载具体的驱动类 
		Class.forName("com.mysql.cj.jdbc.Driver");
		//2、与数据库建立连接
		connection = DriverManager.getConnection(url, user, dbpwd);
		//3、发送SQL命令并执行
		//PreparedStatement形式
		String sql="select * from customer where uname=?";
		//预编译
		prepareStatement = connection.prepareStatement(sql);
		//赋值
		prepareStatement.setString(1, name);
		//执行
		results=prepareStatement.executeQuery();

		int count=0;
		//如果找到了,用户名重复，不允许
		if(results.next()) {
			count=1;
		}
		
		if(count==1) {
			response.getWriter().write("<script > alert(\"用户名已存在！请重新输入\");location='register.jsp';</script>");
		
		}else {
			String sql2="insert into customer values (?,?,?)";
			//预编译
			prepareStatement2 = connection.prepareStatement(sql2);
			//赋值
			prepareStatement2.setString(1, name);
			prepareStatement2.setString(2, pwd);
			prepareStatement2.setString(3, email);
			//执行
			int count2=prepareStatement2.executeUpdate();
			
			
			if(count2>0) {
				response.getWriter().write("<script > alert(\"注册成功！\");location='index.jsp';</script>");
			}
			
		}
			
		if(results!=null)
			results.close();
		if(prepareStatement!=null)
			prepareStatement.close();
		if(prepareStatement2!=null)
			prepareStatement.close();
		if(connection!=null)
			connection.close();
		}
		
		else{
			response.getWriter().write("<script > alert(\"两次密码不一致！请重新输入\");location='register.jsp';</script>");
		}
		
	%>
	
</body>
</html>