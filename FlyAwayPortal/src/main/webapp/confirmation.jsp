<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation Page</title>
</head>
<body>
&nbsp &nbsp Payment Approved. Booking Sucessful!!!<br/>
<div>
<h2>&nbsp&nbsp Booking Details</h2>
<%
out.print("<h3>&nbsp&nbsp Personal Details </h3>");
out.print("Name:&nbsp"+session.getAttribute("name")+"<br/>");
out.print("Email:&nbsp"+session.getAttribute("email")+"<br/>");
out.print("Phone:&nbsp"+session.getAttribute("phone")+"<br/>");
out.print("Address:&nbsp"+session.getAttribute("address")+"<br/>");
out.print("</div><div>");

out.print("<h3>&nbsp&nbsp Flight Details</h3>");
out.print("Flight ID:&nbsp"+session.getAttribute("id")+"<br/>");
out.print("Source:&nbsp"+session.getAttribute("src")+"<br/>");
out.print("Destination: &nbsp"+session.getAttribute("dest")+"<br/>");
out.print("Airline Name:&nbsp"+session.getAttribute("airline")+"<br/>");
out.print("No of Passengers:&nbsp"+session.getAttribute("passengers")+"<br/>");
out.print("Travel Date:&nbsp"+session.getAttribute("traveldate")+"<br/>");

int passengers=Integer.parseInt((String)session.getAttribute("passengers"));
int ticketprice=Integer.parseInt((String)session.getAttribute("ticketprice"));
int amount=ticketprice*passengers;
out.print("Total Payment:&nbsp $"+amount+"<br/>");
out.print("Booking Confirmation number:&nbsp XXXXXXXXXXXXXXXX");


%>

</div>
<br><br/>
Thank You for Booking with FlyAway.  &nbsp &nbsp
<a href="home.jsp"> Go to Home Page</a>
</body>
</html>