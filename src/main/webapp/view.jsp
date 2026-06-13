<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    HttpSession userSession = request.getSession(false);
    if(userSession == null || userSession.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Tasks - To-Do App</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        padding: 40px 20px;
    }
    .container {
        max-width: 900px;
        margin: auto;
        background: white;
        border-radius: 20px;
        padding: 30px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
    }
    h2 { text-align: center; color: #333; margin-bottom: 20px; }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background: #667eea;
        color: white;
    }
    tr:hover { background: #f5f5f5; }
    .completed { color: green; font-weight: bold; }
    .pending { color: orange; font-weight: bold; }
    .btn {
        padding: 6px 12px;
        text-decoration: none;
        border-radius: 8px;
        margin: 2px;
        display: inline-block;
        font-size: 14px;
    }
    .btn-complete { background: #4ecdc4; color: white; }
    .btn-delete { background: #ff6b6b; color: white; }
    .btn-back {
        background: #333;
        color: white;
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 8px;
    }
    .btn-back:hover, .btn-complete:hover, .btn-delete:hover { opacity: 0.8; transform: scale(1.02); }
    .no-tasks { text-align: center; color: #999; padding: 40px; font-size: 18px; }
</style>
</head>
<body>
<div class="container">
    <h2>📋 My Task List</h2>
    <table>
        <thead>
            <tr><th>ID</th><th>Task</th><th>Status</th><th>Action</th></tr>
        </thead>
        <tbody>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("tasks");
            boolean hasTasks = false;
            while(rs.next()) {
                hasTasks = true;
                int id = rs.getInt("id");
                String task = rs.getString("task");
                String status = rs.getString("status");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= task %></td>
            <td class="<%= status.equals("Completed") ? "completed" : "pending" %>">
                <%= status.equals("Completed") ? "✅ Completed" : "⏳ Pending" %>
            </td>
            <td>
                <% if(!status.equals("Completed")) { %>
                    <a href="updateStatus?id=<%= id %>" class="btn btn-complete">✔ Complete</a>
                <% } %>
                <a href="deleteTask?id=<%= id %>" class="btn btn-delete" onclick="return confirm('Delete task?')">🗑 Delete</a>
            </td>
        </tr>
        <% } 
            if(!hasTasks) {
        %>
        <tr><td colspan="4" class="no-tasks">✨ No tasks yet. Add your first task! ✨</td></tr>
        <% } %>
        </tbody>
    </table>
    <div style="text-align: center; margin-top: 20px;">
        <a href="index.jsp" class="btn-back">⬅ Back</a>
    </div>
</div>
</body>
</html>