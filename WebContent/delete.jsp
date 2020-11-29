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
	
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	if(action != null ) {
		
		if(action.trim().equals("bookdelete")){
		
		//3、发送SQL命令并执行
		//PreparedStatement形式
		String sql="delete from book where bookid=?";
		//预编译
		prepareStatement = connection.prepareStatement(sql);
		}
		
		else if(action.trim().equals("fooddelete")){
			
			//3、发送SQL命令并执行
			//PreparedStatement形式
			String sql="delete from food where foodid=?";
			//预编译
			prepareStatement = connection.prepareStatement(sql);
			}
		
		else if(action.trim().equals("digitaldelete")){
				
			//3、发送SQL命令并执行
			//PreparedStatement形式
			String sql="delete from digital where digitalid=?";
			//预编译
			prepareStatement = connection.prepareStatement(sql);
			}
		
		else if(action.trim().equals("clothesdelete")){
			
			//3、发送SQL命令并执行
			//PreparedStatement形式
			String sql="delete from clothes where clothesid=?";
			//预编译
			prepareStatement = connection.prepareStatement(sql);
			}
		
		
		//赋值,从网页中获得	
		String id = request.getParameter("id");
		prepareStatement.setString(1,id);
		//执行
		int results=0;
		results=prepareStatement.executeUpdate();
		//如果找到了
		if(results==1) {
			if(id.substring(0, 4).equals("book"))
			{
			response.getWriter().write("<script > alert(\"删除成功！\");location='book_admin.jsp';</script>");
			}
			if(id.substring(0, 4).equals("food"))
			{
			response.getWriter().write("<script > alert(\"删除成功！\");location='food_admin.jsp';</script>");
			}
			if(id.substring(0, 4).equals("digi"))
			{
			response.getWriter().write("<script > alert(\"删除成功！\");location='digital_admin.jsp';</script>");
			}
			if(id.substring(0, 4).equals("clot"))
			{
			response.getWriter().write("<script > alert(\"删除成功！\");location='clothes_admin.jsp';</script>");
			}
		}

		if(prepareStatement!=null)
			prepareStatement.close();
		if(connection!=null)
			connection.close();
		
	}	
}
 %> 
 