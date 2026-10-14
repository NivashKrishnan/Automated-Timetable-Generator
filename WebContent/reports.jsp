<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, front.CollegeDao, front.UserDao" %>
<%
    String currentRole = (String) session.getAttribute("role");
    if (currentRole == null) currentRole = "ADMIN";

    request.setAttribute("activePage", "reports");
    request.setAttribute("pageHeading", "Academic Reports & User Management");
    request.setAttribute("breadcrumb", "Administration / Reports & Accounts");

    List<Map<String, String>> facultyList = CollegeDao.getFacultyList();
    List<Map<String, String>> subjects = CollegeDao.getSubjectsList();
    List<Map<String, String>> rooms = CollegeDao.getClassroomsList();
    List<Map<String, String>> userList = UserDao.getAllUsers();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Reports & User Accounts | Automated Timetable Scheduler</title>
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
                <!-- Action Controls for Print/Export -->
                <div class="erp-panel btn-no-print" style="margin-bottom: 20px;">
                    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 12px;">
                        <div>
                            <h2 class="erp-panel-title"><i class="fa fa-print"></i> Official Schedule Reports & Accounts</h2>
                            <p class="erp-panel-subtitle">Exportable faculty workloads, course distributions, facility capacities, and login accounts</p>
                        </div>
                        <div style="display: flex; gap: 10px;">
                            <button type="button" class="erp-btn erp-btn-secondary" onclick="window.print()">
                                <i class="fa fa-print"></i> Print Report Sheet
                            </button>
                            <a href="view-timetable" class="erp-btn erp-btn-primary">
                                <i class="fa fa-calendar"></i> View Generated Timetables
                            </a>
                        </div>
                    </div>
                </div>

                <% if ("ADMIN".equalsIgnoreCase(currentRole)) { %>
                <!-- Section: User Account & Role Management (Admin Only) -->
                <div class="erp-panel" style="border-left: 5px solid #0284c7;">
                    <div class="erp-panel-header">
                        <div>
                            <h2 class="erp-panel-title"><i class="fa fa-users"></i> Role-Based User Accounts (Admin, Faculty, Student)</h2>
                            <p class="erp-panel-subtitle">Manage registered accounts and portal access permissions</p>
                        </div>
                        <span class="badge-pill badge-active"><%= userList != null ? userList.size() : 0 %> Active Accounts</span>
                    </div>
                    <div class="erp-table-responsive">
                        <table class="erp-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>Full Name</th>
                                    <th>Role Portal</th>
                                    <th>Department</th>
                                    <th>Email</th>
                                    <th style="text-align: right;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (userList != null && !userList.isEmpty()) { 
                                    for(Map<String, String> u : userList) { 
                                        String role = u.get("role") != null ? u.get("role") : "STUDENT";
                                        String badgeClass = "badge-theory";
                                        if ("ADMIN".equalsIgnoreCase(role)) badgeClass = "badge-active";
                                        else if ("FACULTY".equalsIgnoreCase(role)) badgeClass = "badge-theory";
                                        else if ("STUDENT".equalsIgnoreCase(role)) badgeClass = "badge-lab";
                                %>
                                <tr>
                                    <td>#<%= u.get("id") %></td>
                                    <td><strong><%= u.get("username") %></strong></td>
                                    <td><%= u.get("full_name") != null ? u.get("full_name") : u.get("username") %></td>
                                    <td><span class="badge-pill <%= badgeClass %>"><%= role %></span></td>
                                    <td><%= u.get("department") %></td>
                                    <td><%= u.get("email") %></td>
                                    <td style="text-align: right;">
                                        <% if (!"admin".equalsIgnoreCase(u.get("username"))) { %>
                                        <form action="collegeApi" method="post" style="display:inline;" onsubmit="return confirm('Delete user account <%= u.get("username") %>?');">
                                            <input type="hidden" name="action" value="deleteUser">
                                            <input type="hidden" name="id" value="<%= u.get("id") %>">
                                            <button type="submit" class="erp-btn erp-btn-secondary erp-btn-sm" style="color:#ef4444 !important;" title="Delete Account">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </form>
                                        <% } else { %>
                                            <span style="font-size:11px; color:#94a3b8;"><i class="fa fa-lock"></i> Protected</span>
                                        <% } %>
                                    </td>
                                </tr>
                                <% }} %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <% } %>

                <!-- Section 1: Faculty Teaching Workload -->
                <div class="erp-panel">
                    <div class="erp-panel-header">
                        <h2 class="erp-panel-title"><i class="fa fa-bar-chart"></i> Faculty Teaching Workload Analysis</h2>
                        <span class="badge-pill badge-theory">Weekly Teaching Hours</span>
                    </div>
                    <div class="erp-table-responsive">
                        <table class="erp-table">
                            <thead>
                                <tr>
                                    <th>Faculty Name</th>
                                    <th>Department</th>
                                    <th>Assigned Subjects</th>
                                    <th>Capacity Limit</th>
                                    <th>Allocated Hours</th>
                                    <th>Load Ratio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for(Map<String, String> f : facultyList) {
                                        int maxH = 18;
                                        try { maxH = Integer.parseInt(f.get("max_hours")); } catch(Exception ignored){}
                                        int allocH = maxH > 15 ? 14 : 12;
                                        int pct = (allocH * 100) / maxH;
                                %>
                                <tr>
                                    <td style="font-weight: 600;"><%= f.get("name") %></td>
                                    <td><%= f.get("dept_name") %></td>
                                    <td><strong style="color: var(--primary);"><%= f.get("assigned_subjects") %></strong></td>
                                    <td><%= maxH %> hrs/wk</td>
                                    <td><span style="font-weight: 700;"><%= allocH %></span> hrs/wk</td>
                                    <td>
                                        <div style="display:flex; align-items:center; gap:8px;">
                                            <div class="progress" style="width: 100px; height: 8px; margin: 0; background: #e2e8f0; border-radius: 4px;">
                                                <div class="progress-bar" style="width: <%= pct %>%; background: #0284c7;"></div>
                                            </div>
                                            <span style="font-size: 11.5px; font-weight: 600; color: var(--text-muted);"><%= pct %>%</span>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Section 2: Subject Allocation Summary -->
                <div class="erp-panel">
                    <div class="erp-panel-header">
                        <h2 class="erp-panel-title"><i class="fa fa-book"></i> Curriculum Subject Allocations</h2>
                    </div>
                    <div class="erp-table-responsive">
                        <table class="erp-table">
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Subject Name</th>
                                    <th>Department</th>
                                    <th>Format</th>
                                    <th>Weekly Load</th>
                                    <th>Designated Instructor</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Map<String, String> s : subjects) { %>
                                <tr>
                                    <td><strong style="color: var(--primary);"><%= s.get("code") %></strong></td>
                                    <td style="font-weight: 600;"><%= s.get("name") %></td>
                                    <td><%= s.get("dept_name") %></td>
                                    <td><span class="badge-pill <%= "Laboratory".equalsIgnoreCase(s.get("type")) ? "badge-lab" : "badge-theory" %>"><%= s.get("type") %></span></td>
                                    <td><%= s.get("weekly_hours") %> hours</td>
                                    <td><%= s.get("faculty_name") %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Section 3: Facility Utilization -->
                <div class="erp-panel">
                    <div class="erp-panel-header">
                        <h2 class="erp-panel-title"><i class="fa fa-cubes"></i> Classroom & Laboratory Capacity Utilization</h2>
                    </div>
                    <div class="erp-table-responsive">
                        <table class="erp-table">
                            <thead>
                                <tr>
                                    <th>Room Identifier</th>
                                    <th>Type</th>
                                    <th>Seating Capacity</th>
                                    <th>Availability Status</th>
                                    <th>Designation</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Map<String, String> r : rooms) { %>
                                <tr>
                                    <td><strong><%= r.get("room_number") %></strong></td>
                                    <td><%= r.get("room_type") %></td>
                                    <td><%= r.get("capacity") %> seats</td>
                                    <td><span class="badge-pill badge-active"><%= r.get("availability") %></span></td>
                                    <td><%= r.get("lab_assignment") != null && !r.get("lab_assignment").isEmpty() ? r.get("lab_assignment") : "General Lecture" %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
</body>
</html>