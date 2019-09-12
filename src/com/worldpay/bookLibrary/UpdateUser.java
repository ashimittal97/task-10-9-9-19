package com.worldpay.bookLibrary;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import javax.xml.ws.Response;



/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	Statement st;
	
	//private static final String Update_sql=
	
		
	
	public void destroy(){
		try{
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		String username=request.getParameter("username");
		String address=request.getParameter("address");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
	
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ashi","root","root");
			st=con.createStatement();
			st.executeUpdate("UPDATE USERS SET password='"+password+"',username='"+username+"',address='"+address+"',mobile='"+mobile+"',email='"+email+"',utype='Buyer' where userid='"+userid+"'");
			out.println("<script type=\"text/JavaScript\">");
            out.println("alert(\"Updation Successfull...!\")");
            out.println("</script>");
			response.sendRedirect("buyerpage.jsp");
			}catch(Exception e){
				e.printStackTrace();
			}
		
	}

}
