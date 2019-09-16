

<%@ page import="java.sql.*"%>

<html>
<head>
<title>Books</title>
<style>
table {
font-family: arial, sans-serif;
border-collapse: collapse;
width: 100%;
}

td, th {
border: 1px solid #dddddd;
text-align: left;
padding: 8px;
}

tr:nth-child(even) {
background-color: #dddddd;
}
</style>

</head>
<body>
  <h3 align="center"
		style="color: #444; font-size: x-large; text-decoration: underline;">CHOOSE
		THE DESIRED BOOKS...!</h3>
<table>
<tr>
<th>BOOKID</th>
<th>BOOKNAME</th>
<th>SUBJECT</th>
<th>Edition</th>
<th>Price</th>
<th>ADD TO CART</th>
</tr>


<%
String languages = " ";
String[] lang = request.getParameterValues("Choice");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashi", "root", "root");
for (int i = 0; i < lang.length; i++) {
PreparedStatement ps = con.prepareStatement("select * from books where Subject=('" + lang[i] + "')");
               ResultSet rs1 = ps.executeQuery();
while (rs1.next()) {
%>

<tr>
<td><%=rs1.getString(1)%></td>
<td><%=rs1.getString(2)%></td>
<td><%=rs1.getString(3)%></td>
<td><%=rs1.getString(4)%></td>
<td><%=rs1.getString(5)%></td>
<td><a href=CartManager?code="+<%=rs1.getString(1)%>+">Add-To-Cart</a><br></td>
</tr>


<%
}
}
%>
</table>
</body>
</html>