<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlyAway Home</title>
</head>
<body>
<h4>Welcome to FlyAway Online Booking Portal</h4>
<form action="flights.jsp" method="post">
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","Patel@1985");
    Statement stmt = conn.createStatement();
    ResultSet rs;
    rs=stmt.executeQuery("select name from source");
    
    
    out.print(" &nbsp Source:<select id=\"src\" name=\"src\" required>");
    while(rs.next())
    {
    	out.print("<option value=\""+rs.getString(1)+"\"> "+rs.getString(1) +"</option>");
    }
    out.print("</select>");
    rs=stmt.executeQuery("select name from destination");
    out.print(" &nbsp Destination:<select id=\"dest\" name=\"dest\" required>");
    while(rs.next())
    {
    	out.print("<option value=\""+rs.getString(1)+"\"> "+rs.getString(1) +"</option>");
    }
    out.print("</select>");   
    conn.close();
 	}
 	catch(Exception e)
 	{
 		System.out.println(e);
 	}
  String s;
  Date date;
  java.text.Format formatter;
  Calendar calendar = Calendar.getInstance();
  calendar.add(Calendar.DATE, 1);
  date = calendar.getTime();
  formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
  s = formatter.format(date);

out.print("&nbsp Passengers: <input type=\"number\" id=\"passengers\" name=\"passengers\" min=\"1\" max=\"10\" required>");
out.print( "&nbsp Travel Date:<input type=\"date\" id=\"traveldate\" name=\"traveldate\" value=\"" + s + "\" min=\"" + s +"\" required>");


%>
&nbsp &nbsp 
<input type="submit" value="Search"> <br/> <br/>
<a href=login.jsp> Admin Login</a>
</form>
</body>
</html>