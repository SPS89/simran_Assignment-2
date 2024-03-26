<%-- 
    Document   : view_patientreport
    Created on : 9 Oct, 2023, 1:27:33 AM
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> Patient Diagnosis Reports</title>
    <style>
        /* Set the background image */
        body {
            background-image: url('di.jpg'); /* Replace 'background.jpg' with your image file path */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        /* Style the table container */
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Add transparency to the background */
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        /* Style the table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        /* Add more CSS styles as needed */
    </style>
</head>
<body>
    <div class="container">
        <h2> Patient Reports</h2>
        <table>
            <tr>
                <th>Patient ID</th>
                <th>Medicine</th>
                <th>Diagnosis</th>
                <th>Ward Required</th>
                <th>Type of Ward</th>
                 <th>Symptoms</th>
            </tr>
            <%
                
            String jdbcUrl = "jdbc:mysql://localhost:3306/hospitalmanagement";
            String dbUser = "root";
            String dbPassword = "root@sp1";

                Connection con = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver"); // Load the JDBC driver
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@sp1");


                    // Retrieve patient reports from the database
                    String selectQuery = "SELECT * FROM PatientReport";
                    statement = con.createStatement();
                    resultSet = statement.executeQuery(selectQuery);

                    while (resultSet.next()) {
                        String PID = resultSet.getString("PID"); 
                        String Symptoms = resultSet.getString("Symptoms");
                        String Medicines= resultSet.getString("Medicines");
                        String Diagnosis = resultSet.getString("Diagnosis");
                        String WardReq = resultSet.getString("WardReq");
                        String TypeWard = resultSet.getString("TypeWard");
                         

                        out.println("<tr>");
                        out.println("<td>" + PID + "</td>");
                        out.println("<td>" + Symptoms + "</td>");
                        out.println("<td>" + Medicines + "</td>");
                        out.println("<td>" + Diagnosis + "</td>");
                        out.println("<td>" + WardReq + "</td>");
                        out.println("<td>" + TypeWard + "</td>");
                        out.println("</tr>");
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    // Handle exceptions appropriately (e.g., display an error message)
                    out.println("Error: " + e.getMessage());
                } finally {
                    // Close resources
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (statement != null) {
                        statement.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                }
            %>
         
        </table>
        <center><br><button id="closeButton">Back To The Home</button><br><br></center>
      <script>
       document.getElementById('closeButton').addEventListener('click',function(){
           window.location.href='home.html';
       });
        
   </script>
    </div>
   
</body>
</html>