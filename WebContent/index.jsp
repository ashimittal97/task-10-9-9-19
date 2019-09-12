<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String s1 = "", s2 = "";

	//to read the cookies
	//step-1 (fetch all the cookies coming with request)
	Cookie ck[] = request.getCookies();
	//step-2 (search for the desired one)
	if (ck != null)
		for (Cookie c : ck) {
			String name = c.getName();
			if (name.equals("id")) {
				s1 = c.getValue();
			} else if (name.equals("pw")) {
				s2 = c.getValue();
			}
		}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BOOK STORE</title>
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
	width: 212px;
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
	<br>
	<br>

	<h3 align="center"
		style="color: #444; font-size: x-large; text-decoration: underline;">Online
		Book Store</h3>
	<hr>
	<div class=container>

		<form action="VerifyUser" method="post">
			<table align="center">
				<tr>
					<th>Userid</th>
					<td><input type="text" name="userid" value="<%=s1%>" /></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="password" value="<%=s2%>" /></td>
				</tr>

				<tr>
					<th>Usertype</th>
					<td colspan="2">owner <input type="radio" name="utype"
						value="owner" /> buyer <input type="radio" name="utype"
						value="buyer" checked="checked" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit"
						value="Login" /></td>
				</tr>
				<tr>
					<td colspan="2">Remember-Me &nbsp;<input type="checkbox" name="save"
						value="yes" checked="checked" /><br> <a href="register.jsp">New-user?Click
							Here</a></td>
				</tr>
				</tr>

			</table>
		</form>
	</div>
	<hr>
</body>
</html>