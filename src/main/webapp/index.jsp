<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession(false);
    if(userSession == null || userSession.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) userSession.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - To-Do App</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }
    .glass-card {
        background: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 30px;
        width: 100%;
        max-width: 500px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.2);
    }
    h1 { color: white; text-align: center; margin-bottom: 10px; }
    .user-info { color: white; text-align: center; margin-bottom: 30px; font-size: 18px; }
    .input-group { display: flex; gap: 10px; margin-bottom: 20px; }
    input[type="text"] {
        flex: 1;
        padding: 12px;
        border: none;
        border-radius: 10px;
        font-size: 16px;
        outline: none;
    }
    button {
        background: #ff6b6b;
        color: white;
        border: none;
        padding: 12px 24px;
        border-radius: 10px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        transition: transform 0.2s;
    }
    button:hover { background: #ff4757; transform: scale(1.05); }
    .btn-view {
        background: #4ecdc4;
        display: inline-block;
        text-align: center;
        text-decoration: none;
        padding: 12px 24px;
        border-radius: 10px;
        color: white;
        font-weight: bold;
        margin: 10px 0;
    }
    .btn-view:hover { background: #44bdae; transform: scale(1.05); }
    .btn-logout {
        background: #333;
        display: inline-block;
        text-align: center;
        text-decoration: none;
        padding: 12px 24px;
        border-radius: 10px;
        color: white;
        font-weight: bold;
        margin-top: 20px;
    }
    .btn-logout:hover { background: #555; transform: scale(1.05); }
    .footer { text-align: center; margin-top: 20px; }
</style>
</head>
<body>
    <div class="glass-card">
        <h1>✅ My To-Do List</h1>
        <div class="user-info">Welcome, <%= username %>! 👋</div>
        <form action="addTask" method="post">
            <div class="input-group">
                <input type="text" name="task" placeholder="✏️ Write your task here..." required>
                <button type="submit">➕ Add Task</button>
            </div>
        </form>
        <div class="footer">
            <a href="viewTasks" class="btn-view">📋 View All My Tasks</a><br>
            <a href="logout" class="btn-logout">🚪 Logout</a>
        </div>
    </div>
</body>
</html>