<%-- 
    Document   : logout
    Created on : 14 Oct, 2023, 3:38:01 PM
    Author     : 91933
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Logout Page</title>
</head>
<body>
    <% 
  
  session.removeAttribute("Email") ;
        response.sendRedirect("Login.html");
    
%>
    <h1>You have been successfully logged out</h1>
    
</body>
</html>