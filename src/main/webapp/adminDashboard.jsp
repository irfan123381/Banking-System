<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("username") %></h2>
    <a href="registerCustomer.jsp">Register Customer</a> |
    <a href="viewCustomers.jsp">View Customers</a> |
    <a href="logout.jsp">Logout</a>
</body>
</html>
