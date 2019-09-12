<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	long val = session.getMaxInactiveInterval();
	String user = (String) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("index.jsp");
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h3>
		DashBoard-For-<%=user%>
	</h3>
	<hr>
	<table>
		<tr>
			<th><a href="SubjectList.jsp">Explore-Store</a></th>
		</tr>
		<tr>
			<th><a href="">Search-Book</a></th>
		</tr>
		<tr>
			<th><a href="UpdateProfile.jsp">Update-Profile</a></th>
		</tr>
		<tr>
			<th><a href="">View-Cart</a></th>
		</tr>
		<tr>
			<th><a href="">Trace-Order</a></th>
		</tr>
		<tr>
			<th><a href="">Logout</a></th>
		</tr>
	</table>
	<hr>
</body>
</html>