<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style1.css">
<title>注册</title>
</head>
<body class="style-2">
<!-- 	<form action="registercheck.jsp" method="post">  表单以post方式提交到show.jsp -->
<!-- 	用户名：<input type="text" name="uname"/><br> -->
<!-- 	密码：<input type="password" name="upwd"/><br> -->
<!-- 	<input type="submit" value="注册"/> -->
<!-- 	</form> -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-4">
			
				<!-- Start Sign In Form -->
				<form action="registercheck.jsp" class="fh5co-form animate-box"
					data-animate-effect="fadeInLeft" method="post">	
					<h2>注册</h2>
					
					<div class="form-group">						
						<label for="username" class="sr-only">Username</label> 
						<input
							type="text" class="form-control" id="username" name="uname"
							placeholder="Username" autocomplete="off"/>
					</div>
					
					<div class="form-group">
						<label for="username" class="sr-only">Email</label> 
						<input
							type="text" class="form-control" id="uemail" name="uemail"
							placeholder="Email" autocomplete="off"
							/>
					</div>
					
					<div class="form-group">
						<label for="password" class="sr-only">Password</label> 
						<input
							type="password" class="form-control" id="password" name="upwd"
							placeholder="Password" autocomplete="off"
							/>
					</div>
					
					<div class="form-group">
						<label for="password" class="sr-only">再次确认密码</label> 
						<input
							type="password" class="form-control" id="password" name="upwd2"
							placeholder="再次确认密码" autocomplete="off"
							/>
					</div>
						
					<div class="form-group">
						<input type="submit" value="注册" class="btn_login">
					</div>
				</form>
				<!-- END Sign In Form -->

			</div>
		</div>
	</div>
	
</body>
</html>