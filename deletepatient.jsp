<%-- 
    Document   : deletepatient
    Created on : 18 Oct, 2023, 1:35:52 AM
    Author     : 91933
--%>
<% 
  
    if (session.getAttribute("Email") == null) {
        response.sendRedirect("Login.html");
    }
%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Patient</title>
</head>
<body>
    <%
        String PatientID = request.getParameter("PatientID");
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        String jdbcUrl = "jdbc:mysql://localhost:3306/hospitalmanagement";
        String dbUser = "root";
        String dbPassword = "root@sp1";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@sp1");
            String sql = "DELETE FROM patient WHERE PatientID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, PatientID);
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                out.println("Patient with ID " + PatientID + " has been deleted.");
                response.sendRedirect("view_patient.jsp");
            } else {
                out.println("Patient not found or couldn't be deleted.");
            }
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
 <style>
        /* Add your CSS styles here */
        body {
            background-image: url('th.jpeg'); 
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            margin-top: 0;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"], input[type="date"], select {
            width: 90%;
            padding: 10px;
            margin-bottom: 20px;
        }
        input[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        /* Add more CSS styles as needed */
    </style>
<head>
    <title>Delete Patient Record</title>
</head>
 <div class="container">
    <h1>Delete Patient Record</h1>
    <form method="post" action="deletepatient.jsp">
        <label for="PatientID">Patient ID:</label>
        <input type="text" name="PatientID" placeholder="Enter Patient ID">
        <input type="submit" value="Delete">
    </form>
    <hr>
    <p>Patient record with ID <%= PatientID %> has been deleted.</p>
     <center><br><button id="closeButton">Back To Home</button><br><br></center>
      <script>
       document.getElementById('closeButton').addEventListener('click',function(){
           window.location.href='home.html';
       });
        
   </script>
 </div>
 
</body>
</html>
