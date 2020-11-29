<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String nowname=(String)session.getAttribute("uname");
		//一定时间内未登陆过
		if(nowname==null){
		String url="jdbc:mysql://localhost:3306/webdb?serverTimezone=UTC";
		String user="root";
		String dbpwd="L0S4Q701047root";
		
		Connection connection=null;
		PreparedStatement prepareStatement=null;
		ResultSet results=null;
		
		//1、导入驱动,加载具体的驱动类 
		Class.forName("com.mysql.cj.jdbc.Driver");
		//2、与数据库建立连接
		connection = DriverManager.getConnection(url, user, dbpwd);
		//3、发送SQL命令并执行
		//PreparedStatement形式
		String sql="select * from customer where uname=? and upwd=?";
		//预编译
		prepareStatement = connection.prepareStatement(sql);
		//赋值,从登陆网页中获得
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("uname");
		String pwd=request.getParameter("upwd");		
		
		prepareStatement.setString(1, name);
		prepareStatement.setString(2, pwd);
		//执行
		results=prepareStatement.executeQuery();

		String email=null;
		//如果找到了
		if(results.next()) {
			email=results.getString("uemail");
			response.getWriter().write("<script > alert(\"登陆成功！\");location='index.jsp';</script>");
			//session中获得uname/upwd
			session.setAttribute("uname", name);
			session.setAttribute("upwd", pwd);
			session.setAttribute("uemail", email);
			//30分钟没有操作则需要重新登陆
			session.setMaxInactiveInterval(30*60);
			
		}
		else {
			response.getWriter().write("<script > alert(\"用户名或密码错误！\");location='login.jsp';</script>");
		}
			
		if(results!=null)
			results.close();
		if(prepareStatement!=null)
			prepareStatement.close();
		if(connection!=null)
			connection.close();
		}
		else{
			out.println("欢迎回来，"+nowname);
		}
	%>
</body>
</html>