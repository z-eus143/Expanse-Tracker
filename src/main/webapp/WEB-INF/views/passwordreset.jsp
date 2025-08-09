<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
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

    .container {
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

    .container h2 {
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

    input[type="text"], input[type="password"], input[type="email"] {
        width: 100%;
        padding: 12px 15px;
        margin: 10px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-sizing: border-box;
        transition: all 0.3s ease;
    }

    input:focus {
        border-color: #2575fc;
        box-shadow: 0 0 5px rgba(37, 117, 252, 0.5);
        outline: none;
    }

    .otp-container {
        display: flex;
        justify-content: space-between;
        gap: 8px;
    }

    .otp-container input {
        width: 60px;
        text-align: center;
        font-size: 18px;
        font-weight: bold;
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

<div class="container">
    <h2>Reset Password</h2>
    
    <form action="resetpassword" method="post">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>

        <label>Enter OTP</label>
        <div class="otp-container">
            <input type="text" name="otp1" maxlength="1" required>
            <input type="text" name="otp2" maxlength="1" required>
            <input type="text" name="otp3" maxlength="1" required>
            <input type="text" name="otp4" maxlength="1" required>
			<input type="text" name="otp3" maxlength="1" required> 
        </div>

        <button type="submit">Reset Password</button>
    </form>

    <a href="login" class="back-link">⬅ Back to Login</a>
</div>

</body>
</html>
