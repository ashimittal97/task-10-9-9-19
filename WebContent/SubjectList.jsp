
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String driver = getServletContext().getInitParameter("driverClass");
	String url = getServletContext().getInitParameter("url");
	String db = getServletContext().getInitParameter("database");
	String uname = getServletContext().getInitParameter("user_name");
	String pas = getServletContext().getInitParameter("password");
	Class.forName(driver);
	Connection con = DriverManager.getConnection(url + db, uname, pas);
	String sql = "SELECT distinct subject from books";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
%>
<html>
<head>

<title>Book-List</title>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 35%;
	height: 50px;
	text-align: center;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 115px;
	width: 100px;
	margin-left: 587px;
}
</style>
</head>
<body>
	<h3 align="center"
		style="color: #444; font-size: x-large; text-decoration: underline;">SELECT
		THE DESIRED SUBJECTS...!</h3>
	<hr>
	<div class= container>
	<form action="MultipleBooks.jsp" method="get">
		<select multiple name="Choice">
			<%
				while (rs.next()) {
			%>

			<option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>

			<%
				}
			%>
		</select> 
		<table>
		<tr><td>
		<input type="submit" value="SEARCH">
		</td></tr>
		</table>
	</form>
</div>
<hr>
</body>
</html>