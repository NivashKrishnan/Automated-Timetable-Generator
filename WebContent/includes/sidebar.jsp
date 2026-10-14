<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String activePage = (String)request.getAttribute("activePage");
    if(activePage == null) activePage = "";
    
    String userRole = (String) session.getAttribute("role");
    if(userRole == null || userRole.trim().isEmpty()) {
        userRole = "ADMIN";
    }
    
    String userName = (String) session.getAttribute("fullName");
    if(userName == null || userName.trim().isEmpty()) {
        userName = (String) session.getAttribute("username");
    }
    if(userName == null || userName.trim().isEmpty()) {
        userName = "Administrator";
    }
    
    String roleBadge = "ADMIN".equalsIgnoreCase(userRole) ? "System Administrator" : 
                      ("FACULTY".equalsIgnoreCase(userRole) ? "Faculty Instructor" : "Student");
%>
<aside class="erp-sidebar" id="erpSidebar">
    <div class="erp-brand">
        <div class="erp-brand-icon">
            <i class="fa fa-calendar-check-o"></i>
        </div>
        <div class="erp-brand-text">
            <h2>Timetable Scheduler</h2>
            <span>Automated Scheduling Engine</span>
        </div>
    </div>
    
    <div class="erp-nav-scroll">
        <% if ("ADMIN".equalsIgnoreCase(userRole)) { %>
            <div class="erp-nav-heading">Administrator Console</div>
            <ul class="erp-nav-list">
                <li class="erp-nav-item">
                    <a href="dashboard.jsp" class="erp-nav-link <%= "dashboard".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-th-large"></i>
                        <span>Dashboard Overview</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="form.jsp" class="erp-nav-link <%= "generator".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-cogs"></i>
                        <span>Timetable Generator</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="view-timetable" class="erp-nav-link <%= "viewer".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-calendar"></i>
                        <span>Master Timetable</span>
                        <span class="erp-nav-badge">Live</span>
                    </a>
                </li>
            </ul>

            <div class="erp-nav-heading">Academic Resources</div>
            <ul class="erp-nav-list">
                <li class="erp-nav-item">
                    <a href="departments.jsp" class="erp-nav-link <%= "departments".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-building-o"></i>
                        <span>Departments</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="faculty.jsp" class="erp-nav-link <%= "faculty".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-users"></i>
                        <span>Faculty Directory</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="subjects.jsp" class="erp-nav-link <%= "subjects".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-book"></i>
                        <span>Subjects & Courses</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="classes.jsp" class="erp-nav-link <%= "classes".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-id-badge"></i>
                        <span>Classes & Sections</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="classrooms.jsp" class="erp-nav-link <%= "classrooms".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-cubes"></i>
                        <span>Classrooms & Labs</span>
                    </a>
                </li>
            </ul>

            <div class="erp-nav-heading">Reports & Accounts</div>
            <ul class="erp-nav-list">
                <li class="erp-nav-item">
                    <a href="reports.jsp" class="erp-nav-link <%= "reports".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-bar-chart"></i>
                        <span>Workload & Accounts</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="how-to-use.jsp" class="erp-nav-link <%= "how-to-use".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-question-circle"></i>
                        <span>How to Use?</span>
                    </a>
                </li>
            </ul>
        <% } else if ("FACULTY".equalsIgnoreCase(userRole)) { %>
            <div class="erp-nav-heading">Faculty Portal</div>
            <ul class="erp-nav-list">
                <li class="erp-nav-item">
                    <a href="faculty-dashboard.jsp" class="erp-nav-link <%= "faculty-dashboard".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-calendar-check-o"></i>
                        <span>My Teaching Schedule</span>
                        <span class="erp-nav-badge">Active</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="view-timetable" class="erp-nav-link <%= "viewer".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-calendar"></i>
                        <span>Master Timetable</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="reports.jsp" class="erp-nav-link <%= "reports".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-bar-chart"></i>
                        <span>Weekly Workload Stats</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="how-to-use.jsp" class="erp-nav-link <%= "how-to-use".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-question-circle"></i>
                        <span>Timetable Guide</span>
                    </a>
                </li>
            </ul>
        <% } else { %>
            <div class="erp-nav-heading">Student Portal</div>
            <ul class="erp-nav-list">
                <li class="erp-nav-item">
                    <a href="student-dashboard.jsp" class="erp-nav-link <%= "student-dashboard".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-calendar-check-o"></i>
                        <span>My Class Schedule</span>
                        <span class="erp-nav-badge">Batch</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="view-timetable" class="erp-nav-link <%= "viewer".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-calendar"></i>
                        <span>Master Timetable</span>
                    </a>
                </li>
                <li class="erp-nav-item">
                    <a href="how-to-use.jsp" class="erp-nav-link <%= "how-to-use".equals(activePage) ? "active" : "" %>">
                        <i class="fa fa-question-circle"></i>
                        <span>Timetable Guide</span>
                    </a>
                </li>
            </ul>
        <% } %>
    </div>

    <div class="erp-sidebar-footer">
        <div class="erp-user-avatar">
            <% if ("ADMIN".equalsIgnoreCase(userRole)) { %>
                <i class="fa fa-shield"></i>
            <% } else if ("FACULTY".equalsIgnoreCase(userRole)) { %>
                <i class="fa fa-user-circle"></i>
            <% } else { %>
                <i class="fa fa-graduation-cap"></i>
            <% } %>
        </div>
        <div class="erp-user-info">
            <div class="erp-user-name" title="<%= userName %>"><%= userName %></div>
            <div class="erp-user-role"><%= roleBadge %></div>
        </div>
        <a href="logout" class="erp-logout-btn" title="Logout from <%= roleBadge %>">
            <i class="fa fa-sign-out"></i>
        </a>
    </div>
</aside>
