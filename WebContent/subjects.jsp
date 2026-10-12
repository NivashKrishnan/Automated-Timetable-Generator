<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, front.CollegeDao" %>
<%
    request.setAttribute("activePage", "subjects");
    request.setAttribute("pageHeading", "Subject & Curriculum Management");
    request.setAttribute("breadcrumb", "Academic Management / Subjects");

    List<Map<String, String>> subjects = CollegeDao.getSubjectsList();
    List<Map<String, String>> depts = CollegeDao.getDepartments();
    List<Map<String, String>> facultyList = CollegeDao.getFacultyList();
    String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Subjects | CampusSchedule ERP</title>
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
                            <h2 class="erp-panel-title"><i class="fa fa-book"></i> Curriculum Subjects & Course Offerings</h2>
                            <p class="erp-panel-subtitle">Define theory and laboratory subjects, weekly lecture hours, and assigned faculty</p>
                        </div>
                        <button type="button" class="erp-btn erp-btn-primary" data-toggle="modal" data-target="#addSubjectModal">
                            <i class="fa fa-plus-circle"></i> Add New Subject
                        </button>
                    </div>

                    <!-- Search Filter -->
                    <div style="display: flex; gap: 12px; margin-bottom: 20px;">
                        <div style="position: relative; flex: 1; max-width: 420px;">
                            <input type="text" id="subjectSearch" class="erp-input" placeholder="Search by subject code, title, or department..." onkeyup="filterTable('subjectSearch', 'subjectTable')">
                        </div>
                    </div>

                    <!-- Subject Table -->
                    <div class="erp-table-responsive">
                        <table class="erp-table" id="subjectTable">
                            <thead>
                                <tr>
                                    <th>Subject Code</th>
                                    <th>Subject Title</th>
                                    <th>Department</th>
                                    <th>Semester</th>
                                    <th>Weekly Hours</th>
                                    <th>Course Type</th>
                                    <th>Allocated Faculty</th>
                                    <th style="text-align: right;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Map<String, String> s : subjects) { 
                                    boolean isLab = "Laboratory".equalsIgnoreCase(s.get("type"));
                                %>
                                <tr>
                                    <td><strong style="color: var(--primary);"><%= s.get("code") %></strong></td>
                                    <td style="font-weight: 600; color: var(--text-dark);"><%= s.get("name") %></td>
                                    <td><%= s.get("dept_name") %></td>
                                    <td>Sem <%= s.get("semester") %></td>
                                    <td><span style="font-weight:700;"><%= s.get("weekly_hours") %></span> hrs/wk</td>
                                    <td>
                                        <span class="badge-pill <%= isLab ? "badge-lab" : "badge-theory" %>">
                                            <i class="fa <%= isLab ? "fa-flask" : "fa-file-text-o" %>" style="margin-right:4px;"></i>
                                            <%= s.get("type") %>
                                        </span>
                                    </td>
                                    <td><i class="fa fa-user-circle text-muted" style="margin-right:5px;"></i><%= s.get("faculty_name") %></td>
                                    <td style="text-align: right;">
                                        <form action="collegeApi" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this subject?');">
                                            <input type="hidden" name="action" value="deleteSubject">
                                            <input type="hidden" name="id" value="<%= s.get("id") %>">
                                            <button type="submit" class="erp-btn erp-btn-secondary erp-btn-sm" style="color: #ef4444 !important;" title="Delete Subject">
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

    <!-- Add Subject Modal -->
    <div class="modal fade" id="addSubjectModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="border-radius: var(--radius-lg); border: none; box-shadow: var(--shadow-lg);">
                <form action="collegeApi" method="post">
                    <input type="hidden" name="action" value="addSubject">
                    <div class="modal-header" style="background: linear-gradient(135deg, #0284c7, #0369a1); color: #fff; border-radius: var(--radius-lg) var(--radius-lg) 0 0; padding: 18px 24px;">
                        <button type="button" class="close" data-dismiss="modal" style="color:#fff; opacity:0.8;">&times;</button>
                        <h4 class="modal-title" style="font-weight: 700; font-size: 17px;"><i class="fa fa-book"></i> Add Curriculum Subject</h4>
                    </div>
                    <div class="modal-body" style="padding: 24px;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Subject Code <span class="req">*</span></label>
                                    <input type="text" name="code" class="erp-input" placeholder="e.g. CS-2101, ME-1111" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Subject Title <span class="req">*</span></label>
                                    <input type="text" name="name" class="erp-input" placeholder="e.g. Data Structures and Algorithms" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Department <span class="req">*</span></label>
                                    <select name="dept_name" class="erp-select" required>
                                        <% for(Map<String, String> d : depts) { %>
                                        <option value="<%= d.get("dept_name") %>"><%= d.get("dept_name") %></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="erp-form-group">
                                    <label class="erp-label">Semester</label>
                                    <input type="number" name="semester" class="erp-input" value="1" min="1" max="8" required>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="erp-form-group">
                                    <label class="erp-label">Weekly Hours</label>
                                    <input type="number" name="weekly_hours" class="erp-input" value="4" min="1" max="10" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Course Type</label>
                                    <select name="type" class="erp-select">
                                        <option value="Theory">Theory Lecture</option>
                                        <option value="Laboratory">Laboratory Session</option>
                                        <option value="Tutorial">Tutorial / Practical</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Allocated Faculty</label>
                                    <select name="faculty_name" class="erp-select">
                                        <option value="Unassigned">-- Select Faculty (Optional) --</option>
                                        <% for(Map<String, String> f : facultyList) { %>
                                        <option value="<%= f.get("name") %>"><%= f.get("name") %> (<%= f.get("dept_name") %>)</option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="padding: 16px 24px; border-top: 1px solid var(--border-light);">
                        <button type="button" class="erp-btn erp-btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="erp-btn erp-btn-primary">Save Subject</button>
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
        window.onload = function() { showToast("Subject added successfully!", "success"); };
    <% } else if("deleted".equals(status)) { %>
        window.onload = function() { showToast("Subject deleted successfully!", "danger"); };
    <% } %>
    </script>
</body>
</html>