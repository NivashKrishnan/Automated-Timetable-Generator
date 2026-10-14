package front;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CollegeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        try {
            if ("addDept".equals(action)) {
                String code = request.getParameter("dept_code");
                String name = request.getParameter("dept_name");
                String hod = request.getParameter("hod_name");
                CollegeDao.addDepartment(code, name, hod);
                String redirect = request.getParameter("redirect");
                if (redirect != null && !redirect.trim().isEmpty()) {
                    response.sendRedirect(redirect);
                } else {
                    response.sendRedirect("departments.jsp?status=success");
                }
                return;
            } else if ("deleteDept".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CollegeDao.deleteDepartment(id);
                response.sendRedirect("departments.jsp?status=deleted");
                return;
            } else if ("addFaculty".equals(action)) {
                String fid = request.getParameter("faculty_id");
                String name = request.getParameter("name");
                String dept = request.getParameter("dept_name");
                String customDept = request.getParameter("custom_dept_name");
                if (customDept != null && !customDept.trim().isEmpty()) {
                    dept = customDept.trim();
                    String code = dept.length() >= 3 ? dept.substring(0, 3).toUpperCase() : dept.toUpperCase();
                    CollegeDao.addDepartment(code, dept, "HOD (" + dept + ")");
                }
                String email = request.getParameter("email");
                String subjects = request.getParameter("assigned_subjects");
                int maxHours = 18;
                try { maxHours = Integer.parseInt(request.getParameter("max_hours")); } catch (Exception ignored) {}
                String avail = request.getParameter("availability");
                if (avail == null || avail.isEmpty()) avail = "Full-Time";
                if (fid == null || fid.isEmpty()) fid = "FAC-" + (System.currentTimeMillis() % 10000);
                CollegeDao.addFaculty(fid, name, dept, email, subjects, maxHours, avail);
                String redirect = request.getParameter("redirect");
                if (redirect != null && !redirect.trim().isEmpty()) {
                    response.sendRedirect(redirect);
                } else {
                    response.sendRedirect("faculty.jsp?status=success");
                }
                return;
            } else if ("deleteFaculty".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CollegeDao.deleteFaculty(id);
                response.sendRedirect("faculty.jsp?status=deleted");
                return;
            } else if ("addSubject".equals(action)) {
                String code = request.getParameter("code");
                String name = request.getParameter("name");
                String dept = request.getParameter("dept_name");
                String customDept = request.getParameter("custom_dept_name");
                if (customDept != null && !customDept.trim().isEmpty()) {
                    dept = customDept.trim();
                    String codeD = dept.length() >= 3 ? dept.substring(0, 3).toUpperCase() : dept.toUpperCase();
                    CollegeDao.addDepartment(codeD, dept, "HOD (" + dept + ")");
                }
                int sem = 1;
                try { sem = Integer.parseInt(request.getParameter("semester")); } catch (Exception ignored) {}
                int hours = 4;
                try { hours = Integer.parseInt(request.getParameter("weekly_hours")); } catch (Exception ignored) {}
                String type = request.getParameter("type");
                if (type == null || type.isEmpty()) type = "Theory";
                String faculty = request.getParameter("faculty_name");
                String customFaculty = request.getParameter("custom_faculty_name");
                if (customFaculty != null && !customFaculty.trim().isEmpty()) {
                    faculty = customFaculty.trim();
                    CollegeDao.addFaculty("FAC-" + (System.currentTimeMillis() % 10000), faculty, dept, faculty.toLowerCase().replaceAll("\\s+", "") + "@college.edu", code, 18, "Full-Time");
                }
                CollegeDao.addSubject(code, name, dept, sem, hours, type, faculty);
                String redirect = request.getParameter("redirect");
                if (redirect != null && !redirect.trim().isEmpty()) {
                    response.sendRedirect(redirect);
                } else {
                    response.sendRedirect("subjects.jsp?status=success");
                }
                return;
            } else if ("deleteSubject".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CollegeDao.deleteSubject(id);
                response.sendRedirect("subjects.jsp?status=deleted");
                return;
            } else if ("addClass".equals(action)) {
                String dept = request.getParameter("dept_name");
                String customDept = request.getParameter("custom_dept_name");
                if (customDept != null && !customDept.trim().isEmpty()) {
                    dept = customDept.trim();
                    String codeD = dept.length() >= 3 ? dept.substring(0, 3).toUpperCase() : dept.toUpperCase();
                    CollegeDao.addDepartment(codeD, dept, "HOD (" + dept + ")");
                }
                String year = request.getParameter("academic_year");
                int sem = 1;
                try { sem = Integer.parseInt(request.getParameter("semester")); } catch (Exception ignored) {}
                String yearOfStudy = request.getParameter("year_of_study");
                String sec = request.getParameter("section_name");
                String customSec = request.getParameter("custom_section_name");
                if (customSec != null && !customSec.trim().isEmpty()) {
                    sec = customSec.trim();
                }
                int count = 60;
                try { count = Integer.parseInt(request.getParameter("student_count")); } catch (Exception ignored) {}
                String adviser = request.getParameter("class_adviser");
                CollegeDao.addClass(dept, year, sem, yearOfStudy, sec, count, adviser);
                String redirect = request.getParameter("redirect");
                if (redirect != null && !redirect.trim().isEmpty()) {
                    response.sendRedirect(redirect);
                } else {
                    response.sendRedirect("classes.jsp?status=success");
                }
                return;
            } else if ("deleteClass".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CollegeDao.deleteClass(id);
                response.sendRedirect("classes.jsp?status=deleted");
                return;
            } else if ("addClassroom".equals(action)) {
                String num = request.getParameter("room_number");
                String type = request.getParameter("room_type");
                int cap = 60;
                try { cap = Integer.parseInt(request.getParameter("capacity")); } catch (Exception ignored) {}
                String avail = request.getParameter("availability");
                if (avail == null || avail.isEmpty()) avail = "Available";
                String lab = request.getParameter("lab_assignment");
                CollegeDao.addClassroom(num, type, cap, avail, lab);
                String redirect = request.getParameter("redirect");
                if (redirect != null && !redirect.trim().isEmpty()) {
                    response.sendRedirect(redirect);
                } else {
                    response.sendRedirect("classrooms.jsp?status=success");
                }
                return;
            } else if ("deleteClassroom".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CollegeDao.deleteClassroom(id);
                response.sendRedirect("classrooms.jsp?status=deleted");
                return;
            } else if ("updateSlot".equals(action)) {
                int slotId = Integer.parseInt(request.getParameter("slot_id"));
                String subCode = request.getParameter("subject_code");
                String subName = request.getParameter("subject_name");
                String facName = request.getParameter("faculty_name");
                String roomNo = request.getParameter("room_no");
                int isLab = 0;
                try { isLab = Integer.parseInt(request.getParameter("is_lab")); } catch (Exception ignored) {}
                boolean ok = CollegeDao.updateSlot(slotId, subCode, subName, facName, roomNo, isLab);
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print("{\"success\":" + ok + "}");
                out.flush();
                return;
            } else if ("deleteUser".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                UserDao.deleteUser(id);
                response.sendRedirect("reports.jsp?status=user_deleted");
                return;
            }
        } catch (Exception e) {
            System.out.println("Error in CollegeServlet: " + e);
        }
        response.sendRedirect("dashboard.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
}
