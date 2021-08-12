<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Gateway</title>
</head>
<body>
<form action="confirmation.jsp" method="post">
<% 
if(request.getParameter("success")!=null)
{
	out.print("  &nbsp &nbsp Payment Failed. Try again<br/><br/>");
}

out.print("Name on the Card: <input type=\"text\" name=\"name\" required /><br/>");
out.print("Card Number: <input type= \"text\" name=\"cno\" placeholder=\"XXXX-XXXX-XXXX-XXXX\" pattern= \"[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}\" required /> <br/>");
%>
Valid upto: <input type= "text" name ="validity" placeholder= "MM/YYYY" pattern= "[0-12]{2}/[0-9]{4}" required /> 
CVV No: <input type="password" name="cvvno" placeholder="XXX" pattern= "[0-9]{3}" required /> <br/>
<input type="submit" value="payment sucess"/>


 &nbsp &nbsp &nbsp
<a href="payment.jsp?success=false">Payment Failure</a>
</form>
</body>
</html>