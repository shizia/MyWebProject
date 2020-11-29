<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style1.css">
<title>登录</title>
</head>
<body class="style-2">
	<%
	String nowname=(String)session.getAttribute("uname");
	//一定时间内未登陆过
	if(nowname==null){ 
		
	%>

		<div class="container">
		<div class="row">
			<div class="col-md-4">
			
				<!-- Start Sign In Form -->
				<form action="logincheck.jsp"  class="fh5co-form animate-box"
					data-animate-effect="fadeInLeft" method="post">	
					<h2>登录</h2>
					
					<div class="form-group">						
						<label for="username" class="sr-only">Username</label> 
						<input
							type="text" id="username" name="uname" class="form-control"
							placeholder="Username" autocomplete="off"/>
					</div>
					
					<div class="form-group">
						<label for="password" class="sr-only">Password</label> 
						<input
							type="password" id="password" name="upwd" class="form-control"
							placeholder="Password" autocomplete="off"
							/>
					</div>
					
					<div class="form-group">
						<p>
							没有注册? <a href="register.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="login_admin.jsp">管理员登陆</a>
						</p>
					</div>
						
					<div class="form-group">
						<input type="submit" value="登录" class="btn_login">
					</div>
				</form>
				<!-- END Sign In Form -->

			</div>
		</div>
	</div>
		
	<%}
 	else{
 		response.getWriter().write("<script > alert(\"欢迎回来！\");location='index.jsp';</script>");		
}%>
	
	
	
	
</body>
</html>