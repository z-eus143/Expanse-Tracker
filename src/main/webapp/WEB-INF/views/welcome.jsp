<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Expense Tracker</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #3AB0FF, #6A5ACD, #FF7F50);
            background-size: 400% 400%;
            animation: gradientBG 10s ease infinite;
            margin: 0;
            padding: 0;
            color: #fff;
            text-align: center;
        }

        @keyframes gradientBG {
            0% {background-position: 0% 50%;}
            50% {background-position: 100% 50%;}
            100% {background-position: 0% 50%;}
        }

        .container {
            max-width: 1000px;
            margin: 80px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            box-shadow: 0px 8px 25px rgba(0,0,0,0.2);
        }

        h1 {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #FFD93D;
        }

        p {
            font-size: 1.2rem;
            color: #f0f0f0;
            margin-bottom: 30px;
        }

        .features {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card {
            background: rgba(255, 255, 255, 0.2);
            padding: 20px;
            width: 250px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 2px solid rgba(255,255,255,0.3);
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0px 8px 20px rgba(0,0,0,0.3);
        }

        .card h3 {
            color: #FFD93D;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 1rem;
            color: #f5f5f5;
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            background: linear-gradient(45deg, #28a745, #20c997);
            color: white;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn:hover {
            background: linear-gradient(45deg, #20c997, #28a745);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Expense Tracker</h1>
        <p>Track, manage, and optimize your expenses effortlessly. Your financial health starts here.</p>

        <div class="features">
            <div class="card">
                <h3>💰 Track Spending</h3>
                <p>Monitor your daily, weekly, and monthly expenses with detailed reports.</p>
            </div>
            <div class="card">
                <h3>📊 Insights</h3>
                <p>Get colorful graphs and analytics to understand your spending habits.</p>
            </div>
            <div class="card">
                <h3>🛠 Manage Budgets</h3>
                <p>Set limits for categories and never overspend again.</p>
            </div>
        </div>

        <br><br>
        <a href="login" class="btn">Login</a>
        &nbsp;&nbsp;
        <a href="register" class="btn" style="background: linear-gradient(45deg, #ff4b2b, #ff416c);">Register</a>
    </div>
</body>
</html>
