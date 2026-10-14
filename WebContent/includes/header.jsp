<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String pageHeading = (String)request.getAttribute("pageHeading");
    if(pageHeading == null) pageHeading = "Automated Timetable Scheduler";
    String breadcrumb = (String)request.getAttribute("breadcrumb");
    if(breadcrumb == null) breadcrumb = "Timetable System / Overview";
    
    String curRole = (String) session.getAttribute("role");
    if(curRole == null) curRole = "ADMIN";
%>
<header class="erp-header">
    <div class="erp-header-left">
        <button type="button" class="erp-menu-toggle" onclick="toggleSidebar()" aria-label="Toggle Menu">
            <i class="fa fa-bars"></i>
        </button>
        <div class="erp-page-title">
            <h1><%= pageHeading %></h1>
            <div class="erp-breadcrumb"><i class="fa fa-home"></i> <%= breadcrumb %></div>
        </div>
    </div>
    <div class="erp-header-right">
        <div class="erp-header-badge">
            <i class="fa fa-calendar"></i>
            <span>Term: 2026-2027 (Sem 1)</span>
        </div>
        <% if ("ADMIN".equalsIgnoreCase(curRole)) { %>
            <a href="form.jsp" class="erp-btn erp-btn-primary erp-btn-sm" style="display:inline-flex;">
                <i class="fa fa-sliders"></i> Configure Timetable
            </a>
            <a href="view-timetable" class="erp-btn erp-btn-success erp-btn-sm" style="display:inline-flex;">
                <i class="fa fa-bolt"></i> Master Schedule
            </a>
        <% } else if ("FACULTY".equalsIgnoreCase(curRole)) { %>
            <a href="faculty-dashboard.jsp" class="erp-btn erp-btn-primary erp-btn-sm" style="display:inline-flex;">
                <i class="fa fa-calendar-check-o"></i> My Schedule
            </a>
            <a href="view-timetable" class="erp-btn erp-btn-secondary erp-btn-sm" style="display:inline-flex;">
                <i class="fa fa-table"></i> All Batches
            </a>
        <% } else { %>
            <a href="student-dashboard.jsp" class="erp-btn erp-btn-primary erp-btn-sm" style="display:inline-flex; background: #059669; border-color: #047857; color: #fff;">
                <i class="fa fa-calendar-check-o"></i> My Class Schedule
            </a>
            <a href="view-timetable" class="erp-btn erp-btn-secondary erp-btn-sm" style="display:inline-flex;">
                <i class="fa fa-table"></i> Master Timetable
            </a>
        <% } %>
    </div>
</header>
