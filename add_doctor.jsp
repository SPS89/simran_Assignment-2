<%-- 
    Document   : add_doctor
    Created on : 8 Oct, 2023, 8:42:37 PM
    Author     : 91933
--%>
<% 
  
    if (session.getAttribute("Email") == null) {
        response.sendRedirect("Login.html");
    }
%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Doctor Information</title>
</head>
<body>
    <%
        String DoctorID = request.getParameter("DoctorID");
        String DName = request.getParameter("DName");
        String Contactnum = request.getParameter("Contactnum");
        String Specialization = request.getParameter("Specialization");
        String Qualification = request.getParameter("Qualification");
        String Address = request.getParameter("Address");
        String Email = request.getParameter("Email");
        String Room = request.getParameter("Room");
         String jdbcUrl = "jdbc:mysql://localhost:3306/hospitalmanagement";
        String dbUser = "root";
        String dbPassword = "root@sp1";

        try {
            Class.forName("com.mysql.jdbc.Driver"); // Load the JDBC driver
          java.sql .Connection con=java.sql. DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@sp1");

            // Insert the doctor record into the database
            String insertQuery = "INSERT INTO doctor (DoctorID, DName, Contactnum, Specialization, Qualification, Address, Email, Room) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = con.prepareStatement(insertQuery);
            preparedStatement.setString(1, DoctorID);
            preparedStatement.setString(2, DName);
            preparedStatement.setString(3, Contactnum);
            preparedStatement.setString(4, Specialization);
            preparedStatement.setString(5, Qualification);
            preparedStatement.setString(6, Address);
            preparedStatement.setString(7, Email);
            preparedStatement.setString(8, Room);
            preparedStatement.executeUpdate();

            // Redirect to the view page after successful addition
          
  int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                // Patient record inserted successfully
                out.print("Doctor added successfully");
 %>
      
        <script>
            alert("Doctor added successfully");
            window.location = "view_doc.jsp"; // Redirect to the view page
        </script>
<%

                
            } else {
                // Insertion failed
                out.println("Failed to add doctor.");
            }

            // Close resources
            preparedStatement.close();
            con.close();
        } catch (ClassNotFoundException | java.sql.SQLException e) {
            e.printStackTrace();
            

        }
    %>
</body>
</html>