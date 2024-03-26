<%-- 
    Document   : login
    Created on : 8 Oct, 2023, 6:01:59 PM
    Author     : 91933
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
    <%
    String jdbcUrl = "jdbc:mysql://localhost:3306/hospitalmanagement";
    String dbUser = "root";
    String dbPassword = "root@sp1";

    String Email = request.getParameter("Email");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement", "root", "root@sp1");

        String query = "SELECT * FROM logintable WHERE Email=? AND password=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, Email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        boolean valid = rs.next();

        if (valid) {
            // Set email in session
            HttpSession ssession = request.getSession();
            session.setAttribute("Email", Email); 

            // Redirect to home.html
            response.sendRedirect("home.html");
            out.println("Login successful");
        } else {
            out.print("Invalid credentials");
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</body>
</html>
