<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - To-Do App</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .glass-card {
        background: rgba(255, 255, 255, 0.95);
        border-radius: 20px;
        padding: 40px;
        width: 100%;
        max-width: 400px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    }
    h2 { text-align: center; color: #667eea; margin-bottom: 30px; }
    input {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 16px;
    }
    button {
        width: 100%;
        padding: 12px;
        background: #667eea;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        margin-top: 10px;
    }
    button:hover { background: #764ba2; }
    .error { color: red; text-align: center; margin-bottom: 10px; }
    .link { text-align: center; margin-top: 20px; }
    .link a { color: #667eea; text-decoration: none; }
</style>
</head>
<body>
    <div class="glass-card">
        <h2>📝 Register</h2>
        <% if(request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
        <form action="register" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Register</button>
        </form>
        <div class="link"><a href="login.jsp">Login</a></div>
    </div>
</body>
</html>