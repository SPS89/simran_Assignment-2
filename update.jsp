<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Patient Information</title>
</head>
<body>
    <%
    // Database connection parameters
    String jdbcUrl = "jdbc:mysql://localhost:3306/hospitalmanagement";
        String dbUser = "root";
        String dbPassword = "root@sp1";
        

    // Get the updated patient information from the form submission
    String PatientID = request.getParameter("PatientID");
    String name = request.getParameter("Name");
    String contactNum = request.getParameter("contactnum");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String BloodGroup = request.getParameter("BloodGroup");
    String Address = request.getParameter("Address");
    String AnyMajorDisease = request.getParameter("AnyMajorDisease");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // Establish the database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalmanagement","root","root@sp1");

        // Update patient information in the database
        String sql = "UPDATE patient SET Name=?, contactnum=?, age=?, gender=?, BloodGroup=?, Address=?, AnyMajorDisease=? WHERE PatientID=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, contactNum);
        ps.setString(3, age);
        ps.setString(4, gender);
        ps.setString(5, BloodGroup);
        ps.setString(6, Address);
        ps.setString(7, AnyMajorDisease);
        ps.setString(8, PatientID);
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Patient information updated successfully.");
        } else {
            out.println("Failed to update patient information.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    %>
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Patient Information</title>
</head>
<body>
    <form method="get" action="update.jsp">
        Enter Patient ID: <input type="text" name="PatientID">
        <input type="submit" value="Retrieve Patient Info">
    </form>
</body>
</html>
</body>
</html>