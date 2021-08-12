<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Details</title>
</head>
<body>
<%
String name=request.getParameter("name");

out.print("<form action=\"payment.jsp\" method=\"post\"> <h3>Hello "+name+"</h3><br/>");

out.print("Your Selected Flight Details are as follows:<br/><br/>");
out.print("Flight ID: "+session.getAttribute("id")+"<br/>");
out.print("Flight From: "+session.getAttribute("src")+"<br/> Flight To: " + session.getAttribute("dest") +"<br/>");
out.print("Airline Name: "+session.getAttribute("airline")+"<br/>");
//String pass=(String)session.getAttribute("passengers");
//int passengers=Integer.parseInt(pass);
int passengers=Integer.parseInt((String)session.getAttribute("passengers"));
int ticketprice=Integer.parseInt((String)session.getAttribute("ticketprice"));

out.print("Ticket Price(per person): $"+ticketprice+"<br/> No. of passengers: " +passengers +"<br/>");
int amount=ticketprice*passengers;
out.print("Total Amount: $"+amount+"<br/><br/>");
out.print("<input type=\"submit\" value=\"Proceed to Payment\">  &nbsp &nbsp &nbsp <a href=\"home.jsp\"> Go back to Home Page </a> </form>");
session.setAttribute("name",name);
session.setAttribute("email", request.getParameter("email"));
session.setAttribute("phone", request.getParameter("phone"));
String address= request.getParameter("add1")+" "+ request.getParameter("add2")+ " "+  request.getParameter("city")+" "+  request.getParameter("state")+ " "+ request.getParameter("country")+ " "+request.getParameter("zipcode");
session.setAttribute("address",address);


%>
</body>
</html>