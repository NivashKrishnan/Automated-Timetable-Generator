<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Authentication Failed | CampusSchedule ERP</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/erp-style.css" rel="stylesheet">
</head>
<body style="background-image: url('img/lib.jpg'); background-attachment: fixed; background-size: cover; background-position: center; min-height: 100vh;">
    <div style="background: rgba(15, 23, 42, 0.4); min-height: 100vh; display:flex; align-items:center; justify-content:center; padding: 20px;">
        <div style="background: rgba(255, 255, 255, 0.96); backdrop-filter: blur(16px); border-radius: 16px; padding: 40px 36px; max-width: 480px; width: 100%; box-shadow: 0 20px 40px rgba(0,0,0,0.3); text-align: center;">
            <div style="width: 60px; height: 60px; border-radius: 50%; background: #fee2e2; color: #ef4444; display: flex; align-items: center; justify-content: center; font-size: 26px; margin: 0 auto 16px;">
                <i class="fa fa-times-circle"></i>
            </div>
            <h2 style="font-size: 22px; font-weight: 800; color: #0f172a; margin: 0 0 8px;">Invalid Credentials</h2>
            <p style="font-size: 13.5px; color: #64748b; margin: 0 0 24px;">The username or password you entered did not match our database records. Please try again.</p>
            
            <form role="form" action="main" method="post" style="text-align: left; margin-bottom: 20px;">
                <div class="erp-form-group">
                    <label class="erp-label" for="un">Username</label>
                    <input type="text" class="erp-input" id="un" name="username" value="pranav" required>
                </div>
                <div class="erp-form-group">
                    <label class="erp-label" for="pwd">Password</label>
                    <input type="password" class="erp-input" id="pwd" name="password" value="khurana" required>
                </div>
                <button type="submit" class="erp-btn erp-btn-primary" style="width: 100%; padding: 11px;">
                    <i class="fa fa-sign-in"></i> Try Again
                </button>
            </form>
            <a href="login.jsp" style="font-size: 13px; color: #0284c7; text-decoration: none;"><i class="fa fa-arrow-left"></i> Back to Login & Signup</a>
        </div>
    </div>
</body>
</html>