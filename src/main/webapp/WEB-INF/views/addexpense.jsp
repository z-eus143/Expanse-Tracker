<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Expense</title>
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

        .form-container {
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

        input {
			width: 100%;
			padding: 12px 15px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
			transition: all 0.3s ease;
        }

        input:focus {
            border-color: #8e44ad;
            outline: none;
            box-shadow: 0 0 8px rgba(142, 68, 173, 0.4);
        }

        button {
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

        button:hover {
            background: linear-gradient(135deg, #9b59b6, #2980b9);
            transform: scale(1.03);
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

        @keyframes slideUp {
            from {
                transform: translateY(30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Expense</h2>
    <form action="addexpense" method="post">
        <label for="name">Expense Name</label>
        <input type="text" id="name" name="name" placeholder="Enter expense name" required>
		
		<label for="description">Description </label>
        <input type="textarea" id="description" name="description" placeholder="Description" required>

        <label for="amount">Amount (₹)</label>
        <input type="number" id="amount" name="amount" placeholder="Enter amount" required>

        <button type="submit">Add Expense</button>
    </form>
    <a href="home" class="back-link">⬅ Back to Home</a>
</div>

</body>
</html>
