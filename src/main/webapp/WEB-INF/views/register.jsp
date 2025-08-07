<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background: #ffffff;
            padding: 35px 45px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.15);
            width: 400px;
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            background-color: #007BFF;
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
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

<div class="register-container">
    <h2>Register</h2>

    <form action="register" method="post">
        <label for="fullname">Full Name</label>
        <input type="text" id="fullname" name="fullname" required>

        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Register</button>
    </form>		
    <div class="switch-link">
        Already have an account? <a href="/">Login here</a>
    </div>
</div>

</body>
</html>
