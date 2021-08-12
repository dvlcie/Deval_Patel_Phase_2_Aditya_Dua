<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
             <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
</head>
<body>
<%
String id=request.getParameter("flight");

	out.print("<form action=\"details.jsp\" method=\"post\">");
	out.print("<h3> Registration</h3><br/>");
	out.print("Name: <input type=\"text\" name=\"name\" required/> <br/>");
	out.print("Email: <input type=\"email\" name=\"email\" required/> <br/>");
	out.print("Contact No.: <input type=\"tel\" name=\"phone\" placeholder=\"123-456-7890\" pattern=\"[0-9]{3}-[0-9]{3}-[0-9]{4}\" required> <br/>");
	out.print("Address Line 1:<input type=\"text\" name=\"add1\" required/> <br/>");
	out.print("Address Line 2:<input type=\"text\" name=\"add2\" /> <br/>");
	out.print("City:<input type=\"text\" name=\"city\" required/>");
	out.print("ZipCode:<input type=\"text\" name=\"zipcode\" required/> <br/>");
	out.print("State:<input type=\"text\" name=\"state\" required/>");
	out.print("Country:<input type=\"text\" name=\"country\" required/> <br/>");
	out.print("<input type=\"submit\" value=\"Next\"></form>");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","Patel@1985");
	    Statement stmt = conn.createStatement();
	    ResultSet rs;
	  	String src=request.getParameter("src");
	  	String dest=request.getParameter("dest");
	    rs=stmt.executeQuery("select airline.name,ticketprice from flight join airline on flight.airlineid=airline.airlineid where flight.id=\""+id+"\"");
	    session.setAttribute("id",id);
	    if(rs.next())
	    {
	    session.setAttribute("airline",rs.getString(1));
	    session.setAttribute("ticketprice",rs.getString(2));
	    //out.print(" Airline:"+ rs.getString(1) +" Ticket Price:$" + rs.getString(2));
	    }
	    conn.close();
	 	}
	 	catch(Exception e)
	 	{
	 		System.out.println(e);
	 	}
%>

</body>
</html>