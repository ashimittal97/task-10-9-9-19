<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%
	String user = (String) session.getAttribute("user");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashi", "root", "root");
	String sql = "SELECT * from users where userid=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, user);
	ResultSet rs = ps.executeQuery();
%>
<html>
<head>
<title>Update-profile</title>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 35%;
	height: 500px;
	text-align: center;
}

input[type=text]:hover {
	height: 35px;
	padding-left: 15px;
	border: 1px solid #ccc;
	box-shadow: 1px 1px grey;
	border-radius: 4px;
	resize: vertical;
}

input[type=password]:hover {
	height: 35px;
	padding-left: 15px;
	border: 1px solid #ccc;
	box-shadow: 1px 1px grey;
	border-radius: 4px;
	resize: vertical;
}

input[type=submit]:hover {
	height: 35px;
	padding-left: 15px;
	box-shadow: 2px 2px grey;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: center;
}

h6 {
	font-size: large;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 30px;
	width: 507px;
	margin-left: 475px;
}
</style>

</head>
<body>
<script>
function myFunction() {
  alert("Updation Successfull...!");
}
</script>
	<h6>
		Welcome..<%=user%>..!
	</h6>
	<h3 align="center"
		style="color: #444; font-size: x-large; text-decoration: underline;">Update
		Your Profile</h3>
	<hr>
	<div class=container>
		<form action="UpdateUser">
			<%
				while (rs.next()) {
					String userid = rs.getString(1);
					String password = rs.getString(2);
					String username = rs.getString(3);
					String Address = rs.getString(4);
					int Mobile = rs.getInt(5);
					String email = rs.getString(6);
			%>
			<table align="center">
				<tr>
					<th>Userid</th>
					<td><input type="text" name="userid" value=<%=userid%> /></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="password" value=<%=password%> /></td>
				</tr>
				<tr>
					<TH>Username</TH>
					<TD><input type="text" name="username" value=<%=username%> /></TD>
				</tr>
				<TR>
					<TH>Address</TH>
					<TD><input type="text" name="address" value=<%=Address%> /></TD>
				</TR>
				<tr>
					<th>Mobile</th>
					<TD><input type="text" name="mobile" value=<%=Mobile%> /></TD>
				</tr>
				<TR>
					<TH>Email-Id</TH>
					<td><input type="text" name="email" value=<%=email%> /></td>
				</TR>
				<TR>

					<td align="center" colspan="2"><input type="submit"
						value="Update" onclick="myFunction()"/></td>
				</TR>
				<%
					}
				%>

			</table>
	</div>

	</form>
	<hr>

</body>
</html>