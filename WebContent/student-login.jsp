<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="front.CollegeDao, java.util.*" %>
<%
    List<Map<String, String>> depts = CollegeDao.getDepartments();
    List<Map<String, String>> classes = CollegeDao.getClasses();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Login | Automated Timetable Scheduler</title>
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
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
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
                    <li><a href="admin-login.jsp" style="color: #93c5fd;"><i class="fa fa-cogs"></i> Admin Portal</a></li>
                    <li><a href="faculty-login.jsp" style="color: #93c5fd;"><i class="fa fa-user-circle"></i> Faculty Portal</a></li>
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
                            <i class="fa fa-graduation-cap"></i> Student Portal
                        </div>
                        <div style="margin-bottom: 20px;">
                            <h2 style="font-size: 24px; font-weight: 800; color: #0f172a; margin: 0;">Student Sign In</h2>
                            <p style="font-size: 13px; color: #64748b; margin-top: 4px;">Sign in to view your semester timetable, section schedule, and room locations</p>
                        </div>

                        <%
                            String err = request.getParameter("error");
                            if ("unauthorized".equals(err)) {
                        %>
                        <div class="alert alert-warning" style="font-size: 12.5px; padding: 10px 14px; border-radius: 8px;">
                            <i class="fa fa-exclamation-triangle"></i> Student credentials required for access. Please sign in below.
                        </div>
                        <% } %>

                        <form role="form" action="main" method="post">
                            <input type="hidden" name="loginRole" value="STUDENT">

                            <div class="erp-form-group">
                                <label class="erp-label" for="un"><i class="fa fa-user text-primary"></i> Student Username or ID</label>
                                <input type="text" class="erp-input" id="un" name="username" value="student" placeholder="e.g. student or aryan_v" required autocomplete="username">
                            </div>
                            <div class="erp-form-group">
                                <label class="erp-label" for="pwd"><i class="fa fa-lock text-primary"></i> Password</label>
                                <input type="password" class="erp-input" id="pwd" name="password" value="student123" placeholder="Enter password" required autocomplete="current-password">
                            </div>

                            <div style="margin-bottom: 18px; display: flex; align-items: center; justify-content: space-between;">
                                <label style="font-weight: 500; font-size: 13px; margin: 0; cursor: pointer; color: #475569;">
                                    <input type="checkbox" checked style="margin-right: 6px;"> Remember session
                                </label>
                                <span style="font-size: 12px; color: #059669;">Default: student / student123</span>
                            </div>

                            <button type="submit" class="erp-btn erp-btn-success" style="width: 100%; padding: 12px; font-size: 14.5px; justify-content: center; background: #059669; border-color: #047857; color: #fff;">
                                <i class="fa fa-sign-in"></i> Sign In to Student Schedule
                            </button>
                        </form>

                        <div style="margin-top: 22px; padding-top: 18px; border-top: 1px solid #e2e8f0; display: flex; justify-content: space-between; font-size: 12.5px;">
                            <a href="admin-login.jsp" style="color: #1e3a8a; font-weight: 600;"><i class="fa fa-cogs"></i> Admin Portal</a>
                            <a href="faculty-login.jsp" style="color: #0284c7; font-weight: 600;"><i class="fa fa-user-circle"></i> Faculty Portal</a>
                        </div>
                    </div>
                </div>

                <!-- Registration / Information Box -->
                <div class="col-md-7">
                    <div class="auth-card">
                        <div style="margin-bottom: 20px;">
                            <span class="badge-pill badge-lab" style="margin-bottom: 8px;">
                                <i class="fa fa-graduation-cap"></i> Student Enrollment
                            </span>
                            <h2 style="font-size: 24px; font-weight: 800; color: #0f172a; margin: 6px 0 4px;">Register Student Account</h2>
                            <p style="font-size: 13px; color: #64748b; margin: 0;">Create your account to view your section's weekly timetable and lecture alerts</p>
                        </div>

                        <form role="form" action="register" method="post">
                            <input type="hidden" name="role" value="STUDENT">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_un">Student Username <span class="req">*</span></label>
                                        <input type="text" class="erp-input" id="reg_un" name="username" placeholder="e.g. aryan_ece" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_fn">Full Name <span class="req">*</span></label>
                                        <input type="text" class="erp-input" id="reg_fn" name="fullName" placeholder="e.g. Aryan Verma" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_email">Email Address <span class="req">*</span></label>
                                        <input type="email" class="erp-input" id="reg_email" name="email" placeholder="student@college.edu" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_dept">Academic Department <span class="req">*</span></label>
                                        <select class="erp-input" id="reg_dept" name="department" required>
                                            <option value="">-- Select Department --</option>
                                            <% if (depts != null && !depts.isEmpty()) { 
                                                for (Map<String, String> d : depts) { %>
                                                <option value="<%= d.get("name") %>"><%= d.get("name") %></option>
                                            <% }} else { %>
                                                <option value="Electronics & Communication">Electronics & Communication</option>
                                                <option value="Computer Science">Computer Science</option>
                                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_sec">Class / Section Batch <span class="req">*</span></label>
                                        <select class="erp-input" id="reg_sec" name="country" required>
                                            <option value="">-- Select Section --</option>
                                            <% if (classes != null && !classes.isEmpty()) { 
                                                for (Map<String, String> c : classes) { %>
                                                <option value="<%= c.get("name") %>"><%= c.get("name") %></option>
                                            <% }} else { %>
                                                <option value="ECE(Ist-Year)">ECE(Ist-Year)</option>
                                                <option value="CSE(Ist-Year)">CSE(Ist-Year)</option>
                                                <option value="CIVIL(Ist-Year)">CIVIL(Ist-Year)</option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="reg_pwd">Password <span class="req">*</span></label>
                                        <input type="password" class="erp-input" id="reg_pwd" name="password" placeholder="At least 6 characters" required>
                                    </div>
                                </div>
                            </div>

                            <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px 14px; margin-bottom: 18px; font-size: 12.5px; color: #475569;">
                                <i class="fa fa-info-circle text-primary"></i> <strong>Student Notice:</strong> Timetables are generated centrally by the Academic Administration. Once registered, your section schedule will automatically be visible.
                            </div>

                            <button type="submit" class="erp-btn erp-btn-success" style="padding: 10px 24px; background: #059669; border-color: #047857; color: #fff;">
                                <i class="fa fa-user-plus"></i> Complete Student Registration
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
