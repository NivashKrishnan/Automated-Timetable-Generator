<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String activePage = (String)request.getAttribute("activePage");
    if(activePage == null) activePage = "";
%>
<aside class="erp-sidebar" id="erpSidebar">
    <div class="erp-brand">
        <div class="erp-brand-icon">
            <i class="fa fa-graduation-cap"></i>
        </div>
        <div class="erp-brand-text">
            <h2>CampusSchedule</h2>
            <span>ERP Timetable Suite</span>
        </div>
    </div>
    
    <div class="erp-nav-scroll">
        <div class="erp-nav-heading">Main Navigation</div>
        <ul class="erp-nav-list">
            <li class="erp-nav-item">
                <a href="dashboard.jsp" class="erp-nav-link <%= "dashboard".equals(activePage) ? "active" : "" %>">
                    <i class="fa fa-th-large"></i>
                    <span>Dashboard</span>
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
                    <i class="fa fa-calendar-check-o"></i>
                    <span>Weekly Timetable</span>
                    <span class="erp-nav-badge">Live</span>
                </a>
            </li>
        </ul>

        <div class="erp-nav-heading">Academic Management</div>
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

        <div class="erp-nav-heading">Reports & Documentation</div>
        <ul class="erp-nav-list">
            <li class="erp-nav-item">
                <a href="reports.jsp" class="erp-nav-link <%= "reports".equals(activePage) ? "active" : "" %>">
                    <i class="fa fa-bar-chart"></i>
                    <span>Workload & Reports</span>
                </a>
            </li>
            <li class="erp-nav-item">
                <a href="how-to-use.jsp" class="erp-nav-link <%= "how-to-use".equals(activePage) ? "active" : "" %>">
                    <i class="fa fa-question-circle"></i>
                    <span>How to Use?</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="erp-sidebar-footer">
        <div class="erp-user-avatar">
            <i class="fa fa-user"></i>
        </div>
        <div class="erp-user-info">
            <div class="erp-user-name">Admin (Pranav)</div>
            <div class="erp-user-role">System Administrator</div>
        </div>
        <a href="logout" class="erp-logout-btn" title="Logout">
            <i class="fa fa-sign-out"></i>
        </a>
    </div>
</aside>
