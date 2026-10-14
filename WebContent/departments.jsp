<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, front.CollegeDao" %>
<%
    String currentRole = (String) session.getAttribute("role");
    String loginStatus = (String) session.getAttribute("login");
    if (loginStatus == null || !"true".equals(loginStatus)) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
    if (!"ADMIN".equalsIgnoreCase(currentRole)) {
        response.sendRedirect("admin-login.jsp?error=unauthorized");
        return;
    }

    request.setAttribute("activePage", "departments");
    request.setAttribute("pageHeading", "Department Management");
    request.setAttribute("breadcrumb", "Academic Management / Departments");

    List<Map<String, String>> depts = CollegeDao.getDepartments();
    String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Departments | Automated Timetable Scheduler</title>
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
                            <h2 class="erp-panel-title"><i class="fa fa-building-o"></i> College Academic Departments</h2>
                            <p class="erp-panel-subtitle">Manage engineering disciplines, faculty divisions, and department heads</p>
                        </div>
                        <button type="button" class="erp-btn erp-btn-primary" data-toggle="modal" data-target="#addDeptModal">
                            <i class="fa fa-plus-circle"></i> Add New Department
                        </button>
                    </div>

                    <!-- Search Filter -->
                    <div style="display: flex; gap: 12px; margin-bottom: 20px;">
                        <div style="position: relative; flex: 1; max-width: 400px;">
                            <input type="text" id="deptSearch" class="erp-input" placeholder="Search departments by code or name..." onkeyup="filterTable('deptSearch', 'deptTable')">
                        </div>
                    </div>

                    <!-- Department Table -->
                    <div class="erp-table-responsive">
                        <table class="erp-table" id="deptTable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Dept Code</th>
                                    <th>Department Name</th>
                                    <th>Head of Department (H.O.D.)</th>
                                    <th style="text-align: right;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int idx = 1;
                                    for(Map<String, String> d : depts) {
                                %>
                                <tr>
                                    <td style="color: var(--text-muted);"><%= idx++ %></td>
                                    <td><span class="badge-pill badge-theory"><%= d.get("dept_code") %></span></td>
                                    <td style="font-weight: 600; color: var(--text-dark);"><%= d.get("dept_name") %></td>
                                    <td><i class="fa fa-user-circle text-muted" style="margin-right:6px;"></i><%= d.get("hod_name") %></td>
                                    <td style="text-align: right;">
                                        <form action="collegeApi" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this department?');">
                                            <input type="hidden" name="action" value="deleteDept">
                                            <input type="hidden" name="id" value="<%= d.get("id") %>">
                                            <button type="submit" class="erp-btn erp-btn-secondary erp-btn-sm" style="color: #ef4444 !important;" title="Delete Department">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Add Department Modal -->
    <div class="modal fade" id="addDeptModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="border-radius: var(--radius-lg); border: none; box-shadow: var(--shadow-lg);">
                <form action="collegeApi" method="post">
                    <input type="hidden" name="action" value="addDept">
                    <div class="modal-header" style="background: linear-gradient(135deg, #0284c7, #0369a1); color: #fff; border-radius: var(--radius-lg) var(--radius-lg) 0 0; padding: 18px 24px;">
                        <button type="button" class="close" data-dismiss="modal" style="color:#fff; opacity:0.8;">&times;</button>
                        <h4 class="modal-title" style="font-weight: 700; font-size: 17px;"><i class="fa fa-plus-circle"></i> Add Department</h4>
                    </div>
                    <div class="modal-body" style="padding: 24px;">
                        <div class="erp-form-group">
                            <label class="erp-label">Department Code <span class="req">*</span></label>
                            <input type="text" name="dept_code" class="erp-input" placeholder="e.g. CSE, ECE, ME" required>
                        </div>
                        <div class="erp-form-group">
                            <label class="erp-label">Department Full Name <span class="req">*</span></label>
                            <input type="text" name="dept_name" class="erp-input" placeholder="e.g. Computer Science & Engineering" required>
                        </div>
                        <div class="erp-form-group">
                            <label class="erp-label">Head of Department (H.O.D.)</label>
                            <input type="text" name="hod_name" class="erp-input" placeholder="e.g. Dr. Jane Doe">
                        </div>
                    </div>
                    <div class="modal-footer" style="padding: 16px 24px; border-top: 1px solid var(--border-light);">
                        <button type="button" class="erp-btn erp-btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="erp-btn erp-btn-primary">Save Department</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
    <script>
    function filterTable(inputId, tableId) {
        var input = document.getElementById(inputId);
        var filter = input.value.toUpperCase();
        var table = document.getElementById(tableId);
        var tr = table.getElementsByTagName("tr");
        for (var i = 1; i < tr.length; i++) {
            var txtValue = tr[i].textContent || tr[i].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
    <% if("success".equals(status)) { %>
        window.onload = function() { showToast("Department added successfully!", "success"); };
    <% } else if("deleted".equals(status)) { %>
        window.onload = function() { showToast("Department deleted successfully!", "danger"); };
    <% } %>
    </script>
</body>
</html>