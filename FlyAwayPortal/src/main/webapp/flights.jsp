<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Search Results</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway", "root","Patel@1985");
    Statement stmt = conn.createStatement();
    ResultSet rs=null;
  	String src=request.getParameter("src");
  	String dest=request.getParameter("dest");
  	String passengers=request.getParameter("passengers");
  //Date traveldate=new java.text.SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("traveldate"));
  	String traveldate=request.getParameter("traveldate");
    
  	//out.print(" Source:"+src+" Destination:"+dest+" Passengers:"+passengers+" Travel Date:"+ traveldate +" <br/>");
  	
    rs=stmt.executeQuery("select flight.id,airline.name,ticketprice,source.name source,destination.name destination from flight join airline on flight.airlineid=airline.airlineid join source on flight.srcid=source.srcid join destination on flight.destid=destination.destid where source.name=\""+src+"\" AND destination.name=\""+dest+"\"");
   if(!rs.next()) 
   {
	   out.print("No Flight Exist from "+src +"to "+dest+"<br/>");
	   out.print("<a href=\"home.jsp\"> Go to home Page</a>");
   }
   else{
	 out.print("<form action=\"registration.jsp\" method=\"post\">");
	 boolean head=true;
   do
    {
    	if(head)
    	{
    		
    		out.print("<table><tr><th> </th> <th>Airline Name</th><th> Ticket Price </th>  <th> Source</th>   <th> Destination</th></tr>");
    		out.print("<tr><td> <input type=\"radio\" id=\""+rs.getString(1)+"\" name=\"flight\" value=\""+rs.getString(1)+"\"checked ></td>");
        	out.print("<td>"+rs.getString(2)+ "</td><td> $"+rs.getString(3)+ "</td><td> "+rs.getString(4)+ "</td><td> "+rs.getString(5)+"</td>");
        	head=false;
    	}
    	else
    	{
    		out.print("<tr><td> <input type=\"radio\" id=\""+rs.getString(1)+"\" name=\"flight\" value=\""+rs.getString(1)+"\" ></td>");
        	out.print("<td>"+rs.getString(2)+ "</td><td> $"+rs.getString(3)+ "</td><td> "+rs.getString(4)+ "</td><td> "+rs.getString(5)+"</td>");
    	}
    } while(rs.next());
    
    out.print("</table><input type=\"submit\" value=\"Book\"></form>");
    session.setAttribute("src",src);
    session.setAttribute("dest",dest);
	session.setAttribute("passengers",passengers);
	session.setAttribute("traveldate",traveldate);
    conn.close();
 	}
}
 	catch(Exception e)
 	{
 		System.out.println(e);
 	}
%>

</body>
</html>