<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String pageHeading = (String)request.getAttribute("pageHeading");
    if(pageHeading == null) pageHeading = "Automated College Timetable System";
    String breadcrumb = (String)request.getAttribute("breadcrumb");
    if(breadcrumb == null) breadcrumb = "ERP Management / Overview";
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
            <span>Academic Term: 2026-2027 (Sem 1)</span>
        </div>
        <a href="form.jsp" class="erp-btn erp-btn-primary erp-btn-sm" style="display:inline-flex;">
            <i class="fa fa-sliders"></i> Configure Timetable
        </a>
        <a href="view-timetable" class="erp-btn erp-btn-success erp-btn-sm" style="display:inline-flex;">
            <i class="fa fa-bolt"></i> Run Generator
        </a>
    </div>
</header>
