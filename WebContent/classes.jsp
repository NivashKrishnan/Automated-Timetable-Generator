<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, front.CollegeDao" %>
<%
    request.setAttribute("activePage", "classes");
    request.setAttribute("pageHeading", "Class & Section Management");
    request.setAttribute("breadcrumb", "Academic Management / Student Batches");

    List<Map<String, String>> classes = CollegeDao.getClassesList();
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
    <title>Classes & Sections | CampusSchedule ERP</title>
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
                            <h2 class="erp-panel-title"><i class="fa fa-id-badge"></i> Student Classes & Academic Batches</h2>
                            <p class="erp-panel-subtitle">Manage class divisions, batch sections, student headcount, and assigned class advisers</p>
                        </div>
                        <button type="button" class="erp-btn erp-btn-primary" data-toggle="modal" data-target="#addClassModal">
                            <i class="fa fa-plus-circle"></i> Add Class Section
                        </button>
                    </div>

                    <!-- Search Filter -->
                    <div style="display: flex; gap: 12px; margin-bottom: 20px;">
                        <div style="position: relative; flex: 1; max-width: 420px;">
                            <input type="text" id="classSearch" class="erp-input" placeholder="Search by batch section, department, or adviser..." onkeyup="filterTable('classSearch', 'classTable')">
                        </div>
                    </div>

                    <!-- Classes Table -->
                    <div class="erp-table-responsive">
                        <table class="erp-table" id="classTable">
                            <thead>
                                <tr>
                                    <th>Section / Batch Name</th>
                                    <th>Department</th>
                                    <th>Year of Study</th>
                                    <th>Academic Year</th>
                                    <th>Semester</th>
                                    <th>Student Strength</th>
                                    <th>Class Adviser</th>
                                    <th style="text-align: right;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Map<String, String> c : classes) { %>
                                <tr>
                                    <td><strong style="color: var(--primary); font-size: 14px;"><%= c.get("section_name") %></strong></td>
                                    <td><%= c.get("dept_name") %></td>
                                    <td><span class="badge-pill badge-theory"><%= c.get("year_of_study") %></span></td>
                                    <td><%= c.get("academic_year") %></td>
                                    <td>Sem <%= c.get("semester") %></td>
                                    <td><i class="fa fa-users text-muted" style="margin-right:4px;"></i> <strong><%= c.get("student_count") %></strong> students</td>
                                    <td><i class="fa fa-user-circle text-muted" style="margin-right:4px;"></i> <%= c.get("class_adviser") %></td>
                                    <td style="text-align: right;">
                                        <form action="collegeApi" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this class section?');">
                                            <input type="hidden" name="action" value="deleteClass">
                                            <input type="hidden" name="id" value="<%= c.get("id") %>">
                                            <button type="submit" class="erp-btn erp-btn-secondary erp-btn-sm" style="color: #ef4444 !important;" title="Delete Section">
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

    <!-- Add Class Modal -->
    <div class="modal fade" id="addClassModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="border-radius: var(--radius-lg); border: none; box-shadow: var(--shadow-lg);">
                <form action="collegeApi" method="post">
                    <input type="hidden" name="action" value="addClass">
                    <div class="modal-header" style="background: linear-gradient(135deg, #0284c7, #0369a1); color: #fff; border-radius: var(--radius-lg) var(--radius-lg) 0 0; padding: 18px 24px;">
                        <button type="button" class="close" data-dismiss="modal" style="color:#fff; opacity:0.8;">&times;</button>
                        <h4 class="modal-title" style="font-weight: 700; font-size: 17px;"><i class="fa fa-id-badge"></i> Add Class / Student Section</h4>
                    </div>
                    <div class="modal-body" style="padding: 24px;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Section / Batch Name <span class="req">*</span></label>
                                    <input type="text" name="section_name" class="erp-input" placeholder="e.g. CSE(Ist-Year) or ECE-Section-A" required>
                                    <div class="erp-helper-text">Must match batch names used in timetable generator.</div>
                                </div>
                            </div>
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
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="erp-form-group">
                                    <label class="erp-label">Academic Year</label>
                                    <input type="text" name="academic_year" class="erp-input" value="2026-2027" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="erp-form-group">
                                    <label class="erp-label">Year of Study</label>
                                    <select name="year_of_study" class="erp-select">
                                        <option value="1st Year">1st Year (Freshman)</option>
                                        <option value="2nd Year">2nd Year (Sophomore)</option>
                                        <option value="3rd Year">3rd Year (Junior)</option>
                                        <option value="4th Year">4th Year (Senior)</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="erp-form-group">
                                    <label class="erp-label">Semester</label>
                                    <input type="number" name="semester" class="erp-input" value="1" min="1" max="8" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Student Count / Batch Size</label>
                                    <input type="number" name="student_count" class="erp-input" value="60" min="10" max="150" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="erp-form-group">
                                    <label class="erp-label">Class Adviser / Mentor</label>
                                    <select name="class_adviser" class="erp-select">
                                        <option value="Unassigned">-- Select Faculty Mentor --</option>
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
                        <button type="submit" class="erp-btn erp-btn-primary">Save Class Section</button>
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
        window.onload = function() { showToast("Class section added successfully!", "success"); };
    <% } else if("deleted".equals(status)) { %>
        window.onload = function() { showToast("Class section removed!", "danger"); };
    <% } %>
    </script>
</body>
</html>