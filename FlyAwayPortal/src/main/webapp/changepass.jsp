<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
 <%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
</head>
<body>
<form action="" method=post>
Enter new Password: <input type="password" name="NewPassword"/> <br/>
<input type="submit" name="submit" value="submit"/>
<%
if(request.getParameter("submit")!=null)
{
	String uname=(String)session.getAttribute("uname");
	String pass=(String)session.getAttribute("pass");
	String newPass=(String)request.getParameter("NewPassword");
	try{
	if(!(pass.equals(newPass)))
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","Patel@1985");
		
		Statement stmt=conn.createStatement();
		stmt.execute("UPDATE login SET password='"+newPass+"' WHERE id='"+uname+"'");
	
		session.setAttribute("pass", newPass);
		//session.setAttribute("state","1");
	}
	
	response.sendRedirect("adminhome.jsp?state=1");
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