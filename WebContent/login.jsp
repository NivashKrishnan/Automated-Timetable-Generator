<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Select Login Portal | Automated Timetable Scheduler</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/erp-style.css" rel="stylesheet">
    <style>
        .portal-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            padding: 30px 24px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.8);
            transition: all 0.25s ease;
            text-align: center;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .portal-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.28);
        }
        .portal-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            margin: 0 auto 18px;
        }
    </style>
</head>
<body style="background-image: url('img/lib.jpg'); background-attachment: fixed; background-size: cover; background-position: center; min-height: 100vh;">
    <div style="background: rgba(15, 23, 42, 0.65); min-height: 100vh; padding-bottom: 60px;">
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
                    <li><a href="how-to-use.jsp" style="color: #cbd5e1;"><i class="fa fa-book"></i> User Guide</a></li>
                </ul>
            </div>
        </nav>

        <div class="container" style="margin-top: 50px;">
            <div class="text-center" style="margin-bottom: 40px;">
                <h1 style="color: #fff; font-weight: 800; font-size: 32px; margin: 0 0 10px; text-shadow: 0 2px 4px rgba(0,0,0,0.5);">
                    Select Authentication Portal
                </h1>
                <p style="color: #cbd5e1; font-size: 15px; max-width: 650px; margin: 0 auto;">
                    Please select your designated institutional role to access your personalized timetable dashboard and scheduling operations.
                </p>
            </div>

            <div class="row">
                <!-- Admin Portal -->
                <div class="col-md-4" style="margin-bottom: 25px;">
                    <div class="portal-card">
                        <div>
                            <div class="portal-icon" style="background: #eff6ff; color: #1e3a8a; border: 2px solid #bfdbfe;">
                                <i class="fa fa-cogs"></i>
                            </div>
                            <span class="badge-pill badge-active" style="margin-bottom: 10px;">Role: Admin</span>
                            <h3 style="font-size: 21px; font-weight: 800; color: #0f172a; margin: 6px 0 10px;">Administrator</h3>
                            <p style="font-size: 13px; color: #64748b; line-height: 1.5; margin-bottom: 20px;">
                                Configure academic departments, instructors, classrooms, and execute the Genetic Algorithm timetable engine.
                            </p>
                        </div>
                        <div>
                            <a href="admin-login.jsp" class="erp-btn erp-btn-primary" style="width: 100%; justify-content: center; padding: 12px; font-size: 14.5px;">
                                <i class="fa fa-sign-in"></i> Admin Login &rarr;
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Faculty Portal -->
                <div class="col-md-4" style="margin-bottom: 25px;">
                    <div class="portal-card">
                        <div>
                            <div class="portal-icon" style="background: #e0f2fe; color: #0369a1; border: 2px solid #bae6fd;">
                                <i class="fa fa-user-circle"></i>
                            </div>
                            <span class="badge-pill badge-theory" style="margin-bottom: 10px;">Role: Faculty</span>
                            <h3 style="font-size: 21px; font-weight: 800; color: #0f172a; margin: 6px 0 10px;">Faculty & Instructor</h3>
                            <p style="font-size: 13px; color: #64748b; line-height: 1.5; margin-bottom: 20px;">
                                View personal weekly teaching timetable, assigned batches, classroom locations, and weekly teaching workload.
                            </p>
                        </div>
                        <div>
                            <a href="faculty-login.jsp" class="erp-btn erp-btn-primary" style="width: 100%; justify-content: center; padding: 12px; font-size: 14.5px; background: #0284c7; border-color: #0369a1;">
                                <i class="fa fa-sign-in"></i> Faculty Login &rarr;
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Student Portal -->
                <div class="col-md-4" style="margin-bottom: 25px;">
                    <div class="portal-card">
                        <div>
                            <div class="portal-icon" style="background: #ecfdf5; color: #047857; border: 2px solid #a7f3d0;">
                                <i class="fa fa-graduation-cap"></i>
                            </div>
                            <span class="badge-pill badge-lab" style="margin-bottom: 10px;">Role: Student</span>
                            <h3 style="font-size: 21px; font-weight: 800; color: #0f172a; margin: 6px 0 10px;">Student</h3>
                            <p style="font-size: 13px; color: #64748b; line-height: 1.5; margin-bottom: 20px;">
                                Check your batch's section timetable, assigned faculty, classroom/lab rooms, and download schedule PDFs.
                            </p>
                        </div>
                        <div>
                            <a href="student-login.jsp" class="erp-btn erp-btn-success" style="width: 100%; justify-content: center; padding: 12px; font-size: 14.5px; background: #059669; border-color: #047857; color: #fff;">
                                <i class="fa fa-sign-in"></i> Student Login &rarr;
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div style="text-align: center; margin-top: 30px;">
                <a href="index.jsp" style="color: #cbd5e1; font-size: 13.5px;"><i class="fa fa-arrow-left"></i> Return to Main Homepage</a>
            </div>
        </div>
    </div>
</body>
</html>