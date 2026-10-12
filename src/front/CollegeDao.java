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
                
                rs = st.executeQuery("SELECT COUNT(*) FROM saved_timetables");
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
                PreparedStatement ps = con.prepareStatement("INSERT INTO faculty (faculty_id, name, dept_name, email, assigned_subjects, max_hours, availability, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'Active')");
                ps.setString(1, facultyId);
                ps.setString(2, name);
                ps.setString(3, deptName);
                ps.setString(4, email);
                ps.setString(5, subjects);
                ps.setInt(6, maxHours);
                ps.setString(7, availability);
                boolean ok = ps.executeUpdate() > 0;
                ps.close();
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
                return ok;
            }
        } catch (Exception e) {
            System.out.println("Error in deleteClassroom: " + e);
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
        return false;
    }
}
