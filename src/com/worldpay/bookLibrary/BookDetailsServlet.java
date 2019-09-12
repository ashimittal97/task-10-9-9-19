package com.worldpay.bookLibrary;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookDetailsServlet
 */
@WebServlet("/BookDetailsServlet")
public class BookDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int hitCount=1;
		HttpSession session=request.getSession();
		Map<String,Integer> map=(Map)session.getAttribute("map");
		
		String currentuser=request.getParameter("currentuser");
		//System.out.println(currentuser);
		System.out.println(currentuser);
		if(!map.containsKey(currentuser))
			map.put(currentuser, 1);
		else
		{
			 hitCount= map.get(currentuser);
			hitCount+=1;
			map.replace(currentuser, hitCount);
			
		}
		String code = request.getParameter("code");
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashi", "root", "root");
			String sql = "SELECT * from books where Book_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(code));
			ResultSet rs = ps.executeQuery();
			
			out.println("<html>");
			out.println("<html><body>");
			out.println("<h3>Book-Details</h3>");
			out.println("<hr>");
			while(rs.next())
			{
				int Book_id=Integer.parseInt(rs.getString(1));
				String Book_Name=rs.getString(2);
				String Subject=rs.getString(3);
				String Edition=rs.getString(4);
				int price=Integer.parseInt(rs.getString(5));
				out.println("<table border=2 align='center'>");
				out.println("<tr>");
				out.println("<td>BCode</td>");
				out.println("<td>"+Book_id+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>Title</td>");
				out.println("<td>"+Book_Name+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>Subject</td>");
				out.println("<td>"+Subject+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>Edition</td>");
				out.println("<td>"+Edition+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>Price</td>");
				out.println("<td>"+price+"</td>");
				out.println("</tr>");
				out.println("</table>");
			}
			out.println("<hr>");
			out.println("<a href=CartManager?code="+code+">Add-To-Cart</a><br>");
			out.println("<a href=SubjectPageServlet>Subject-Page</a><br>");
			out.println("<a href=buyerpage.jsp>Buyer-Page</a><br>");
			out.println("</body></html>");
				}
				
				
				catch(Exception e){e.printStackTrace();}
				
				}
		
		}

