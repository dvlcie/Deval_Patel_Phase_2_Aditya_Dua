<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home Page</title>
</head>
<body>

<form method="post">
<div>
<a href="changepass.jsp">Change Password</a><br/>
<a href="adminhome.jsp?state=2">Master list of source</a><br/>
<a href="adminhome.jsp?state=3">Master list of destinations</a><br/>
<a href="adminhome.jsp?state=4">Master list of airlines</a><br/>
<a href="adminhome.jsp?state=5">List of flights</a><br/>
<a href="login.jsp" > Logout </a> <br/> <br/>
</div>
<div>
<%
//int state=(int)session.getAttribute("state");
int state=Integer.parseInt(request.getParameter("state"));
if(state==0)
{
	out.print(" Welcome Administrator !<br/>");
	//session.setAttribute("state",1);
}
 if(state==1)
{
	out.print("Password Changed Sucessfully !<br/>");
}


if(state>1 && state<6)
{
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","Patel@1985");
    Statement stmt = conn.createStatement();
    ResultSet rs;
    if(state==2)
    {
    	rs=stmt.executeQuery("select name from source");
    	out.print("<table><tr><th> Source</th></tr>");
    	while(rs.next())
    	{
    		out.print("<tr><td>"+rs.getString(1) +"</td></tr>");
    	}
    	out.print("</table>");
    }
    else if(state==3)
    {
    	rs=stmt.executeQuery("select name from destination");
    	out.print("<table><tr><th> Destination</th></tr>");
    	while(rs.next())
    	{
    		out.print("<tr><td> "+rs.getString(1) +" </td></tr>");
    	}
    	out.print("</table>");
    	
    }
    else if(state==4)
    {
    	rs=stmt.executeQuery("select name from airline");
    	out.print("<table><tr><th> Airline</th></tr>");
    	while(rs.next())
    	{
    		out.print("<tr><td> "+rs.getString(1) +" </td></tr>");
    	}
    	out.print("</table>");
    	
    }
    else if(state==5)
    {
    	rs=stmt.executeQuery("select flight.id,airline.name,ticketprice,source.name source,destination.name destination from flight join airline on flight.airlineid=airline.airlineid join source on flight.srcid=source.srcid join destination on flight.destid=destination.destid");
    	out.print("<table><tr><th> Flightid</th><th> Arline</th><th> Ticketprice</th><th> Source</th><th> Destination</th></tr>");
    	while(rs.next())
    	{
    		out.print("<tr><td> "+rs.getString(1) +" </td><td> "+rs.getString(2) +" </td><td> "+rs.getString(3) +" </td><td> "+rs.getString(4) +" </td><td> "+rs.getString(5) +" </td></tr>");
    	}
    	out.print("</table>");
    }
    conn.close();
   
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
%>
</div>
</form>
</body>
</html>