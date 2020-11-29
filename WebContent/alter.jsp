<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopping.cart.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%

String nowname=(String)session.getAttribute("uname");
if(nowname==null){
	response.getWriter().write("<script > alert(\"请重新登陆！\");location='index_admin.jsp';</script>");
}
else{
	
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	if(name.length()==0){
		name=request.getParameter("oldname");
	}
	String describe=request.getParameter("describe");
	if(describe.length()==0){
		describe=request.getParameter("olddescribe");
	}
	String sprice=request.getParameter("price"); 
	Double price;
	if(sprice.length()==0){
		sprice=request.getParameter("oldprice");
		price = Double.parseDouble(sprice);
	}
	else{
		price = Double.parseDouble(sprice);
	}
	
	

	//连上数据库
    String url="jdbc:mysql://localhost:3306/webdb?serverTimezone=UTC";
   	String dbuser="root";
   	String dbpwd="L0S4Q701047root";
   	
   	Connection connection=null;
   	PreparedStatement prepareStatement=null;
   	
   	//1、导入驱动,加载具体的驱动类 
   	Class.forName("com.mysql.cj.jdbc.Driver");
   	//2、与数据库建立连接
   	connection = DriverManager.getConnection(url, dbuser, dbpwd);
	String sql;
   	if(id.substring(0, 4).equals("book")&&id.length()==10){
		//3、发送SQL命令并执行
		//PreparedStatement形式
		sql="update book set bookname=?,bookdescribe=?,bookprice=? where bookid=?";
		//预编译
		prepareStatement = connection.prepareStatement(sql);
   	}
   	else if(id.substring(0, 4).equals("food")&&id.length()==10){
		//3、发送SQL命令并执行
		//PreparedStatement形式
		sql="update food set foodname=?,fooddescribe=?,foodprice=? where foodid=?";
		//预编译
		prepareStatement = connection.prepareStatement(sql);
   	}
   	else if(id.substring(0, 4).equals("digi")&&id.length()==12){
		//3、发送SQL命令并执行
		//PreparedStatement形式
		sql="update digital set digitalname=?,digitaldescribe=?,digitalprice=? where digitalid=?";
		//预编译
		prepareStatement = connection.prepareStatement(sql);
   	}
   	else if(id.substring(0, 4).equals("clot")&&id.length()==12){
		//3、发送SQL命令并执行
		//PreparedStatement形式
		sql="update clothes set clothesname=?,clothesdescribe=?,clothesprice=? where clothesid=?";
		//预编译
		prepareStatement = connection.prepareStatement(sql);
   	}
   	else{
   		response.getWriter().write("<script > alert(\"错误\");location='index_admin.jsp';</script>");
   	}
		
		//赋值	
		prepareStatement.setString(1,name);
		prepareStatement.setString(2,describe);
		prepareStatement.setDouble(3,price);
		prepareStatement.setString(4,id);
		//执行
		int results=0;
		results=prepareStatement.executeUpdate();
		//如果找到了
		if(results==1) {
			if(id.substring(0, 4).equals("book"))
			{
			response.getWriter().write("<script > alert(\"修改成功！\");location='book_admin.jsp';</script>");
			}
			if(id.substring(0, 4).equals("food"))
			{
			response.getWriter().write("<script > alert(\"修改成功！\");location='food_admin.jsp';</script>");
			}
			if(id.substring(0, 4).equals("digi"))
			{
			response.getWriter().write("<script > alert(\"修改成功！\");location='digital_admin.jsp';</script>");
			}
			if(id.substring(0, 4).equals("clot"))
			{
			response.getWriter().write("<script > alert(\"修改成功！\");location='clothes_admin.jsp';</script>");
			}
		}

		if(prepareStatement!=null)
			prepareStatement.close();
		if(connection!=null)
			connection.close();
   	
   	
   	
}
 %> 
 