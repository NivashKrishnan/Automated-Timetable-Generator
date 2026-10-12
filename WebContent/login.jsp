<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login | CampusSchedule ERP</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/erp-style.css" rel="stylesheet">
    <style>
        .auth-card {
            background: rgba(255, 255, 255, 0.96);
            backdrop-filter: blur(16px);
            border-radius: 16px;
            padding: 34px 30px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
            border: 1px solid rgba(255, 255, 255, 0.7);
            margin-bottom: 30px;
        }
    </style>
</head>
<body style="background-image: url('img/lib.jpg'); background-attachment: fixed; background-size: cover; background-position: center; min-height: 100vh;">
    <div style="background: rgba(15, 23, 42, 0.4); min-height: 100vh; padding-bottom: 60px;">
        <!-- Top Navbar -->
        <nav class="navbar navbar-default" style="background: rgba(15, 23, 42, 0.92); backdrop-filter: blur(10px); border: none; border-bottom: 1px solid rgba(255,255,255,0.1); border-radius: 0; padding: 10px 0;">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="dashboard.jsp" style="color: #fff; font-weight: 700; display: flex; align-items: center; gap: 10px;">
                        <i class="fa fa-graduation-cap text-primary" style="font-size: 22px;"></i> CampusSchedule ERP
                    </a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="how-to-use.jsp" style="color: #cbd5e1;"><i class="fa fa-book"></i> User Guide</a></li>
                    <li><a href="dashboard.jsp" style="color: #38bdf8; font-weight: 600;"><i class="fa fa-dashboard"></i> Direct Dashboard</a></li>
                </ul>
            </div>
        </nav>

        <div class="container" style="margin-top: 40px;">
            <div class="row">
                <!-- Login Box -->
                <div class="col-md-5">
                    <div class="auth-card">
                        <div style="margin-bottom: 22px;">
                            <h2 style="font-size: 22px; font-weight: 800; color: #0f172a; margin: 0;">Sign In</h2>
                            <p style="font-size: 13px; color: #64748b; margin-top: 4px;">Enter administrative credentials to manage schedules</p>
                        </div>
                        
                        <form role="form" action="main" method="post">
                            <div class="erp-form-group">
                                <label class="erp-label" for="un"><i class="fa fa-user text-primary"></i> Username</label>
                                <input type="text" class="erp-input" id="un" name="username" value="pranav" required>
                            </div>
                            <div class="erp-form-group">
                                <label class="erp-label" for="pwd"><i class="fa fa-lock text-primary"></i> Password</label>
                                <input type="password" class="erp-input" id="pwd" name="password" value="khurana" required>
                            </div>
                            <div style="margin-bottom: 18px; display: flex; align-items: center; justify-content: space-between;">
                                <label style="font-weight: 500; font-size: 13px; margin: 0; cursor: pointer;">
                                    <input type="checkbox" checked style="margin-right: 6px;"> Remember me
                                </label>
                                <span style="font-size: 12px; color: #0284c7;">Default: pranav / khurana</span>
                            </div>
                            <button type="submit" class="erp-btn erp-btn-primary" style="width: 100%; padding: 12px; font-size: 14.5px;">
                                <i class="fa fa-sign-in"></i> Sign In to Dashboard
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Registration / Signup Box -->
                <div class="col-md-7">
                    <div class="auth-card">
                        <div style="margin-bottom: 22px;">
                            <h2 style="font-size: 22px; font-weight: 800; color: #0f172a; margin: 0;">Register New Administrator</h2>
                            <p style="font-size: 13px; color: #64748b; margin-top: 4px;">Create faculty or department coordinator access account</p>
                        </div>

                        <form role="form" action="register" method="post">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_un">Desired Username <span class="req">*</span></label>
                                        <input type="text" class="erp-input" id="reg_un" name="username" placeholder="e.g. jsmith" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="email">Email Address <span class="req">*</span></label>
                                        <input type="email" class="erp-input" id="email" name="email" placeholder="e.g. jsmith@college.edu" required>
                                    </div>
                                </div>
                            </div>

                            <div class="erp-form-group">
                                <label class="erp-label" for="country">Country / Institution Location</label>
                                <input type="text" class="erp-input" id="country" name="country" placeholder="e.g. India, United States" required>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_pwd">Password <span class="req">*</span></label>
                                        <input type="password" class="erp-input" id="reg_pwd" name="password" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="confirm">Confirm Password <span class="req">*</span></label>
                                        <input type="password" class="erp-input" id="confirm" name="confirm" required>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="erp-btn erp-btn-success" style="padding: 11px 26px;">
                                <i class="fa fa-user-plus"></i> Create Account
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>