package com.worldpay.bookLibrary;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartManager
 */
@WebServlet("/CartManager")
public class CartManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// private static final long serialVersionUID = 1L;
	java.util.List<String> arr = new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();
			String code = request.getParameter("code");
			arr.add(code);
			System.out.println(code);
			session.setAttribute("book", arr);
			System.out.println(arr);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashi", "root", "root");
			for (int i = 0; i < arr.size(); i++) {
				if (session.getAttribute("book") != null) {

					String sql = "SELECT * from books where Book_id=" + arr.get(i);

					PreparedStatement ps = con.prepareStatement(sql);

					ResultSet rs = ps.executeQuery();

					while (rs.next()) {
						String Bname = rs.getString(1);
						String Subject = rs.getString(2);
						String Edition = rs.getString(3);
						String Price = rs.getString(4);
						// String subject = rs.getString(5);
						out.println("<html>");
						out.println("<body>");
						out.println("<h3>Book-Details</h3>");
						out.println("<table border=2 cellpadding=15 colspan=10>");
						out.println("<tr>");
						out.println("<td>BCode</td>");
						out.println("<td>" + Bname + "</td>");
						out.println("</tr>");
						out.println("<tr>");
						out.println("<td>Title</td>");
						out.println("<td>" + Subject + "</td>");
						out.println("</tr>");
						out.println("<tr>");
						out.println("<td>Author</td>");
						out.println("<td>" + Edition + "</td>");
						out.println("</tr>");
						out.println("<tr>");
						out.println("<td>Price</td>");
						out.println("<td>" + Price + "</td>");
						out.println("</tr>");
						out.println("<tr>");
						out.println("<td colspan='2'><a href=''>Remove-from-cart</a></td>");
						out.println("<td></td>");
						out.println("</tr>");
						out.println("</table>");
						out.println("</body>");
						out.println("</html>");
					}

				}
				else{
					System.out.println("wrong");
				}
				out.println("<a href=UserOrder?code=" + code + ">Order</a><br>");

			}
			out.println("<a href=AddCart>View-Cart</a><br>");
			out.println("<a href=SearchList.jsp>Show-books</a><br>");
			out.println("<a href=userPage.jsp>User-Page</a><br>");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
