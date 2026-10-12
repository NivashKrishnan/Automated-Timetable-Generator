<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, front.CollegeDao" %>
<%
    request.setAttribute("activePage", "faculty");
    request.setAttribute("pageHeading", "Faculty Management");
    request.setAttribute("breadcrumb", "Academic Management / Faculty Roster");

    List<Map<String, String>> facultyList = CollegeDao.getFacultyList();
    List<Map<String, String>> depts = CollegeDao.getDepartments();
    String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Faculty Directory | CampusSchedule ERP</title>
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
                            <h2 class="erp-panel-title"><i class="fa fa-users"></i> College Faculty & Professors Directory</h2>
                            <p class="erp-panel-subtitle">Manage faculty profiles, department associations, subject allocations, and weekly limits</p>
                        </div>
                        <button type="button" class="erp-btn erp-btn-primary" data-toggle="modal" data-target="#addFacultyModal">
                            <i class="fa fa-user-plus"></i> Add Faculty Member
                        </button>
                    </div>

                    <!-- Search Filter -->
                    <div style="display: flex; gap: 12px; margin-bottom: 20px;">
                        <div style="position: relative; flex: 1; max-width: 420px;">
                            <input type="text" id="facultySearch" class="erp-input" placeholder="Search faculty by name, ID, or subject..." onkeyup="filterTable('facultySearch', 'facultyTable')">
                        </div>
                    </div>

                    <!-- Faculty Table -->
                    <div class="erp-table-responsive">
                        <table class="erp-table" id="facultyTable">
                            <thead>
                                <tr>
                                    <th>Faculty ID</th>
                                    <th>Professor Name</th>
                                    <th>Department</th>
                                    <th>Email Address</th>
                                    <th>Assigned Subjects</th>
                                    <th>Max Hrs/Wk</th>
                                    <th>Availability</th>
                                    <th>Status</th>
                                    <th style="text-align: right;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Map<String, String> f : facultyList) { %>
                                <tr>
                                    <td><span style="font-family:monospace; font-weight:700; color:var(--text-dark);"><%= f.get("faculty_id") %></span></td>
                                    <td style="font-weight: 600; color: var(--text-dark);">
                                        <i class="fa fa-graduation-cap text-primary" style="margin-right:6px;"></i><%= f.get("name") %>
                                    </td>
                                    <td><span class="badge-pill badge-theory"><%= f.get("dept_name") %></span></td>
                                    <td style="font-size: 12.5px; color: var(--text-muted);"><%= f.get("email") %></td>
                                    <td><strong style="color: var(--primary);"><%= f.get("assigned_subjects") %></strong></td>
                                    <td style="font-weight: 600;"><%= f.get("max_hours") %> hrs</td>
                                    <td><span class="badge-pill badge-active"><%= f.get("availability") %></span></td>
                                    <td><span class="badge-pill badge-active"><i class="fa fa-circle" style="font-size:8px;"></i> <%= f.get("status") %></span></td>
                                    <td style="text-align: right;">
                                        <form action="collegeApi" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to remove this faculty member?');">
                                            <input type="hidden" name="action" value="deleteFaculty">
                                            <input type="hidden" name="id" value="<%= f.get("id") %>">
                                            <button type="submit" class="erp-btn erp-btn-secondary erp-btn-sm" style="color: #ef4444 !important;" title="Remove Faculty">
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

    <!-- Add Faculty Modal -->
    <div class="modal fade" id="addFacultyModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="border-radius: var(--radius-lg); border: none; box-shadow: var(--shadow-lg);">
                <form action="collegeApi" method="post">
                    <input type="hidden" name="action" value="addFaculty">
                    <div class="modal-header" style="background: linear-gradient(135deg, #0284c7, #0369a1); color: #fff; border-radius: var(--radius-lg) var(--radius-lg) 0 0; padding: 18px 24px;">
                        <button type="button" class="close" data-dismiss="modal" style="color:#fff; opacity:0.8;">&times;</button>
                        <h4 class="modal-title" style="font-weight: 700; font-size: 17px;"><i class="fa fa-user-plus"></i> Add Faculty Member</h4>
                    </div>
                    <div class="modal-body" style="padding: 24px;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Faculty ID <span class="req">*</span></label>
                                    <input type="text" name="faculty_id" class="erp-input" placeholder="e.g. FAC-010" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Faculty Full Name <span class="req">*</span></label>
                                    <input type="text" name="name" class="erp-input" placeholder="e.g. Dr. Robert Vance" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Department <span class="req">*</span></label>
                                    <select name="dept_name" class="erp-select" required>
                                        <% for(Map<String, String> d : depts) { %>
                                        <option value="<%= d.get("dept_name") %>"><%= d.get("dept_name") %> (<%= d.get("dept_code") %>)</option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Email Address</label>
                                    <input type="email" name="email" class="erp-input" placeholder="e.g. faculty@college.edu">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="erp-form-group">
                                    <label class="erp-label">Assigned Subjects (Code) <span class="req">*</span></label>
                                    <input type="text" name="assigned_subjects" class="erp-input" placeholder="e.g. AP-1101, ME-1111" required>
                                    <div class="erp-helper-text">Must match subject codes in scheduler.</div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="erp-form-group">
                                    <label class="erp-label">Maximum Teaching Hours/Week</label>
                                    <input type="number" name="max_hours" class="erp-input" value="18" min="4" max="30" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="erp-form-group">
                                    <label class="erp-label">Availability Schedule</label>
                                    <select name="availability" class="erp-select">
                                        <option value="Full-Time">Full-Time (Mon - Fri)</option>
                                        <option value="Part-Time">Part-Time (Morning only)</option>
                                        <option value="Visiting">Visiting Faculty</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="padding: 16px 24px; border-top: 1px solid var(--border-light);">
                        <button type="button" class="erp-btn erp-btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="erp-btn erp-btn-primary">Save Faculty Profile</button>
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
        window.onload = function() { showToast("Faculty member added successfully!", "success"); };
    <% } else if("deleted".equals(status)) { %>
        window.onload = function() { showToast("Faculty member removed!", "danger"); };
    <% } %>
    </script>
</body>
</html>