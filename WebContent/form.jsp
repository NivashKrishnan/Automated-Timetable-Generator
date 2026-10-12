<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control","no-store"); 
    response.setHeader("Pragma","no-cache"); 
    response.setHeader ("Expires", "0");

    request.setAttribute("activePage", "generator");
    request.setAttribute("pageHeading", "Automatic Timetable Generator");
    request.setAttribute("breadcrumb", "Timetable Management / Configuration Studio");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Timetable Configuration | CampusSchedule ERP</title>
    <!-- Fonts & Icons -->
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
                <!-- Top Overview & Demo Action Card -->
                <div class="erp-panel" style="background: linear-gradient(135deg, rgba(255,255,255,0.97), rgba(240,249,255,0.95)); border-left: 5px solid var(--primary); margin-bottom: 22px;">
                    <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:16px;">
                        <div>
                            <h2 class="erp-panel-title" style="font-size:18px;">
                                <i class="fa fa-cogs text-primary"></i> Genetic Algorithm Timetable Synthesizer
                            </h2>
                            <p class="erp-panel-subtitle">
                                Configure daily periods, recess slots, teacher allocations, and student batch loads. The engine will solve hard and soft constraints automatically.
                            </p>
                        </div>
                        <div style="display:flex; gap:10px;">
                            <a href="view-timetable" class="erp-btn erp-btn-success" onclick="showLoading('Processing genetic algorithm for 4 batches (ECE, ECL, CIVIL, META)...');">
                                <i class="fa fa-bolt"></i> Instant Demo (4 Batches Test)
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Main Form Panel -->
                <div class="erp-panel">
                    <form role="form" action="view_timetable" method="post" name="form" id="form" onsubmit="showLoading('Executing chromosome crossover and mutation cycles...');">
                        
                        <!-- SECTION 1: TIMETABLE BOUNDARIES -->
                        <div style="margin-bottom: 28px;">
                            <div style="display:flex; align-items:center; gap:10px; margin-bottom:14px; border-bottom:1.5px solid var(--border-light); padding-bottom:8px;">
                                <div class="erp-stat-icon icon-blue" style="width:32px; height:32px; font-size:14px;">1</div>
                                <h3 style="margin:0; font-size:16px; font-weight:700; color:var(--text-dark);">
                                    Period Schedule & Working Days
                                </h3>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="hours">
                                            <i class="fa fa-clock-o text-primary"></i> Periods / Slots per Day <span class="req">*</span>
                                        </label>
                                        <input type="number" class="erp-input" id="hours" name="hoursperday" placeholder="e.g. 7" min="1" max="10" oninput="sendInfo3()" required>
                                        <div class="erp-helper-text">Number of study periods scheduled daily (e.g. 7).</div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="break">
                                            <i class="fa fa-coffee text-warning"></i> Break / Recess Period Slot
                                        </label>
                                        <input type="number" class="erp-input" id="break" name="breakslot" placeholder="e.g. 3 (leave blank if none)" min="1" max="9">
                                        <div class="erp-helper-text">Inserts break after this period index.</div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="days">
                                            <i class="fa fa-calendar-check-o text-emerald"></i> Working Days per Week <span class="req">*</span>
                                        </label>
                                        <input type="number" class="erp-input" id="days" name="daysperweek" placeholder="e.g. 5" min="1" max="7" oninput="sendInfo5()" required>
                                        <div class="erp-helper-text">Number of active teaching days (e.g. 5 for Mon-Fri).</div>
                                    </div>
                                </div>
                            </div>

                            <div id="3"></div>
                            <div id="5" style="margin-top:10px;"></div>
                        </div>

                        <!-- SECTION 2: FACULTY ALLOCATIONS -->
                        <div style="margin-bottom: 28px;">
                            <div style="display:flex; align-items:center; gap:10px; margin-bottom:14px; border-bottom:1.5px solid var(--border-light); padding-bottom:8px;">
                                <div class="erp-stat-icon icon-amber" style="width:32px; height:32px; font-size:14px;">2</div>
                                <h3 style="margin:0; font-size:16px; font-weight:700; color:var(--text-dark);">
                                    Faculty Members & Teaching Load
                                </h3>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="noteachers">
                                            <i class="fa fa-users text-primary"></i> Number of Faculty Members <span class="req">*</span>
                                        </label>
                                        <input type="number" class="erp-input" id="noteachers" name="noteacher" placeholder="e.g. 9" min="1" max="50" oninput="sendInfo()" required>
                                        <div class="erp-helper-text">Entering a count automatically expands instructor entry cards.</div>
                                    </div>
                                </div>
                            </div>

                            <div id="1"></div>
                        </div>

                        <!-- SECTION 3: STUDENT GROUPS & BATCHES -->
                        <div style="margin-bottom: 24px;">
                            <div style="display:flex; align-items:center; gap:10px; margin-bottom:14px; border-bottom:1.5px solid var(--border-light); padding-bottom:8px;">
                                <div class="erp-stat-icon icon-purple" style="width:32px; height:32px; font-size:14px;">3</div>
                                <h3 style="margin:0; font-size:16px; font-weight:700; color:var(--text-dark);">
                                    Student Groups, Batches & Curriculum Requirements
                                </h3>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="erp-form-group">
                                        <label class="erp-label" for="nostgrp">
                                            <i class="fa fa-graduation-cap text-purple"></i> Number of Class Batches / Sections <span class="req">*</span>
                                        </label>
                                        <input type="number" class="erp-input" id="nostgrp" name="nostudentgroup" placeholder="e.g. 4" min="1" max="20" oninput="sendInfo2()" required>
                                        <div class="erp-helper-text">Generates individual weekly timetables for each batch.</div>
                                    </div>
                                </div>
                            </div>

                            <div id="2"></div>
                            
                            <div style="background:#f0f9ff; border-left:4px solid var(--primary); padding:14px 18px; border-radius:8px; margin-top:16px; font-size:13px; color:#0369a1;">
                                <i class="fa fa-info-circle" style="margin-right:6px;"></i>
                                <strong>Constraint Rules:</strong>
                                Subject names allocated to a batch must match subjects taught by professors. Total weekly hours for any batch must not exceed available weekly hours (Days &times; Periods).
                            </div>
                        </div>

                        <!-- Action Submission Button -->
                        <div style="display:flex; align-items:center; gap:16px; margin-top:28px; padding-top:20px; border-top:1px solid var(--border-light);">
                            <button type="submit" class="erp-btn erp-btn-primary" style="padding: 12px 32px; font-size: 15px;">
                                <i class="fa fa-bolt"></i> Generate Conflict-Free Timetable
                            </button>
                            <a href="view-timetable" class="erp-btn erp-btn-secondary" style="padding: 12px 24px;">
                                <i class="fa fa-file-text-o"></i> Test with Pre-configured Data
                            </a>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </div>

    <!-- Include custom AJAX scripts -->
    <script src="vendor/bootstrap/js/custom.js"></script>
    <jsp:include page="includes/footer.jsp" />
</body>
</html>