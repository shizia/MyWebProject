<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping.cart.*" %>
<%@ page import="java.util.*"%>
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
<title>图书区</title>
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/head.css">
<style type="text/css">
.menu ul{
	margin-top: 0px;
	margin-bottom: 0px;
}
.menu ul li{
	margin-top: 5px;
}
</style>

</head>
<body >
		<%
		Map<String,Product> products = new HashMap<String,Product>();
		
		//连上数据库
	    String url="jdbc:mysql://localhost:3306/webdb?serverTimezone=UTC";
	   	String dbuser="root";
	   	String dbpwd="L0S4Q701047root";
	   	
	   	Connection connection=null;
	   	PreparedStatement prepareStatement=null;
	   	ResultSet results=null;
	   	
	   	//1、导入驱动,加载具体的驱动类 
	   	Class.forName("com.mysql.cj.jdbc.Driver");
	   	//2、与数据库建立连接
	   	connection = DriverManager.getConnection(url, dbuser, dbpwd);
	    //3、发送SQL命令并执行
		//PreparedStatement形式
		String sql="select * from book";
		//预编译
		prepareStatement = connection.prepareStatement(sql);
		//执行
		results=prepareStatement.executeQuery();
		
		while(results.next()){
			
			products.put(results.getString("bookid"), new Product(results.getString("bookid"), results.getString("bookname"),results.getString("bookdescribe"),results.getDouble("bookprice")));
	
			}
			
			session.setAttribute("products", products);
		%>
		
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
<!-- 			<div id="marker"></div> -->
		</ul>
		</nav>
		</div>



<h2 style="margin-left: 10%;">图书区</h2>

		<form name="productForm"
			action="cart.jsp"
			method="POST">
			<input type="hidden" name="action" value="purchase">
			<table style="width: 80%;margin-left: 10%;" border="1" >
				<tr bgcolor="#CCCCCC">
					<tr bgcolor="#CCCCCC">
						<td>
							编号
						</td>
						<td>
							名称
						</td>
						<td>
							详情
						</td>
						<td>
							价格（￥）
						</td>
			
                        <td>
							加入到购物车
						</td>
					</tr>
					<%
						Set productIdSet = products.keySet();
						Iterator it = productIdSet.iterator();
						int number = 1;

						while (it.hasNext()) {
							String id = (String) it.next();
							Product product = (Product) products.get(id);
					%><tr>
						<td>
							<%=product.getId()%>
						</td>
						<td>
							<%=product.getName()%>
						</td>
						<td><%=product.getDescription()%>
						</td>
						<td>
							<%=product.getPrice()%></td>
						<td>
							<a style="color:rgba(92, 86, 86, 0.9)" href="cart.jsp?id=<%=product.getId()%>&action=add" target="cart">我要购买</a>
						</td>
					</tr>
					<%
						}
					%>
				
			</table>
			
		</form>
		<%if(results!=null)
			results.close();
		if(prepareStatement!=null)
			prepareStatement.close();
		if(connection!=null)
			connection.close(); %>
	</body>
</html>