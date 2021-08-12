<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login Page</title>
</head>
<body>
<form action="" method=post>
User Name: <input type="text" name="UserName"/> <br/>
Password: <input type="password" name="UserPassword"/> <br/>
<input type="submit" name="submit" value="submit"/>
<% if(request.getParameter("submit")!=null)
{
	String uname=(String)request.getParameter("UserName");
	String pass=(String)request.getParameter("UserPassword");
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","Patel@1985");
    Statement stmt = conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from login");
    boolean sucess=false;
	while(rs.next())
	{
		if(rs.getString(1).equals(uname) && rs.getString(2).equals(pass))
		{
			sucess=true;
			break;
		}
	}
	if(sucess)
	{
		session.setAttribute("uname", uname);
		session.setAttribute("pass", pass);
		//session.setAttribute("state","0");
		response.sendRedirect("adminhome.jsp?state=0");
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
	conn.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
%>
</form>
</body>
</html>