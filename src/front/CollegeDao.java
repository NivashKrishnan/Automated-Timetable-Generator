package front;

import java.sql.*;
import java.util.*;

public class CollegeDao {

    public static Map<String, Object> getDashboardStats() {
        Map<String, Object> stats = new HashMap<String, Object>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                
                ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM faculty");
                stats.put("facultyCount", rs.next() ? rs.getInt(1) : 0);
                
                rs = st.executeQuery("SELECT COUNT(*) FROM departments");
                stats.put("deptCount", rs.next() ? rs.getInt(1) : 0);
                
                rs = st.executeQuery("SELECT COUNT(*) FROM subjects");
                stats.put("subjectCount", rs.next() ? rs.getInt(1) : 0);
                
                rs = st.executeQuery("SELECT COUNT(*) FROM classes");
                stats.put("classCount", rs.next() ? rs.getInt(1) : 0);
                
                rs = st.executeQuery("SELECT COUNT(*) FROM classrooms");
                stats.put("roomCount", rs.next() ? rs.getInt(1) : 0);
                
                rs = st.executeQuery("SELECT COUNT(*) FROM timetables");
                stats.put("timetableCount", rs.next() ? rs.getInt(1) : 0);

                rs.close();
                st.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getDashboardStats: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return stats;
    }

