<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/head.css">
<link rel="stylesheet" type="text/css" href="css/indexpic.css">
<script src="js/indexpic.js"></script>

<style type="text/css">
.container {
	/* max-width: 1024px; */
	width: 100%;
	margin: 0 auto;
	padding: 0px;
	font-size: 14px;
}

.preview {
	text-align: center;
	padding: 5px;
}

.preview a {
	display: inline-block;
	margin: 5px;
}

.preview img {
	display: block;
	width: 100%;
	height: auto;
}

.active {
	outline: 3px solid #196cd2;
	box-shadow: 2px 2px 20px 4px rgba(0, 0, 0, .5);
}
.menu ul{
	margin-top: 0px;
	margin-bottom: 0px;
}
.menu ul li{
	margin-top: 5px;
}
</style>

</head>
<body>

<%String user=(String)session.getAttribute("uname"); %>


<%
        if(user==null){
    %>
<div class="head">
		<div class="menu">
			<ul>
				<li>
					<div class="div3">
						<img src="img/head.png" style="height: 20px; width: 20px; ">
					</div>
					<div class="div2">
						<a href="register.jsp"><span>注册</span></a>
						<a href="login.jsp"><span>登录</span></a>
					</div>
				</li>
				<li>
					<div class="div3">
						<img src="img/11.png" style="height: 20px; width: 20px; ">
					</div>
					<div class="div2">
						<a href="cart.jsp"><span>我的购物车</span></a>
					</div>
				</li>
				
			</ul>
		</div>
		<div class="head2" style="border:0px;">
			<div class="div4">
				<img src="img/timg.png" style="height: 94px; width: 538px; ">
			</div>
			<div class="div5">
			
			</div>
		</div>
	</div>
	    <%
         }
         else{
    %>

<div class="head">
		<div class="menu">
			<ul>
				<li>
					<div class="div3">
						<img src="img/head.png" style="height: 20px; width: 20px; ">
					</div>
					<div class="div2">
						欢迎回来，<span><%=user%></span>&nbsp;&nbsp;
					</div>
				</li>
				
				<li>
					<div class="div3">
						<img src="img/11.png" style="height: 20px; width: 20px; ">
					</div>
					<div class="div2">
						<a href="cart.jsp"><span>我的购物车</span></a>
					</div>
				</li>
				
				<li>
					<div class="div3">
						<img src="img/head.png" style="height: 20px; width: 20px; ">
					</div>
					<div class="div2">
						<a href="leave.jsp"><span>退出登录</span></a>
					</div>
				</li>
				
			</ul>
		</div>
		

		<div class="head2" style="border:0px;">
			<div class="div4">
<!-- 			<h2>047的小店</h2> -->
				<img src="img/timg.png" style="height: 94px; width: 538px; "> 
			</div>
			<div class="div5">
			
			</div>
		</div>
	</div>

    <%
        }
    %>


       
    <!-- 分类信息 -->
	<div class="htmleaf-container">
		<nav>
		<ul id="main" style=" width: 1200px;">
			<li><a class="a1" href="index.jsp">网站主页</a></li>
			<li><a class="a1" href="book.jsp">图书区</a></li>
			<li><a class="a1" href="food.jsp">食品区</a></li>
			<li><a class="a1" href="digital.jsp">数码区</a></li>
			<li><a class="a1" href="clothes.jsp">服饰区</a></li>
						
		  
           <!-- 选中条 -->
			<div id="marker"></div>
		</ul>
		</nav>
		</div>
    
	
    <div class="show_pic">
        <img id="pic_change" src="img/pic5.png">
    </div>
    
    <div >
    <p class="my"> 18级网络工程 林诗琪<br>网络应用开发实验<br>2020-11
    </div>
	
    
	
	
	<%! //定义方法、全局变量 %>
	<%! 
	//public String bookname;
	//public void init(){
		//Date date=new Date();
		//bookname="haha"+date;
	//}
	%>
	
	<%//定义变量，运行函数 
	  // String name="lsq";
	   //out.print("<font color='red'>"+name+"</font>");
	   //init();
	   //out.print("<br/>"+bookname);
	%>
	
</body>
</html>