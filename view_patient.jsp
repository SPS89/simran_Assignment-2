<%-- 
    Document   : view_patient
    Created on : 8 Oct, 2023, 7:59:17 PM
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
    <title>View Patients</title>
    <style>
        /* Set the background image */
        body {
            background-image: url('patient p.jpg'); /* Replace 'background.jpg' with your image file path */
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
<div class="container">
<body>
    <h2>View Patients</h2>
    <table border="1">
        <tr>
            <th>PatientID</th>
            <th>Name</th>
            <th>contactnum</th>
            <th>age</th>
            <th>Gender</th>
            <th>BloodGroup</th>
            <th>Address</th>
            <th>AnyMajorDisease</th>
            
        </tr>
        <%
            // Database connection parameters
            String jdbcUrl = "jdbc:mysql://localhost:3306/hospitalmanagement";
            String dbUser = "root";
            String dbPassword = "root@sp1";

            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.jdbc.Driver"); // Load the JDBC driver
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@sp1");

                // Retrieve patient records from the database
                String selectQuery = "SELECT * FROM patient";
                statement = con.createStatement();
                resultSet = statement.executeQuery(selectQuery);

                while (resultSet.next()) {
                    String PatientID =  resultSet.getString("PatientID");
                    String Name =  resultSet.getString("Name");
                    String contactnum =  resultSet.getString("contactnum");
                    String age =  resultSet.getString("age");
                    String gender = resultSet.getString("gender");
                    String BloodGroup =  resultSet.getString("BloodGroup");
                    String Address =  resultSet.getString("Address");
                    String AnyMajorDisease =  resultSet.getString("AnyMajorDisease");


                    out.println("<tr>");
                    out.println("<td>" + PatientID + "</td>");
                    out.println("<td>" + Name + "</td>");
                    out.println("<td>" + contactnum + "</td>");
                    out.println("<td>" + age + "</td>");
                    out.println("<td>" + gender + "</td>");
                    out.println("<td>" + BloodGroup + "</td>");
                    out.println("<td>" + Address + "</td>");
                    out.println("<td>" + AnyMajorDisease + "</td>");
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
    <center><br><button id="closeButton">Back To Home</button><br><br></center>
      <script>
       document.getElementById('closeButton').addEventListener('click',function(){
           window.location.href='home.html';
       });
        
   </script>
</div>
</body>
</html>