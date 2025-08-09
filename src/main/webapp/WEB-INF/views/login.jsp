<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Expense Tracker</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background: #ffffff;
            padding: 35px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            width: 360px;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2575fc;
        }

        label {
            font-weight: 600;
            color: #333;
            display: block;
            margin-top: 10px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #2575fc;
            box-shadow: 0 0 5px rgba(37, 117, 252, 0.5);
            outline: none;
        }

        button {
            width: 100%;
            background: linear-gradient(135deg, #ff6a00, #ee0979);
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #ee0979, #ff6a00);
            transform: scale(1.03);
        }

        .message {
            text-align: center;
            margin-top: 15px;
            color: green;
            font-weight: 500;
        }
                
        .error {
            color: red;
            text-align: center;
            font-weight: 500;
        }

        .switch-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .switch-link a {
            color: #2575fc;
            text-decoration: none;
            font-weight: 600;
        }

        .switch-link a:hover {
            text-decoration: underline;
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

<div class="login-container">
    <h2>Login</h2>
    
    <form action="login" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Choose a username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>

        <button type="submit">Login</button>
    </form>

    <!-- Success message -->
    <div class="message">${succmsg}</div>
    <!-- Error message -->
    <div class="error">${errmsg}</div>

    <div class="switch-link">
        Don't have an account? <a href="register">Register here</a>
    </div>
	<div class="switch-link">
	    Forget Password? <a href="passwordreset">Reset Password</a>
	</div>
	<a href="/" class="back-link">⬅ Back to Welcome Page</a>
</div>

</body>
</html>
