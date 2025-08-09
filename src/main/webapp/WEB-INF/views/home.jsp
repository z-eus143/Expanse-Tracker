<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.app.et.entity.Expense"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker - Home</title>
	<!-- Keep your existing JSP imports and declarations -->
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
		    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
		    border: 2px solid rgba(255,255,255,0.3);
		    width: 85%;
		    max-width: 1000px;
		    animation: fadeIn 0.6s ease-in-out;
		}

		h1 {
		    text-align: center;
		    color: #FFD93D;
		    font-size: 3rem;
		    margin-bottom: 25px;
		    letter-spacing: 1px;
		}

		.top-bar {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    margin-bottom: 15px;
		    flex-wrap: wrap;
		    gap: 10px;
		}

		.btn {
		    padding: 8px 14px;
		    border: none;
		    border-radius: 6px;
		    cursor: pointer;
		    font-size: 14px;
		    font-weight: 500;
		    transition: background 0.3s ease, transform 0.2s;
		    color: white;
		}

		.btn:hover {
		    transform: translateY(-2px);
		}

		.btn-add { background-color: #28a745; }
		.btn-add:hover { background-color: #218838; }

		.btn-logout { background-color: #dc3545; }
		.btn-logout:hover { background-color: #c82333; }

		.btn-show { background-color: #17a2b8; }
		.btn-show:hover { background-color: #138496; }

		.btn-edit { background-color: #ffc107; color: #333; }
		.btn-edit:hover { background-color: #e0a800; }

		.btn-delete { background-color: #dc3545; }
		.btn-delete:hover { background-color: #c82333; }

		.filter-form {
		    display: flex;
		    align-items: center;
		    gap: 12px;
		    flex-wrap: wrap;
		    justify-content: flex-start;
		    margin-bottom: 20px;
		}

		.filter-form label {
		    font-weight: 500;
		}

		.filter-form input[type="date"] {
		    padding: 6px 10px;
		    border-radius: 5px;
		    border: 1px solid #ccc;
		    font-size: 14px;
		}

		.table-container {
		    max-height: 350px;
		    overflow-y: auto;
		    border-radius: 8px;
		    box-shadow: inset 0 0 8px rgba(0,0,0,0.1);
		    animation: fadeIn 0.6s ease-in-out;
		    background: rgba(255, 255, 255, 0.05);
		}

		.expense-list {
		    width: 100%;
		    border-collapse: collapse;
		    animation: slideIn 0.6s ease-in-out;
		}

		.expense-list thead th {
		    position: sticky;
		    top: 0;
		    background-color: white;
		    color: #333;
		    padding: 14px;
		    font-weight: bold;
		    border-bottom: 2px solid rgba(0,0,0,0.1);
		}

		.expense-list td {
		    padding: 12px;
		    border-bottom: 1px solid rgba(255,255,255,0.1);
		}

		.expense-list tbody tr:hover {
		    background-color: rgba(255,255,255,0.1);
		    transition: background 0.3s ease;
		}
		
		.filter-form input[type="date"] {
		    background: rgba(255, 255, 255, 0.15);
		    color: white;
		    padding: 8px 12px;
		    border-radius: 8px;
		    border: 1px solid rgba(255,255,255,0.4);
		    font-size: 14px;
		    backdrop-filter: blur(5px);
		    outline: none;
		    transition: all 0.3s ease;
		}

		/* Placeholder text for empty date fields */
		.filter-form input[type="date"]::placeholder {
		    color: rgba(255,255,255,0.7);
		}

		/* Change icon color */
		.filter-form input[type="date"]::-webkit-calendar-picker-indicator {
		    filter: invert(1);
		    cursor: pointer;
		    opacity: 0.8;
		}

		/* On focus effect */
		.filter-form input[type="date"]:focus {
		    border-color: #FFD93D;
		    box-shadow: 0 0 5px #FFD93D;
		}


		@keyframes fadeIn {
		    from { opacity: 0; transform: translateY(-20px); }
		    to { opacity: 1; transform: translateY(0); }
		}

		@keyframes slideIn {
		    from { opacity: 0; transform: translateX(-20px); }
		    to { opacity: 1; transform: translateX(0); }
		}

		/* Scrollbar styling */
		.table-container::-webkit-scrollbar { width: 8px; }
		.table-container::-webkit-scrollbar-thumb {
		    background: #888;
		    border-radius: 4px;
		}
		.table-container::-webkit-scrollbar-thumb:hover { background: #555; }
	</style>
</head>
<body>

<div class="container">
    <h1>Expenses</h1>

    <div class="top-bar">
        <button class="btn btn-add" onclick="window.location.href='addexpense'">+ Add Expense</button>
        <button class="btn btn-delete" onclick="window.location.href='logout'">Logout</button>
    </div>

    <!-- Filter Form -->
    <form action="filterExpenses" method="get" class="filter-form">
        <label for="fromDate" style="color:white;" >From:</label>
        <input type="date" name="fromDate" id="fromDate" value="${from}" required>
        
        <label for="toDate" style="color:white;">To:</label>
        <input type="date" name="toDate" id="toDate" value="${to}" required>
        
        <button type="submit" class="btn btn-show">Show Records</button>
    </form>

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

					if (expList != null && !expList.isEmpty()) {
						for (Expense expense : expList) {
				%>
                <tr>
                    <td><%=expense.getCreatedDate()%></td>
                    <td><%=expense.getName()%></td>
                    <td><%=expense.getDescription()%></td>
                    <td><%=expense.getAmount()%></td>
                    <td>
                        <button onclick="window.location.href='updateExpense?eid=<%= expense.getEid()%>'" class="btn btn-edit">Edit</button>
                        <button class="btn btn-delete" onclick="window.location.href='deleteexpense?eid=<%= expense.getEid()%>'">Delete</button>
                    </td>
                </tr>
				<%
						}
					} else {
				%>
				<tr>
				    <td colspan="5" style="color:white;">No records found for selected dates.</td>
				</tr>
				<%
					}
				%>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
