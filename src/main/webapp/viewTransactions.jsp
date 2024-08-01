
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Transactions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }
        .transaction {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px auto;
            padding: 10px;
            width: 80%;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .transaction:nth-child(even) {
            background-color: #f9f9f9;
        }
        .transaction p {
            margin: 5px 0;
        }
        .back-link, .download-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            width: 200px;
            margin: 10px auto;
        }
        .back-link {
            background-color: #4CAF50;
        }
        .back-link:hover {
            background-color: #45a049;
        }
        .download-link {
            background-color: #008CBA;
        }
        .download-link:hover {
            background-color: #007B9E;
        }
    </style>
</head>
<body>
    <h2>Last 10 Transactions</h2>
    <%
        String accountNo = (String) session.getAttribute("account_no");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/BankingSystem", "root", "root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Transactions WHERE customer_id=(SELECT customer_id FROM Customer WHERE account_no=?) ORDER BY transaction_date DESC LIMIT 10");
        ps.setString(1, accountNo);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
    %>
        <div class="transaction">
            <p><strong>Date:</strong> <%= rs.getTimestamp("transaction_date") %></p>
            <p><strong>Amount:</strong> <%= rs.getDouble("amount") %></p>
            <p><strong>Type:</strong> <%= rs.getString("type") %></p>
        </div>
    <%
        }
    %>
    <a href="viewCustomers.jsp" class="back-link">Back to Dashboard</a>
    <a href="DownloadPDFServlet" class="download-link">Download Transactions as PDF</a>
</body>
</html>