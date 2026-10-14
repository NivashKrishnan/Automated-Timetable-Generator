<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Authentication Failed | Automated Timetable Scheduler</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/erp-style.css" rel="stylesheet">
</head>
<body style="background-image: url('img/lib.jpg'); background-attachment: fixed; background-size: cover; background-position: center; min-height: 100vh;">
    <div style="background: rgba(15, 23, 42, 0.55); min-height: 100vh; display:flex; align-items:center; justify-content:center; padding: 20px;">
        <div style="background: rgba(255, 255, 255, 0.98); border-radius: 16px; padding: 36px 32px; max-width: 500px; width: 100%; box-shadow: 0 20px 40px rgba(0,0,0,0.3); text-align: center;">
            <div style="width: 60px; height: 60px; border-radius: 50%; background: #fee2e2; color: #ef4444; display: flex; align-items: center; justify-content: center; font-size: 26px; margin: 0 auto 16px;">
                <i class="fa fa-exclamation-triangle"></i>
            </div>
            <h2 style="font-size: 22px; font-weight: 800; color: #0f172a; margin: 0 0 8px;">Authentication Failed</h2>
            
            <p style="font-size: 13.5px; color: #64748b; margin: 0 0 20px;">
                The credentials entered were invalid or do not match the selected portal role.
            </p>

            <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; padding: 14px; margin-bottom: 24px; text-align: left; font-size: 13px;">
                <div style="font-weight: 700; color: #0f172a; margin-bottom: 6px;"><i class="fa fa-info-circle text-primary"></i> Default Credentials:</div>
                <div style="color: #475569; margin-bottom: 3px;">• <strong>Admin:</strong> <code>admin</code> / <code>admin123</code></div>
                <div style="color: #475569; margin-bottom: 3px;">• <strong>Faculty:</strong> <code>faculty</code> / <code>faculty123</code></div>
                <div style="color: #475569;">• <strong>Student:</strong> <code>student</code> / <code>student123</code></div>
            </div>

            <div style="display: flex; flex-direction: column; gap: 10px;">
                <a href="admin-login.jsp" class="erp-btn erp-btn-primary" style="justify-content: center; padding: 10px; font-size: 13.5px;">
                    <i class="fa fa-cogs"></i> Go to Admin Login
                </a>
                <a href="faculty-login.jsp" class="erp-btn erp-btn-primary" style="justify-content: center; padding: 10px; font-size: 13.5px; background: #0284c7; border-color: #0369a1;">
                    <i class="fa fa-user-circle"></i> Go to Faculty Login
                </a>
                <a href="student-login.jsp" class="erp-btn erp-btn-success" style="justify-content: center; padding: 10px; font-size: 13.5px; background: #059669; border-color: #047857; color: #fff;">
                    <i class="fa fa-graduation-cap"></i> Go to Student Login
                </a>
            </div>

            <div style="margin-top: 20px; padding-top: 16px; border-top: 1px solid #e2e8f0;">
                <a href="index.jsp" style="font-size: 13px; color: #64748b; text-decoration: none;"><i class="fa fa-home"></i> Back to Homepage</a>
            </div>
        </div>
    </div>
</body>
</html>