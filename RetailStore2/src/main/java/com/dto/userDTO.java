package com.dto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserDetailServlet")
public class userDTO extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "username", "password");
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM user WHERE id = ?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
            out.println("<title>user_detail</title>");
            out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css\">");
            out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">");
            out.println("<style>");
            out.println("h1 { font-size:50px; text-align:center; padding-top:30px; color:#000066; }");
            out.println("img { float: left; width: 77px; }");
            out.println("li { font-size:24px; }");
            out.println("h3 { font-size:24px; }");
            out.println("p { text-align:center; font-size:26px; }");
            out.println("body { margin:0; padding:0; font: 400 15px/1.8 Lato, sans-serif; color: #777; width:100%; height:100vh; background-image:url(../pic/1.jpg); background-size:cover; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body class=\"container display-4\">");
            out.println("<div class=\"w3-row\">");
            out.println("<div class=\"w3-col 18 s12\">");
            out.println("<div class=\"w3-card-4 w3-margin w3-black\">");
            out.println("<div class=\"w3-container\">");
            out.println("<h1 class=\"text-center font-weight-bold text-warning\">User's/Patients Profile</h1>");
            out.println("<hr color=\"#333333\" />");
            
            while (rs.next()) {
                out.println("<h3>ID : " + rs.getString("id") + "</h3>");
                out.println("<h3>Name : " + rs.getString("f_name") + " " + rs.getString("l_name") + "</h3>");
                out.println("<h3>Email/Gmail Address : " + rs.getString("email") + "</h3>");
                out.println("<h3>Contact Number : " + rs.getString("contact") + "</h3>");
                out.println("<h3>Address : " + rs.getString("address") + "</h3>");
            }
            
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}