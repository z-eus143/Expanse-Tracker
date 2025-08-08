<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.app.et.entity.Expense"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker - Home</title>
<style>
	body {
	    font-family: 'Segoe UI', sans-serif;
	    margin: 0;
	    padding: 0;
	    display: flex;
	    justify-content: center;
	    align-items: flex-start;
	    min-height: 100vh;
	    background: linear-gradient(135deg, #3AB0FF, #6A5ACD, #FF7F50);
	    background-size: 800% 800%;
	    animation: gradientShift 30s ease infinite;
	}

	@keyframes gradientShift {
	    0% { background-position: 0% 50%; }
	    50% { background-position: 100% 50%; }
	    100% { background-position: 0% 50%; }
	}

	.container {
	    background: rgba(255, 255, 255, 0.15);
		color: white;
	    margin-top: 40px;
	    padding: 30px 40px;
		border-radius: 15px;
		backdrop-filter: blur(10px);
	    box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
		border: 2px solid rgba(255,255,255,0.3);
	    width: 80%;
	    max-width: 900px;
	    animation: fadeIn 0.6s ease-in-out;
	}

	h1 {
	    text-align: center;
	    color: #FFD93D;
		font-size: 3rem;
	    margin-bottom: 25px;
	}

	.expense-list {
	    width: 100%;
	    border-collapse: collapse;
	    animation: slideIn 0.6s ease-in-out;
	}

	.expense-list th, .expense-list td {
	    padding: 14px 16px;
	    border-bottom: 1px solid #ddd;
	    text-align: center;
	}

	.expense-list th {
	    background-color: #f7f7f7;
	    color: #444;
	}

	.btn {
	    padding: 8px 14px;
	    border: none;
	    border-radius: 6px;
	    cursor: pointer;
	    color: white;
	    font-size: 14px;
	    transition: background 0.3s ease, transform 0.2s;
	}

	.btn:hover {
	    transform: translateY(-2px);
	}

	.btn-add {
	    background-color: #28a745;
	}
	.btn-add:hover {
	    background-color: #218838;
	}
	
	.btn-logout {
	    background-color: #007bff;
	}
	.btn-logout:hover {
	    background-color: #0069d9;
	}

	.btn-edit {
	    background-color: #ffc107;
	    color: #333;
	}
	.btn-edit:hover {
	    background-color: #e0a800;
	}

	.btn-delete {
	    background-color: #dc3545;
	}
	.btn-delete:hover {
	    background-color: #c82333;
	}

	@keyframes fadeIn {
	    from { opacity: 0; transform: translateY(-20px); }
	    to { opacity: 1; transform: translateY(0); }
	}

	@keyframes slideIn {
	    from { opacity: 0; transform: translateX(-20px); }
	    to { opacity: 1; transform: translateX(0); }
	}

	.top-bar {
	    text-align: right;
	    margin-bottom: 15px;
	}

    .table-container {
        max-height: 350px;
        overflow-y: auto;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: inset 0 0 5px rgba(0,0,0,0.05);
        animation: fadeIn 0.6s ease-in-out;
    }

    .expense-list thead th {
        position: sticky;
        top: 0;
        background-color: #f7f7f7;
        z-index: 1;
    }

    .table-container::-webkit-scrollbar {
        width: 8px;
    }
    .table-container::-webkit-scrollbar-thumb {
        background: #888;
        border-radius: 4px;
    }
    .table-container::-webkit-scrollbar-thumb:hover {
        background: #555;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Expenses</h1>

    <div class="top-bar">
        <button class="btn btn-add" onclick="window.location.href='addexpense'">+ Add Expense</button>
		<button class="btn btn-delete" onclick="window.location.href='logout'">Logout</button>
    </div>

    <div class="table-container">
        <table class="expense-list">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Expense Name</th>
					<th>Description</th>
                    <th>Amount (₹)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
				<%
					List<Expense> expList = (List<Expense>) request.getAttribute("exps");

					for (Expense expense : expList) {
					%>
                <tr><td><%=expense.getCreatedDate()%></td><td><%=expense.getName()%></td><td><%=expense.getDescription()%></td><td><%=expense.getAmount()%></td><td><button onclick="window.location.href='updateExpense?eid=<%= expense.getEid()%>'" class="btn btn-edit">Edit</button> <button class="btn btn-delete" onclick="window.location.href='deleteexpense?eid=<%= expense.getEid()%>'">Delete</button></td></tr>
				<%
					}
				%>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
