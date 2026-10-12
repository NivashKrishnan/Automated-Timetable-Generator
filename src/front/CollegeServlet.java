package front;

import java.io.IOException;
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
                response.sendRedirect("departments.jsp?status=success");
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
                String email = request.getParameter("email");
                String subjects = request.getParameter("assigned_subjects");
                int maxHours = Integer.parseInt(request.getParameter("max_hours"));
                String avail = request.getParameter("availability");
                CollegeDao.addFaculty(fid, name, dept, email, subjects, maxHours, avail);
                response.sendRedirect("faculty.jsp?status=success");
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
                int sem = Integer.parseInt(request.getParameter("semester"));
                int hours = Integer.parseInt(request.getParameter("weekly_hours"));
                String type = request.getParameter("type");
                String faculty = request.getParameter("faculty_name");
                CollegeDao.addSubject(code, name, dept, sem, hours, type, faculty);
                response.sendRedirect("subjects.jsp?status=success");
                return;
            } else if ("deleteSubject".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CollegeDao.deleteSubject(id);
                response.sendRedirect("subjects.jsp?status=deleted");
                return;
            } else if ("addClass".equals(action)) {
                String dept = request.getParameter("dept_name");
                String year = request.getParameter("academic_year");
                int sem = Integer.parseInt(request.getParameter("semester"));
                String yearOfStudy = request.getParameter("year_of_study");
                String sec = request.getParameter("section_name");
                int count = Integer.parseInt(request.getParameter("student_count"));
                String adviser = request.getParameter("class_adviser");
                CollegeDao.addClass(dept, year, sem, yearOfStudy, sec, count, adviser);
                response.sendRedirect("classes.jsp?status=success");
                return;
            } else if ("deleteClass".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CollegeDao.deleteClass(id);
                response.sendRedirect("classes.jsp?status=deleted");
                return;
            } else if ("addClassroom".equals(action)) {
                String num = request.getParameter("room_number");
                String type = request.getParameter("room_type");
                int cap = Integer.parseInt(request.getParameter("capacity"));
                String avail = request.getParameter("availability");
                String lab = request.getParameter("lab_assignment");
                CollegeDao.addClassroom(num, type, cap, avail, lab);
                response.sendRedirect("classrooms.jsp?status=success");
                return;
            } else if ("deleteClassroom".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CollegeDao.deleteClassroom(id);
                response.sendRedirect("classrooms.jsp?status=deleted");
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