    public static List<Map<String, String>> getDepartments() {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id, dept_code, dept_name, hod_name FROM departments ORDER BY dept_name ASC");
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("dept_code", rs.getString("dept_code"));
                    row.put("dept_name", rs.getString("dept_name"));
                    row.put("hod_name", rs.getString("hod_name"));
                    list.add(row);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getDepartments: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static boolean addDepartment(String code, String name, String hod) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO departments (dept_code, dept_name, hod_name) VALUES (?, ?, ?)");
                ps.setString(1, code);
                ps.setString(2, name);
                ps.setString(3, hod);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "DEPT_ADD", "Created department: " + name + " (" + code + ")");
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in addDepartment: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static boolean deleteDepartment(int id) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM departments WHERE id = ?");
                ps.setInt(1, id);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "DEPT_DELETE", "Deleted department ID: " + id);
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in deleteDepartment: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static List<Map<String, String>> getFacultyList() {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id, faculty_id, name, dept_name, email, assigned_subjects, max_hours, availability, status FROM faculty ORDER BY name ASC");
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("faculty_id", rs.getString("faculty_id"));
                    row.put("name", rs.getString("name"));
                    row.put("dept_name", rs.getString("dept_name"));
                    row.put("email", rs.getString("email"));
                    row.put("assigned_subjects", rs.getString("assigned_subjects"));
                    row.put("max_hours", String.valueOf(rs.getInt("max_hours")));
                    row.put("availability", rs.getString("availability"));
                    row.put("status", rs.getString("status"));
                    list.add(row);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getFacultyList: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static boolean addFaculty(String facultyId, String name, String deptName, String email, String subjects, int maxHours, String availability) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO faculty (faculty_id, name, dept_name, email, assigned_subjects, max_hours, availability) VALUES (?, ?, ?, ?, ?, ?, ?)");
                ps.setString(1, facultyId);
                ps.setString(2, name);
                ps.setString(3, deptName);
                ps.setString(4, email);
                ps.setString(5, subjects);
                ps.setInt(6, maxHours);
                ps.setString(7, availability);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "FACULTY_ADD", "Added faculty: " + name + " (" + facultyId + ")");
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in addFaculty: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static boolean deleteFaculty(int id) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM faculty WHERE id = ?");
                ps.setInt(1, id);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "FACULTY_DELETE", "Deleted faculty ID: " + id);
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in deleteFaculty: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static List<Map<String, String>> getSubjectsList() {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id, code, name, dept_name, semester, weekly_hours, type, faculty_name FROM subjects ORDER BY code ASC");
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("code", rs.getString("code"));
                    row.put("name", rs.getString("name"));
                    row.put("dept_name", rs.getString("dept_name"));
                    row.put("semester", String.valueOf(rs.getInt("semester")));
                    row.put("weekly_hours", String.valueOf(rs.getInt("weekly_hours")));
                    row.put("type", rs.getString("type"));
                    row.put("faculty_name", rs.getString("faculty_name"));
                    list.add(row);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getSubjectsList: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static boolean addSubject(String code, String name, String deptName, int semester, int weeklyHours, String type, String facultyName) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO subjects (code, name, dept_name, semester, weekly_hours, type, faculty_name) VALUES (?, ?, ?, ?, ?, ?, ?)");
                ps.setString(1, code);
                ps.setString(2, name);
                ps.setString(3, deptName);
                ps.setInt(4, semester);
                ps.setInt(5, weeklyHours);
                ps.setString(6, type);
                ps.setString(7, facultyName);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "SUBJECT_ADD", "Added course: " + code + " - " + name);
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in addSubject: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static boolean deleteSubject(int id) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM subjects WHERE id = ?");
                ps.setInt(1, id);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "SUBJECT_DELETE", "Deleted subject ID: " + id);
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in deleteSubject: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static List<Map<String, String>> getClassesList() {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id, dept_name, academic_year, semester, year_of_study, section_name, student_count, class_adviser FROM classes ORDER BY section_name ASC");
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("dept_name", rs.getString("dept_name"));
                    row.put("academic_year", rs.getString("academic_year"));
                    row.put("semester", String.valueOf(rs.getInt("semester")));
                    row.put("year_of_study", rs.getString("year_of_study"));
                    row.put("section_name", rs.getString("section_name"));
                    row.put("student_count", String.valueOf(rs.getInt("student_count")));
                    row.put("class_adviser", rs.getString("class_adviser"));
                    row.put("name", rs.getString("section_name"));
                    row.put("department", rs.getString("dept_name"));
                    list.add(row);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getClassesList: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static List<Map<String, String>> getClasses() {
        return getClassesList();
    }

    public static boolean addClass(String deptName, String academicYear, int semester, String yearOfStudy, String sectionName, int studentCount, String adviser) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO classes (dept_name, academic_year, semester, year_of_study, section_name, student_count, class_adviser) VALUES (?, ?, ?, ?, ?, ?, ?)");
                ps.setString(1, deptName);
                ps.setString(2, academicYear);
                ps.setInt(3, semester);
                ps.setString(4, yearOfStudy);
                ps.setString(5, sectionName);
                ps.setInt(6, studentCount);
                ps.setString(7, adviser);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "CLASS_ADD", "Added section: " + sectionName + " (" + deptName + ")");
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in addClass: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static boolean deleteClass(int id) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM classes WHERE id = ?");
                ps.setInt(1, id);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "CLASS_DELETE", "Deleted class ID: " + id);
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in deleteClass: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static List<Map<String, String>> getClassroomsList() {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id, room_number, room_type, capacity, availability, lab_assignment FROM classrooms ORDER BY room_number ASC");
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("room_number", rs.getString("room_number"));
                    row.put("room_type", rs.getString("room_type"));
                    row.put("capacity", String.valueOf(rs.getInt("capacity")));
                    row.put("availability", rs.getString("availability"));
                    row.put("lab_assignment", rs.getString("lab_assignment"));
                    list.add(row);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getClassroomsList: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static boolean addClassroom(String roomNumber, String roomType, int capacity, String availability, String labAssignment) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO classrooms (room_number, room_type, capacity, availability, lab_assignment) VALUES (?, ?, ?, ?, ?)");
                ps.setString(1, roomNumber);
                ps.setString(2, roomType);
                ps.setInt(3, capacity);
                ps.setString(4, availability);
                ps.setString(5, labAssignment);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "ROOM_ADD", "Registered room: " + roomNumber + " (" + roomType + ")");
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in addClassroom: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static boolean deleteClassroom(int id) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("DELETE FROM classrooms WHERE id = ?");
                ps.setInt(1, id);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "ROOM_DELETE", "Deleted classroom ID: " + id);
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in deleteClassroom: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static void logActivity(String userName, String role, String action, String details) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO activity_logs (user_name, role, action, details) VALUES (?, ?, ?, ?)");
                ps.setString(1, userName != null ? userName : "admin");
                ps.setString(2, role != null ? role : "ADMIN");
                ps.setString(3, action != null ? action : "GENERAL");
                ps.setString(4, details != null ? details : "");
                ps.executeUpdate();
                ps.close();
            }
        } catch (Exception ignored) {
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }

    public static List<Map<String, String>> getRecentActivities(int limit) {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement(
                    "SELECT user_name, role, action, details, DATE_FORMAT(created_at, '%b %d, %H:%i') as formatted_date FROM activity_logs ORDER BY id DESC LIMIT ?"
                );
                ps.setInt(1, limit > 0 ? limit : 10);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("user_name", rs.getString("user_name"));
                    row.put("role", rs.getString("role"));
                    row.put("action", rs.getString("action"));
                    row.put("details", rs.getString("details"));
                    row.put("formatted_date", rs.getString("formatted_date"));
                    list.add(row);
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getRecentActivities: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static List<Map<String, String>> getTimetablesList() {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(
                    "SELECT id, title, department, academic_year, semester, section_name, status, version, working_days, periods_per_day, break_slot, DATE_FORMAT(created_at, '%b %d, %Y') as formatted_date FROM timetables ORDER BY id DESC"
                );
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("title", rs.getString("title"));
                    row.put("department", rs.getString("department"));
                    row.put("academic_year", rs.getString("academic_year"));
                    row.put("semester", rs.getString("semester"));
                    row.put("section_name", rs.getString("section_name"));
                    row.put("status", rs.getString("status"));
                    row.put("version", String.valueOf(rs.getInt("version")));
                    row.put("working_days", String.valueOf(rs.getInt("working_days")));
                    row.put("periods_per_day", String.valueOf(rs.getInt("periods_per_day")));
                    row.put("break_slot", String.valueOf(rs.getInt("break_slot")));
                    row.put("formatted_date", rs.getString("formatted_date"));
                    list.add(row);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getTimetablesList: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static Map<String, String> getTimetableById(int id) {
        Map<String, String> row = null;
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement(
                    "SELECT id, title, department, academic_year, semester, section_name, status, version, working_days, periods_per_day, break_slot, DATE_FORMAT(created_at, '%b %d, %Y') as formatted_date FROM timetables WHERE id = ?"
                );
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("title", rs.getString("title"));
                    row.put("department", rs.getString("department"));
                    row.put("academic_year", rs.getString("academic_year"));
                    row.put("semester", rs.getString("semester"));
                    row.put("section_name", rs.getString("section_name"));
                    row.put("status", rs.getString("status"));
                    row.put("version", String.valueOf(rs.getInt("version")));
                    row.put("working_days", String.valueOf(rs.getInt("working_days")));
                    row.put("periods_per_day", String.valueOf(rs.getInt("periods_per_day")));
                    row.put("break_slot", String.valueOf(rs.getInt("break_slot")));
                    row.put("formatted_date", rs.getString("formatted_date"));
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getTimetableById: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return row;
    }

    public static List<Map<String, String>> getTimetableSlots(int timetableId) {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement(
                    "SELECT id, timetable_id, day_index, day_name, period_index, time_slot, subject_code, subject_name, faculty_name, room_no, is_lab FROM timetable_slots WHERE timetable_id = ? ORDER BY day_index ASC, period_index ASC"
                );
                ps.setInt(1, timetableId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("timetable_id", String.valueOf(rs.getInt("timetable_id")));
                    row.put("day_index", String.valueOf(rs.getInt("day_index")));
                    row.put("day_name", rs.getString("day_name"));
                    row.put("period_index", String.valueOf(rs.getInt("period_index")));
                    row.put("time_slot", rs.getString("time_slot"));
                    row.put("subject_code", rs.getString("subject_code"));
                    row.put("subject_name", rs.getString("subject_name"));
                    row.put("faculty_name", rs.getString("faculty_name"));
                    row.put("room_no", rs.getString("room_no"));
                    row.put("is_lab", String.valueOf(rs.getInt("is_lab")));
                    list.add(row);
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getTimetableSlots: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static List<Map<String, String>> getTimetableSlots(String sectionName) {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement(
                    "SELECT s.id, s.timetable_id, s.day_index, s.day_name, s.period_index, s.time_slot, s.subject_code, " +
                    "s.subject_name, s.faculty_name, s.room_no, s.is_lab, t.section_name as class_name, s.faculty_name as teacher_name, " +
                    "CONCAT('Period ', s.period_index) as hour_name " +
                    "FROM timetable_slots s " +
                    "JOIN timetables t ON s.timetable_id = t.id " +
                    "WHERE t.section_name LIKE ? " +
                    "ORDER BY s.day_index ASC, s.period_index ASC LIMIT 35"
                );
                ps.setString(1, "%" + (sectionName != null ? sectionName.trim() : "") + "%");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("timetable_id", String.valueOf(rs.getInt("timetable_id")));
                    row.put("day_index", String.valueOf(rs.getInt("day_index")));
                    row.put("day_name", rs.getString("day_name"));
                    row.put("period_index", String.valueOf(rs.getInt("period_index")));
                    row.put("time_slot", rs.getString("time_slot"));
                    row.put("hour_name", rs.getString("hour_name"));
                    row.put("class_name", rs.getString("class_name"));
                    row.put("subject_code", rs.getString("subject_code"));
                    row.put("subject_name", rs.getString("subject_name"));
                    row.put("teacher_name", rs.getString("teacher_name"));
                    row.put("faculty_name", rs.getString("faculty_name"));
                    row.put("room_no", rs.getString("room_no"));
                    row.put("is_lab", String.valueOf(rs.getInt("is_lab")));
                    list.add(row);
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getTimetableSlots(sectionName): " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static boolean updateTimetableStatus(int id, String status) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement("UPDATE timetables SET status = ? WHERE id = ?");
                ps.setString(1, status);
                ps.setInt(2, id);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "TIMETABLE_UPDATE", "Updated timetable #" + id + " status to: " + status);
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in updateTimetableStatus: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static boolean deleteTimetable(int id) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps1 = con.prepareStatement("DELETE FROM timetable_slots WHERE timetable_id = ?");
                ps1.setInt(1, id);
                ps1.executeUpdate();
                ps1.close();

                PreparedStatement ps2 = con.prepareStatement("DELETE FROM timetables WHERE id = ?");
                ps2.setInt(1, id);
                boolean ok = ps2.executeUpdate() > 0;
                ps2.close();
                if (ok) logActivity("admin", "ADMIN", "TIMETABLE_DELETE", "Deleted timetable #" + id);
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in deleteTimetable: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static boolean updateSlot(int id, String subjectCode, String subjectName, String facultyName, String roomNo, int isLab) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                PreparedStatement ps = con.prepareStatement(
                    "UPDATE timetable_slots SET subject_code = ?, subject_name = ?, faculty_name = ?, room_no = ?, is_lab = ? WHERE id = ?"
                );
                ps.setString(1, subjectCode);
                ps.setString(2, subjectName);
                ps.setString(3, facultyName);
                ps.setString(4, roomNo);
                ps.setInt(5, isLab);
                ps.setInt(6, id);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
                if (ok) logActivity("admin", "ADMIN", "SLOT_UPDATE", "Updated slot #" + id + " (" + subjectCode + " - " + facultyName + ")");
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in updateSlot: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }

    public static String checkSlotConflict(int dayIndex, int periodIndex, String facultyName, String roomNo, int excludeSlotId) {
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null) {
                if (facultyName != null && !facultyName.trim().isEmpty() && !facultyName.equalsIgnoreCase("Free Period")) {
                    PreparedStatement ps1 = con.prepareStatement(
                        "SELECT t.section_name, s.day_name, s.period_index FROM timetable_slots s JOIN timetables t ON s.timetable_id = t.id WHERE s.day_index = ? AND s.period_index = ? AND s.faculty_name = ? AND s.id != ? LIMIT 1"
                    );
                    ps1.setInt(1, dayIndex);
                    ps1.setInt(2, periodIndex);
                    ps1.setString(3, facultyName.trim());
                    ps1.setInt(4, excludeSlotId);
                    ResultSet rs1 = ps1.executeQuery();
                    if (rs1.next()) {
                        String conflict = "Faculty clash: " + facultyName + " is already teaching " + rs1.getString("section_name") + " on " + rs1.getString("day_name") + " (Period " + (rs1.getInt("period_index") + 1) + ")!";
                        rs1.close();
                        ps1.close();
                        return conflict;
                    }
                    rs1.close();
                    ps1.close();
                }

                if (roomNo != null && !roomNo.trim().isEmpty() && !roomNo.equalsIgnoreCase("TBD")) {
                    PreparedStatement ps2 = con.prepareStatement(
                        "SELECT t.section_name, s.day_name, s.period_index FROM timetable_slots s JOIN timetables t ON s.timetable_id = t.id WHERE s.day_index = ? AND s.period_index = ? AND s.room_no = ? AND s.id != ? LIMIT 1"
                    );
                    ps2.setInt(1, dayIndex);
                    ps2.setInt(2, periodIndex);
                    ps2.setString(3, roomNo.trim());
                    ps2.setInt(4, excludeSlotId);
                    ResultSet rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        String conflict = "Room collision: Room " + roomNo + " is occupied by " + rs2.getString("section_name") + " on " + rs2.getString("day_name") + " (Period " + (rs2.getInt("period_index") + 1) + ")!";
                        rs2.close();
                        ps2.close();
                        return conflict;
                    }
                    rs2.close();
                    ps2.close();
                }
            }
        } catch (Exception e) {
            System.out.println("Error in checkSlotConflict: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return null;
    }

    public static List<Map<String, String>> getFacultyTimetableSlots(String facultyName) {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null && facultyName != null && !facultyName.trim().isEmpty()) {
                PreparedStatement ps = con.prepareStatement(
                    "SELECT s.id, s.timetable_id, t.section_name, t.department, s.day_index, s.day_name, s.period_index, s.time_slot, s.subject_code, s.subject_name, s.faculty_name, s.room_no, s.is_lab FROM timetable_slots s JOIN timetables t ON s.timetable_id = t.id WHERE (s.faculty_name LIKE ? OR s.faculty_name = ?) ORDER BY s.day_index ASC, s.period_index ASC"
                );
                String pattern = "%" + facultyName.trim() + "%";
                ps.setString(1, pattern);
                ps.setString(2, facultyName.trim());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Map<String, String> row = new HashMap<String, String>();
                    row.put("id", String.valueOf(rs.getInt("id")));
                    row.put("timetable_id", String.valueOf(rs.getInt("timetable_id")));
                    row.put("section_name", rs.getString("section_name"));
                    row.put("department", rs.getString("department"));
                    row.put("day_index", String.valueOf(rs.getInt("day_index")));
                    row.put("day_name", rs.getString("day_name"));
                    row.put("period_index", String.valueOf(rs.getInt("period_index")));
                    row.put("time_slot", rs.getString("time_slot"));
                    row.put("subject_code", rs.getString("subject_code"));
                    row.put("subject_name", rs.getString("subject_name"));
                    row.put("faculty_name", rs.getString("faculty_name"));
                    row.put("room_no", rs.getString("room_no"));
                    row.put("is_lab", String.valueOf(rs.getInt("is_lab")));
                    list.add(row);
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getFacultyTimetableSlots: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return list;
    }

    public static Map<String, Object> getFacultyWorkloadStats(String facultyName) {
        Map<String, Object> stats = new HashMap<String, Object>();
        Connection con = null;
        try {
            con = UserDao.getConnection();
            if (con != null && facultyName != null && !facultyName.trim().isEmpty()) {
                PreparedStatement ps = con.prepareStatement(
                    "SELECT COUNT(*) as total_slots, COUNT(DISTINCT s.subject_name) as distinct_subjects, COUNT(DISTINCT s.day_index) as active_days FROM timetable_slots s JOIN timetables t ON s.timetable_id = t.id WHERE (s.faculty_name LIKE ? OR s.faculty_name = ?)"
                );
                String pattern = "%" + facultyName.trim() + "%";
                ps.setString(1, pattern);
                ps.setString(2, facultyName.trim());
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    stats.put("totalHours", rs.getInt("total_slots"));
                    stats.put("distinctSubjects", rs.getInt("distinct_subjects"));
                    stats.put("activeDays", rs.getInt("active_days"));
                }
                rs.close();
                ps.close();
            }
        } catch (Exception e) {
            System.out.println("Error in getFacultyWorkloadStats: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return stats;
    }
}
