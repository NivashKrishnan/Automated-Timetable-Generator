package front;

import java.sql.*;
import java.util.*;

public class UserDao {

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
			} catch (Exception ex) {
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "", "");
			}
		} catch (Exception e) {
			System.out.println("UserDao getConnection error: " + e);
		}
		return con;
	}

	public static boolean validate(String username, String password) {
		Connection con = null;
		try {
			con = getConnection();
			if (con != null) {
				PreparedStatement ps = con.prepareStatement("SELECT id, password, password_hash FROM users WHERE username = ? OR email = ?");
				ps.setString(1, username);
				ps.setString(2, username);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					int id = rs.getInt("id");
					String storedPlain = rs.getString("password");
					String storedHash = rs.getString("password_hash");
					if (SecurityUtil.verify(password, storedHash, storedPlain)) {
						if (storedHash == null || storedHash.trim().isEmpty()) {
							migratePasswordHash(id, password);
						}
						rs.close();
						ps.close();
						return true;
					}
				}
				rs.close();
				ps.close();
			}
		} catch (Exception e) {
			System.out.println("UserDao validate error: " + e);
		} finally {
			try { if (con != null) con.close(); } catch (Exception ignored) {}
		}
		return false;
	}

	public static Map<String, Object> authenticate(String usernameOrEmail, String password, String expectedRole) {
		Map<String, Object> userProfile = null;
		Connection con = null;
		try {
			con = getConnection();
			if (con != null) {
				PreparedStatement ps = con.prepareStatement(
					"SELECT id, username, password, password_hash, email, full_name, role, department FROM users WHERE username = ? OR email = ?"
				);
				ps.setString(1, usernameOrEmail != null ? usernameOrEmail.trim() : "");
				ps.setString(2, usernameOrEmail != null ? usernameOrEmail.trim() : "");
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					int id = rs.getInt("id");
					String storedPlain = rs.getString("password");
					String storedHash = rs.getString("password_hash");
					String actualRole = rs.getString("role");
					if (actualRole == null || actualRole.trim().isEmpty()) {
						actualRole = "STUDENT";
					}

					if (SecurityUtil.verify(password, storedHash, storedPlain)) {
						// Verify role matches expected portal (case-insensitive)
						if (expectedRole == null || expectedRole.trim().isEmpty() || expectedRole.equalsIgnoreCase("ANY") || actualRole.equalsIgnoreCase(expectedRole.trim())) {
							userProfile = new HashMap<String, Object>();
							userProfile.put("id", id);
							userProfile.put("username", rs.getString("username"));
							userProfile.put("email", rs.getString("email"));
							userProfile.put("full_name", rs.getString("full_name") != null ? rs.getString("full_name") : rs.getString("username"));
							userProfile.put("role", actualRole.toUpperCase());
							userProfile.put("department", rs.getString("department") != null ? rs.getString("department") : "General");

							if (storedHash == null || storedHash.trim().isEmpty()) {
								migratePasswordHash(id, password);
							}
						} else {
							// Password matched but role is unauthorized for this portal
							userProfile = new HashMap<String, Object>();
							userProfile.put("error", "ROLE_MISMATCH");
							userProfile.put("actualRole", actualRole);
						}
					}
				}
				rs.close();
				ps.close();
			}
		} catch (Exception e) {
			System.out.println("UserDao authenticate error: " + e);
		} finally {
			try { if (con != null) con.close(); } catch (Exception ignored) {}
		}
		return userProfile;
	}

	public static void migratePasswordHash(int userId, String plainPassword) {
		Connection con = null;
		try {
			con = getConnection();
			if (con != null) {
				String hash = SecurityUtil.hashPassword(plainPassword);
				PreparedStatement ps = con.prepareStatement("UPDATE users SET password_hash = ? WHERE id = ?");
				ps.setString(1, hash);
				ps.setInt(2, userId);
				ps.executeUpdate();
				ps.close();
			}
		} catch (Exception e) {
			System.out.println("Error migrating password hash for user " + userId + ": " + e);
		} finally {
			try { if (con != null) con.close(); } catch (Exception ignored) {}
		}
	}

	public static boolean register(String username, String password, String email, String country) {
		return register(username, password, email, country, "STUDENT", username, "General");
	}

	public static boolean register(String username, String password, String email, String country, String role, String fullName, String department) {
		boolean status = false;
		Connection con = null;
		try {
			con = getConnection();
			if (con != null) {
				String hash = SecurityUtil.hashPassword(password);
				if (role == null || role.trim().isEmpty()) role = "STUDENT";
				if (fullName == null || fullName.trim().isEmpty()) fullName = username;
				if (department == null || department.trim().isEmpty()) department = "General";

				PreparedStatement ps = con.prepareStatement(
					"INSERT INTO users (username, password, password_hash, country, email, role, full_name, department) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
				);
				ps.setString(1, username != null ? username.trim() : "");
				ps.setString(2, password); // kept for backwards compatibility with legacy schema
				ps.setString(3, hash);
				ps.setString(4, country != null ? country : "India");
				ps.setString(5, email != null ? email.trim() : "");
				ps.setString(6, role.toUpperCase());
				ps.setString(7, fullName);
				ps.setString(8, department);

				if (ps.executeUpdate() > 0) {
					status = true;
				}
				ps.close();
			}
		} catch (Exception e) {
			System.out.println("UserDao register error: " + e);
		} finally {
			try { if (con != null) con.close(); } catch (Exception ignored) {}
		}
		return status;
	}

	public static List<Map<String, String>> getAllUsers() {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Connection con = null;
		try {
			con = getConnection();
			if (con != null) {
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT id, username, email, full_name, role, department FROM users ORDER BY id ASC");
				while (rs.next()) {
					Map<String, String> row = new HashMap<String, String>();
					row.put("id", String.valueOf(rs.getInt("id")));
					row.put("username", rs.getString("username"));
					row.put("email", rs.getString("email"));
					row.put("full_name", rs.getString("full_name"));
					row.put("role", rs.getString("role"));
					row.put("department", rs.getString("department"));
					list.add(row);
				}
				rs.close();
				st.close();
			}
		} catch (Exception e) {
			System.out.println("UserDao getAllUsers error: " + e);
		} finally {
			try { if (con != null) con.close(); } catch (Exception ignored) {}
		}
		return list;
	}

	public static boolean deleteUser(int id) {
		Connection con = null;
		try {
			con = getConnection();
			if (con != null) {
				PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id = ?");
				ps.setInt(1, id);
				boolean ok = ps.executeUpdate() > 0;
				ps.close();
				return ok;
			}
		} catch (Exception e) {
			System.out.println("UserDao deleteUser error: " + e);
		} finally {
			try { if (con != null) con.close(); } catch (Exception ignored) {}
		}
		return false;
	}
}