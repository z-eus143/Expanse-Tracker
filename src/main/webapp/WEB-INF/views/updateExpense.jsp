<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.app.et.entity.Expense"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Expense</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #8e44ad, #3498db);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
			animation: fadeIn 1s ease-in-out;
        }

        .expense-form-container {
			background: #fff;
            padding: 35px 40px;
            border-radius: 15px;
            width: 360px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            animation: slideUp 0.6s ease-out;
        }

        h2 {
			text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        label {
			font-weight: bold;
			            display: block;
			            margin-top: 10px;
			            color: #34495e;
        }

        input[type="text"],
        input[type="number"] {
			width: 100%;
						padding: 12px 15px;
			            margin: 10px 0 20px 0;
			            border: 1px solid #ccc;
			            border-radius: 8px;
			            box-sizing: border-box;
						transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
			border-color: #8e44ad;
			            outline: none;
			            box-shadow: 0 0 8px rgba(142, 68, 173, 0.4);
        }

        input[type="submit"] {
			background: linear-gradient(135deg, #8e44ad, #3498db);
			            color: #fff;
			            border: none;
			            padding: 12px;
			            width: 100%;
			            margin-top: 20px;
			            border-radius: 8px;
			            font-size: 16px;
			            cursor: pointer;
			            transition: 0.3s;
        }

        input[type="submit"]:hover {
			background: linear-gradient(135deg, #9b59b6, #2980b9);
			            transform: scale(1.03);
        }

        .message {
            margin-top: 15px;
            color: green;
            text-align: center;
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
		.back-link {
		            display: block;
		            text-align: center;
		            margin-top: 15px;
		            text-decoration: none;
		            color: #8e44ad;
		            font-weight: bold;
		            transition: color 0.3s ease;
		        }

		        .back-link:hover {
		            color: #3498db;
		        }
    </style>
</head>
<body>
    <div class="expense-form-container">
        <h2>Update Expense</h2>
        <form action="/updateexpense" method="post">
            <label for="expenseId">Expense Id:</label>
            <input type="text" id="expenseId" name="eid" readonly value="${exp.eid}" required />

            <label for="expenseName">Expense Name:</label>
            <input type="text" id="expenseName" name="name" value="${exp.name}" required />

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" step="0.01" value="${exp.amount}" required />

            <label for="description">Description:</label>
            <input type="text" id="description" name="description" value="${exp.description}" required />

            <input type="submit" value="Update Expense" />
        </form>
		<a href="home" class="back-link">⬅ Back to Home</a>
        <div class="message" id="message"></div>
    </div>
</body>
</html>
