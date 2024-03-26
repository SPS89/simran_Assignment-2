<%-- 
    Document   : add_patient
    Created on : 8 Oct, 2023, 7:18:16 PM
    Author     : 91933
--%>
<% 
  
    if (session.getAttribute("Email") == null) {
        response.sendRedirect("Login.html");
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Patient</title>
</head>
<body>
    <%
        // Get patient information from the HTML form
        String PatientID = request.getParameter("PatientID");
        String Name = request.getParameter("Name");
        String contactnum = request.getParameter("contactnum");
        String age = request.getParameter("age");
         String gender = request.getParameter("gender");
         String BloodGroup = request.getParameter("BloodGroup");
         String Address = request.getParameter("Address");
         String AnyMajorDisease = request.getParameter("AnyMajorDisease");

        // Define your database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/hospitalmanagement";
        String dbUser = "root";
        String dbPassword = "root@sp1";

        try {
            Class.forName("com.mysql.jdbc.Driver"); // Load the JDBC driver

            // Establish a database connection
            java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@sp1");
            String sql = "INSERT INTO patient (PatientID,Name,contactnum,age,gender,BloodGroup,Address,AnyMajorDisease) VALUES (?, ?, ?, ?,?,?,?,?)";
            java.sql.PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, PatientID);
            preparedStatement.setString(2, Name);
            preparedStatement.setString(3, contactnum);
            preparedStatement.setString(4, age);
            preparedStatement.setString(5, gender);
            preparedStatement.setString(6, BloodGroup);
            preparedStatement.setString(7, Address);
            preparedStatement.setString(8, AnyMajorDisease);

            // Execute the insert statement
            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                // Patient record inserted successfully
                out.println("Patient added successfully.");
                 response.sendRedirect("view_patient.jsp");
            } else {
                // Insertion failed
                out.println("Failed to add patient.");
            }

            // Close resources
            preparedStatement.close();
            con.close();
        } catch (ClassNotFoundException | java.sql.SQLException e) {
            e.printStackTrace();
            // Handle exceptions appropriately
        }
    %>
</body>
</html>