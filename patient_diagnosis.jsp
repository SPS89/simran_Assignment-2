<%-- 
    Document   : patient_diagnosis
    Created on : 8 Oct, 2023, 11:38:29 PM
    Author     : 91933
--%>
<% 
  
    if (session.getAttribute("Email") == null) {
        response.sendRedirect("Login.html");
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Diagnosis</title>
</head>
<body>
    <% 
        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/hospitalmanagement";
        String dbUser = "root";
        String dbPassword = "root@sp1";

        // Data from the form
        String PID = request.getParameter("PID");
        String Symptoms = request.getParameter("Symptoms");
        String Medicines = request.getParameter("Medicines");
        String Diagnosis = request.getParameter("Diagnosis");
        String WardReq = request.getParameter("WardReq");
        String TypeWard = request.getParameter("TypeWard");
        


  try {
            Class.forName("com.mysql.jdbc.Driver"); 
           Connection   conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@sp1");

            String insertQuery = "INSERT INTO PatientReport (PID,Symptoms, Medicines, Diagnosis, WardReq, TypeWard) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement  preparedStatement = conn.prepareStatement(insertQuery);
            preparedStatement.setString(1, PID);
            preparedStatement.setString(2, Symptoms);
            preparedStatement.setString(3, Medicines);
            preparedStatement.setString(4, Diagnosis);
            preparedStatement.setString(5, WardReq);
            preparedStatement.setString(6, TypeWard);
             
            preparedStatement.executeUpdate();

         int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
             
               out.println("Patient diagnosis added successfully.");
                response.sendRedirect("view_patientreport.jsp");
            } else {
               
                out.println("Failed to add patient diagnosis");
          }
           preparedStatement.close();
            conn.close();
   }   catch (Exception  e) {out.print(e.getMessage());
            e.printStackTrace();
        }
    %>
  

</body>
</html>