<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, front.CollegeDao" %>
<%
    request.setAttribute("activePage", "classrooms");
    request.setAttribute("pageHeading", "Classrooms & Laboratory Infrastructure");
    request.setAttribute("breadcrumb", "Academic Management / Facilities");

    List<Map<String, String>> rooms = CollegeDao.getClassroomsList();
    String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Classrooms & Labs | CampusSchedule ERP</title>
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
                            <h2 class="erp-panel-title"><i class="fa fa-cubes"></i> College Classrooms, Lecture Halls & Labs</h2>
                            <p class="erp-panel-subtitle">Manage physical room allocation, laboratory equipment designations, and seating capacity</p>
                        </div>
                        <button type="button" class="erp-btn erp-btn-primary" data-toggle="modal" data-target="#addRoomModal">
                            <i class="fa fa-plus-circle"></i> Add Classroom / Lab
                        </button>
                    </div>

                    <!-- Search Filter -->
                    <div style="display: flex; gap: 12px; margin-bottom: 20px;">
                        <div style="position: relative; flex: 1; max-width: 420px;">
                            <input type="text" id="roomSearch" class="erp-input" placeholder="Search by room number, type, or lab assignment..." onkeyup="filterTable('roomSearch', 'roomTable')">
                        </div>
                    </div>

                    <!-- Rooms Table -->
                    <div class="erp-table-responsive">
                        <table class="erp-table" id="roomTable">
                            <thead>
                                <tr>
                                    <th>Room Identifier</th>
                                    <th>Facility Type</th>
                                    <th>Seating Capacity</th>
                                    <th>Status / Availability</th>
                                    <th>Assigned Laboratory / Equipment</th>
                                    <th style="text-align: right;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(Map<String, String> r : rooms) { 
                                    boolean isLab = r.get("room_type").contains("Lab") || r.get("room_type").contains("Workshop");
                                %>
                                <tr>
                                    <td><strong style="color: var(--primary); font-size: 14px;"><i class="fa fa-map-marker text-muted" style="margin-right:6px;"></i><%= r.get("room_number") %></strong></td>
                                    <td>
                                        <span class="badge-pill <%= isLab ? "badge-lab" : "badge-theory" %>">
                                            <i class="fa <%= isLab ? "fa-flask" : "fa-desktop" %>" style="margin-right:4px;"></i>
                                            <%= r.get("room_type") %>
                                        </span>
                                    </td>
                                    <td><strong style="color: var(--text-dark);"><%= r.get("capacity") %></strong> seats</td>
                                    <td><span class="badge-pill badge-active"><i class="fa fa-check-circle" style="margin-right:4px;"></i><%= r.get("availability") %></span></td>
                                    <td><%= r.get("lab_assignment") != null && !r.get("lab_assignment").isEmpty() ? r.get("lab_assignment") : "<span class='text-muted'>Standard Lecture</span>" %></td>
                                    <td style="text-align: right;">
                                        <form action="collegeApi" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this room?');">
                                            <input type="hidden" name="action" value="deleteClassroom">
                                            <input type="hidden" name="id" value="<%= r.get("id") %>">
                                            <button type="submit" class="erp-btn erp-btn-secondary erp-btn-sm" style="color: #ef4444 !important;" title="Delete Room">
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

    <!-- Add Room Modal -->
    <div class="modal fade" id="addRoomModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="border-radius: var(--radius-lg); border: none; box-shadow: var(--shadow-lg);">
                <form action="collegeApi" method="post">
                    <input type="hidden" name="action" value="addClassroom">
                    <div class="modal-header" style="background: linear-gradient(135deg, #0284c7, #0369a1); color: #fff; border-radius: var(--radius-lg) var(--radius-lg) 0 0; padding: 18px 24px;">
                        <button type="button" class="close" data-dismiss="modal" style="color:#fff; opacity:0.8;">&times;</button>
                        <h4 class="modal-title" style="font-weight: 700; font-size: 17px;"><i class="fa fa-plus-circle"></i> Add Classroom or Laboratory</h4>
                    </div>
                    <div class="modal-body" style="padding: 24px;">
                        <div class="erp-form-group">
                            <label class="erp-label">Room Number / Identifier <span class="req">*</span></label>
                            <input type="text" name="room_number" class="erp-input" placeholder="e.g. LH-301, LAB-105" required>
                        </div>
                        <div class="erp-form-group">
                            <label class="erp-label">Facility Type <span class="req">*</span></label>
                            <select name="room_type" class="erp-select" required>
                                <option value="Lecture Hall">Lecture Hall</option>
                                <option value="Smart Classroom">Smart Classroom</option>
                                <option value="Computer Laboratory">Computer Laboratory</option>
                                <option value="Science Laboratory">Science Laboratory</option>
                                <option value="Mechanical Workshop">Mechanical Workshop</option>
                                <option value="Seminar Hall">Seminar Hall</option>
                            </select>
                        </div>
                        <div class="erp-form-group">
                            <label class="erp-label">Seating Capacity</label>
                            <input type="number" name="capacity" class="erp-input" value="60" min="15" max="300" required>
                        </div>
                        <div class="erp-form-group">
                            <label class="erp-label">Availability Status</label>
                            <select name="availability" class="erp-select">
                                <option value="Available">Available (Full Day)</option>
                                <option value="Morning Only">Morning Only</option>
                                <option value="Under Maintenance">Under Maintenance</option>
                            </select>
                        </div>
                        <div class="erp-form-group">
                            <label class="erp-label">Lab Equipment / Specialized Assignment</label>
                            <input type="text" name="lab_assignment" class="erp-input" placeholder="e.g. Applied Physics Lab Kits, 40 Workstations">
                        </div>
                    </div>
                    <div class="modal-footer" style="padding: 16px 24px; border-top: 1px solid var(--border-light);">
                        <button type="button" class="erp-btn erp-btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="erp-btn erp-btn-primary">Save Classroom</button>
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
        window.onload = function() { showToast("Classroom added successfully!", "success"); };
    <% } else if("deleted".equals(status)) { %>
        window.onload = function() { showToast("Classroom deleted successfully!", "danger"); };
    <% } %>
    </script>
</body>
</html>