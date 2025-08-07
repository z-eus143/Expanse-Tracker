<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0 20px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
		
		.message {
		    text-align: center;
		    margin-top: 15px;
		    color: green;
		}
				
        .error {
            color: red;
            text-align: center;
        }

        .switch-link {
            text-align: center;
            margin-top: 15px;
        }

        .switch-link a {
            color: #007BFF;
            text-decoration: none;
        }

        .switch-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Login</h2>
    
    <form action="login" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Login</button>
    </form>

			<!-- Success message -->
		        <div class="message">${succmsg}</div>
		    <!-- Error message -->
		        <div class="error">${errmsg}</div>

    <div class="switch-link">
        Don't have an account? <a href="register">Register here</a>
    </div>
</div>

</body>
</html>
