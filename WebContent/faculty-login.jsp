<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="front.CollegeDao, java.util.*" %>
<%
    List<Map<String, String>> depts = CollegeDao.getDepartments();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Faculty Login | Automated Timetable Scheduler</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/erp-style.css" rel="stylesheet">
    <style>
        .auth-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            padding: 34px 30px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
            border: 1px solid rgba(255, 255, 255, 0.8);
            margin-bottom: 30px;
        }
        .role-portal-pill {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
            background: #eff6ff;
            color: #0284c7;
            border: 1px solid #bae6fd;
            margin-bottom: 14px;
        }
    </style>
</head>
<body style="background-image: url('img/lib.jpg'); background-attachment: fixed; background-size: cover; background-position: center; min-height: 100vh;">
    <div style="background: rgba(15, 23, 42, 0.55); min-height: 100vh; padding-bottom: 60px;">
        <!-- Top Navbar -->
        <nav class="navbar navbar-default" style="background: rgba(15, 23, 42, 0.95); border: none; border-bottom: 1px solid rgba(255,255,255,0.1); border-radius: 0; padding: 10px 0;">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp" style="color: #fff; font-weight: 700; display: flex; align-items: center; gap: 10px;">
                        <i class="fa fa-calendar-check-o text-primary" style="font-size: 22px;"></i> Automated Timetable Scheduler
                    </a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.jsp" style="color: #cbd5e1;"><i class="fa fa-home"></i> Home</a></li>
                    <li><a href="admin-login.jsp" style="color: #cbd5e1;"><i class="fa fa-cogs"></i> Admin Portal</a></li>
                    <li><a href="student-login.jsp" style="color: #6ee7b7;"><i class="fa fa-graduation-cap"></i> Student Portal</a></li>
                    <li><a href="how-to-use.jsp" style="color: #cbd5e1;"><i class="fa fa-book"></i> Help Guide</a></li>
                </ul>
            </div>
        </nav>

        <div class="container" style="margin-top: 40px;">
            <div class="row">
                <!-- Login Box -->
                <div class="col-md-5">
                    <div class="auth-card">
                        <div class="role-portal-pill">
                            <i class="fa fa-user-circle"></i> Faculty & Instructor Portal
                        </div>
                        <div style="margin-bottom: 20px;">
                            <h2 style="font-size: 24px; font-weight: 800; color: #0f172a; margin: 0;">Faculty Sign In</h2>
                            <p style="font-size: 13px; color: #64748b; margin-top: 4px;">Sign in to view your teaching timetable, assigned batches, and room allocations</p>
                        </div>

                        <%
                            String err = request.getParameter("error");
                            if ("unauthorized".equals(err)) {
                        %>
                        <div class="alert alert-warning" style="font-size: 12.5px; padding: 10px 14px; border-radius: 8px;">
                            <i class="fa fa-exclamation-triangle"></i> Faculty credentials required for access. Please sign in below.
                        </div>
                        <% } %>

                        <form role="form" action="main" method="post">
                            <input type="hidden" name="loginRole" value="FACULTY">

                            <div class="erp-form-group">
                                <label class="erp-label" for="un"><i class="fa fa-user text-primary"></i> Faculty Username or Email</label>
                                <input type="text" class="erp-input" id="un" name="username" value="faculty" placeholder="e.g. faculty or on.singh@college.edu" required autocomplete="username">
                            </div>
                            <div class="erp-form-group">
                                <label class="erp-label" for="pwd"><i class="fa fa-lock text-primary"></i> Password</label>
                                <input type="password" class="erp-input" id="pwd" name="password" value="faculty123" placeholder="Enter password" required autocomplete="current-password">
                            </div>

                            <div style="margin-bottom: 18px; display: flex; align-items: center; justify-content: space-between;">
                                <label style="font-weight: 500; font-size: 13px; margin: 0; cursor: pointer; color: #475569;">
                                    <input type="checkbox" checked style="margin-right: 6px;"> Remember session
                                </label>
                                <span style="font-size: 12px; color: #0284c7;">Default: faculty / faculty123</span>
                            </div>

                            <button type="submit" class="erp-btn erp-btn-primary" style="width: 100%; padding: 12px; font-size: 14.5px; justify-content: center;">
                                <i class="fa fa-sign-in"></i> Sign In to Faculty Schedule
                            </button>
                        </form>

                        <div style="margin-top: 22px; padding-top: 18px; border-top: 1px solid #e2e8f0; display: flex; justify-content: space-between; font-size: 12.5px;">
                            <a href="admin-login.jsp" style="color: #1e3a8a; font-weight: 600;"><i class="fa fa-cogs"></i> Admin Portal</a>
                            <a href="student-login.jsp" style="color: #059669; font-weight: 600;"><i class="fa fa-graduation-cap"></i> Student Portal</a>
                        </div>
                    </div>
                </div>

                <!-- Registration / Information Box -->
                <div class="col-md-7">
                    <div class="auth-card">
                        <div style="margin-bottom: 20px;">
                            <span class="badge-pill badge-theory" style="margin-bottom: 8px;">
                                <i class="fa fa-id-badge"></i> Faculty Registration
                            </span>
                            <h2 style="font-size: 24px; font-weight: 800; color: #0f172a; margin: 6px 0 4px;">Register as Faculty Member</h2>
                            <p style="font-size: 13px; color: #64748b; margin: 0;">Create an instructor profile to sync teaching schedules and subject loads</p>
                        </div>

                        <form role="form" action="register" method="post">
                            <input type="hidden" name="role" value="FACULTY">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_un">Faculty Username <span class="req">*</span></label>
                                        <input type="text" class="erp-input" id="reg_un" name="username" placeholder="e.g. prof_sharma" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="email">Institutional Email <span class="req">*</span></label>
                                        <input type="email" class="erp-input" id="email" name="email" placeholder="e.g. sharma@college.edu" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_pwd">Secure Password <span class="req">*</span></label>
                                        <input type="password" class="erp-input" id="reg_pwd" name="password" placeholder="Min 6 characters" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_fullname">Full Name <span class="req">*</span></label>
                                        <input type="text" class="erp-input" id="reg_fullname" name="fullName" placeholder="e.g. Prof. R.K. Sharma" required>
                                    </div>
                                </div>
                            </div>

                            <div class="erp-form-group">
                                <label class="erp-label" for="reg_dept">Academic Department</label>
                                <select class="erp-input" id="reg_dept" name="department">
                                    <% for (Map<String, String> d : depts) { %>
                                        <option value="<%= d.get("dept_name") %>"><%= d.get("dept_name") %> (<%= d.get("dept_code") %>)</option>
                                    <% } %>
                                </select>
                            </div>

                            <button type="submit" class="erp-btn erp-btn-success" style="padding: 11px 24px;">
                                <i class="fa fa-user-plus"></i> Register Faculty Account
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
