<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Welcome, Customer</h2>
    <%
        String accountNo = (String) session.getAttribute("account_no");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/BankingSystem", "root", "root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Customer WHERE account_no=?");
        ps.setString(1, accountNo);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            out.print("Account No: " + rs.getString("account_no") + "<br>");
            out.print("Balance: " + rs.getDouble("initial_balance") + "<br>");
        }
    %>
    <a href="viewTransactions.jsp">View Transactions</a> |
    <a href="deposit.jsp">Deposit</a> |
    <a href="withdraw.jsp">Withdraw</a> |
    <a href="closeAccount.jsp">Close Account</a> |
    <a href="logout.jsp">Logout</a>
</body>
</html>
