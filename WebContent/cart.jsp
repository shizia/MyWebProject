<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping.cart.*" %>
<%@ page import="java.util.*"%>

<%

String nowname=(String)session.getAttribute("uname");
if(nowname==null){
	response.getWriter().write("<script > alert(\"尚未登录！登陆后方可查看购物车\");location='index.jsp';</script>");
}
else{

Cart c = (Cart)session.getAttribute("cart");
if(c == null) {
	c = new Cart();
	session.setAttribute("cart", c);
}
double totalPrice = c.getTotalPrice();

request.setCharacterEncoding("UTF-8");
String action = request.getParameter("action");
Map products = (HashMap)session.getAttribute("products");
if(action != null && action.trim().equals("add")) {
	String id = request.getParameter("id");
	Product p = (Product)products.get(id);
	CartItem ci = new CartItem();
	ci.setProduct(p);
	ci.setCount(1);
	c.add(ci);
}
if(action != null && action.trim().equals("delete")) {
	String id = request.getParameter("id");
	c.deleteItemById(id);
}
if(action != null && action.trim().equals("update")) {
	for(int i=0; i<c.getItems().size(); i++) {
		CartItem ci = c.getItems().get(i);
		int count = Integer.parseInt(request.getParameter("p" + ci.getProduct().getId()));
		ci.setCount(count);
	}
}
 %> 
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<%
List<CartItem> items = c.getItems();
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>购物车</title>
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
<body>

<div class="head">
		<div class="menu">
			<ul>
				<li>
					<div class="div3">
						<img src="img/head.png" style="height: 20px; width: 20px; ">
					</div>
					<div class="div2">
						欢迎回来，<span><%=nowname%></span>&nbsp;&nbsp;
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
	
	

<h2 style="margin-left: 10%;"><%=nowname %>的购物车</h2>
<!-- c的值是：<%=(c == null) %> items的值是：<%=(items == null) %> -->
 <form action="sendmail.jsp" method="post"> 
<!-- <input type="hidden" name="action" value="update"/> -->
<table align="center" border="1" style="width: 70%;">
	<tr bgcolor="#CCCCCC">
		<td>商品ID</td>
		<td>商品名称</td>
		<td>购买数量</td>
		<td>单价</td>
		<td>总价</td>
		<td>处理</td>
	</tr>
	<%
	
	for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {
		CartItem item = it.next();
		%>
		<tr>
			<td><%=item.getProduct().getId() %></td>
			<td><%=item.getProduct().getName() %></td>
			<td>
				<input type="text" size=3 name="<%="p" + item.getProduct().getId() %>" value="<%=item.getCount() %>" >			
			</td>
			<td><%=item.getProduct().getPrice() %></td>
			<td><%=item.getProduct().getPrice()*item.getCount() %></td>
			<td>
				
				<a style="color:rgba(92, 86, 86, 0.9)" href="cart.jsp?action=delete&id=<%=item.getProduct().getId() %>">删除</a>
				
			</td>
		</tr>
		<%
	}
	%>	
	
	<tr>
		<td colspan=3 align="left">
			所有商品总价格为：
		</td>
		<td colspan=3><%=c.getTotalPrice() %>
<%-- 		<input type="hidden" name="totalprice" value="<%=c.getTotalPrice()%>"/> --%>
<!-- 		<input type="submit" value="确认"> -->
		</td>
		
	</tr>
	
	<tr>
	<!--	<td colspan=3>
			 <a href="javascript:document.forms[0].submit()">修改</a> 
		</td>  -->
		<td colspan=6 align="right">
			<a style="color:rgba(92, 86, 86, 0.9)" href="sendmail.jsp">下单</a>		
		</td>
	</tr>
</table>
</form><%} %>
</body>
</html>