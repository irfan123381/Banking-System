<!DOCTYPE html>
<html>
<head>
    <title>Customer Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Customer Login</h2>
    <form action="CustomerLoginServlet" method="post">
        <label for="account_no">Account No:</label>
        <input type="text" id="account_no" name="account_no"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
