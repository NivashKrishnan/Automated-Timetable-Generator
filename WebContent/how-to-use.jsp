<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("activePage", "how-to-use");
    request.setAttribute("pageHeading", "System User Guide & Documentation");
    request.setAttribute("breadcrumb", "Documentation / How to Use");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>How to Use | CampusSchedule ERP</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/erp-style.css" rel="stylesheet">
</head>
<body class="erp-body">
    <div class="erp-backdrop-overlay"></div>
    <div class="erp-wrapper">
        <jsp:include page="includes/sidebar.jsp" />

        <div class="erp-main">
            <jsp:include page="includes/header.jsp" />

            <main class="erp-content">
                <div class="erp-panel">
                    <div class="erp-panel-header">
                        <div>
                            <h2 class="erp-panel-title"><i class="fa fa-book"></i> Automated Timetable Scheduler - Operational Guide</h2>
                            <p class="erp-panel-subtitle">Comprehensive step-by-step instructions for scheduling academic terms</p>
                        </div>
                        <a href="form.jsp" class="erp-btn erp-btn-primary">
                            <i class="fa fa-sliders"></i> Go to Generator Form
                        </a>
                    </div>

                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-6">
                            <div style="background: #f8fafc; border-radius: var(--radius-md); padding: 22px; border: 1px solid var(--border-light); margin-bottom: 20px;">
                                <div style="display:flex; align-items:center; gap:12px; margin-bottom:12px;">
                                    <div class="erp-stat-icon icon-blue" style="width:38px; height:38px; font-size:16px;">1</div>
                                    <h4 style="margin:0; font-size:16px; font-weight:700; color:var(--text-dark);">Configure Schedule Boundaries</h4>
                                </div>
                                <p style="font-size:13px; color:var(--text-body); line-height:1.6;">
                                    Specify working days per week (typically 5: Monday through Friday) and periods per day (typically 7). If your college has a scheduled lunch or recess, enter the period number after which the break occurs.
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div style="background: #f8fafc; border-radius: var(--radius-md); padding: 22px; border: 1px solid var(--border-light); margin-bottom: 20px;">
                                <div style="display:flex; align-items:center; gap:12px; margin-bottom:12px;">
                                    <div class="erp-stat-icon icon-emerald" style="width:38px; height:38px; font-size:16px;">2</div>
                                    <h4 style="margin:0; font-size:16px; font-weight:700; color:var(--text-dark);">Input Faculty & Subject Pairings</h4>
                                </div>
                                <p style="font-size:13px; color:var(--text-body); line-height:1.6;">
                                    Enter the total number of teachers. For each professor, provide their name and the exact subject code they instruct (e.g. <code>AP-1101</code>, <code>ME-1111</code>). The scheduler uses prior load metrics to distribute teaching evenly.
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div style="background: #f8fafc; border-radius: var(--radius-md); padding: 22px; border: 1px solid var(--border-light); margin-bottom: 20px;">
                                <div style="display:flex; align-items:center; gap:12px; margin-bottom:12px;">
                                    <div class="erp-stat-icon icon-amber" style="width:38px; height:38px; font-size:16px;">3</div>
                                    <h4 style="margin:0; font-size:16px; font-weight:700; color:var(--text-dark);">Define Batches & Weekly Hours</h4>
                                </div>
                                <p style="font-size:13px; color:var(--text-body); line-height:1.6;">
                                    Set the number of student groups (e.g. <code>ECE(Ist-Year)</code>). For each batch, specify the subjects and the required weekly hours. <em>Important:</em> Total weekly hours for any batch must not exceed the available slots (<code>Days &times; Periods</code>).
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div style="background: #f8fafc; border-radius: var(--radius-md); padding: 22px; border: 1px solid var(--border-light); margin-bottom: 20px;">
                                <div style="display:flex; align-items:center; gap:12px; margin-bottom:12px;">
                                    <div class="erp-stat-icon icon-purple" style="width:38px; height:38px; font-size:16px;">4</div>
                                    <h4 style="margin:0; font-size:16px; font-weight:700; color:var(--text-dark);">Genetic Algorithm Optimization</h4>
                                </div>
                                <p style="font-size:13px; color:var(--text-body); line-height:1.6;">
                                    Click <strong>Generate Timetable</strong>. The backend initiates chromosome population synthesis, mutation, and crossover cycles to achieve 100% fitness where no professor or batch is double-booked.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>