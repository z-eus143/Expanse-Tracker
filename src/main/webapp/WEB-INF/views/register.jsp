<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
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

        .register-container {
            background: #ffffff;
            padding: 40px 45px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            width: 380px;
            animation: fadeIn 0.7s ease-in-out;
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2575fc;
            font-size: 28px;
        }

        label {
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"], 
        input[type="email"], 
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border 0.3s, box-shadow 0.3s;
        }

        input:focus {
            border-color: #2193b0;
            box-shadow: 0 0 6px rgba(33, 147, 176, 0.4);
            outline: none;
        }

        button {
            width: 100%;
            background: linear-gradient(135deg, #ff6a00, #ee0979);
            color: white;
            padding: 12px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s, transform 0.2s;
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
            margin-top: 18px;
            font-size: 14px;
        }

        .switch-link a {
            color: #2575fc;
            text-decoration: none;
            font-weight: bold;
        }

        .switch-link a:hover {
            text-decoration: underline;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="register-container">
    <h2>Create Account</h2>

    <form action="register" method="post">
        <label for="fullname">Full Name</label>
        <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>

        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Choose a username" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>

        <button type="submit">Register</button>
    </form>		
	<!-- Success message -->
	    <div class="message">${succmsg}</div>
	    <!-- Error message -->
	    <div class="error">${errmsg}</div>
    <div class="switch-link">
        Already have an account? <a href="login">Login here</a>
    </div>
</div>

</body>
</html>
