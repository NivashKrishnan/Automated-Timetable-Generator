<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration Successful | Automated Timetable Scheduler</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/erp-style.css" rel="stylesheet">
</head>
<body style="background-image: url('img/lib.jpg'); background-attachment: fixed; background-size: cover; background-position: center; min-height: 100vh;">
    <div style="background: rgba(15, 23, 42, 0.55); min-height: 100vh; display:flex; align-items:center; justify-content:center; padding: 20px;">
        <div style="background: rgba(255, 255, 255, 0.98); border-radius: 16px; padding: 40px 36px; max-width: 500px; width: 100%; box-shadow: 0 20px 40px rgba(0,0,0,0.3); text-align: center;">
            <div style="width: 60px; height: 60px; border-radius: 50%; background: #d1fae5; color: #10b981; display: flex; align-items: center; justify-content: center; font-size: 26px; margin: 0 auto 16px;">
                <i class="fa fa-check-circle"></i>
            </div>
            <h2 style="font-size: 22px; font-weight: 800; color: #0f172a; margin: 0 0 8px;">Registration Complete</h2>
            <p style="font-size: 13.5px; color: #64748b; margin: 0 0 24px;">Your user account has been registered with encrypted credentials. Please sign in to your role portal.</p>
            
            <div style="display: flex; flex-direction: column; gap: 10px;">
                <a href="admin-login.jsp" class="erp-btn erp-btn-primary" style="justify-content: center; padding: 11px;">
                    <i class="fa fa-cogs"></i> Proceed to Admin Login
                </a>
                <a href="faculty-login.jsp" class="erp-btn erp-btn-primary" style="justify-content: center; padding: 11px; background: #0284c7; border-color: #0369a1;">
                    <i class="fa fa-user-circle"></i> Proceed to Faculty Login
                </a>
                <a href="student-login.jsp" class="erp-btn erp-btn-success" style="justify-content: center; padding: 11px; background: #059669; border-color: #047857; color: #fff;">
                    <i class="fa fa-graduation-cap"></i> Proceed to Student Login
                </a>
            </div>
        </div>
    </div>
</body>
</html>