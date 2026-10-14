package front;

import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;

public class User extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;

	private String username;
	private String password;
	private String email;
	private String country;
	private String role;
	private String fullName;
	private String department;
	private String loginRole; // Expected role: "ADMIN", "FACULTY", "STUDENT"
	private String errorMessage;

	private SessionMap<String, Object> sessionMap;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getLoginRole() {
		return loginRole;
	}

	public void setLoginRole(String loginRole) {
		this.loginRole = loginRole;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String loginCheck() {
		if (sessionMap != null && "true".equals(sessionMap.get("login"))) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String login() {
		Map<String, Object> profile = UserDao.authenticate(username, password, loginRole);
		if (profile != null) {
			if ("ROLE_MISMATCH".equals(profile.get("error"))) {
				String actualRole = (String) profile.get("actualRole");
				setErrorMessage("Unauthorized role: You are registered as " + actualRole + ". Please use the " + actualRole + " login portal.");
				return ERROR;
			}

			sessionMap.put("login", "true");
			sessionMap.put("user", this);
			sessionMap.put("username", profile.get("username"));
			sessionMap.put("role", profile.get("role"));
			sessionMap.put("fullName", profile.get("full_name"));
			sessionMap.put("department", profile.get("department"));
			sessionMap.put("userId", profile.get("id"));

			String userRole = (String) profile.get("role");
			if ("ADMIN".equalsIgnoreCase(userRole)) {
				return "admin-success";
			} else if ("FACULTY".equalsIgnoreCase(userRole)) {
				return "faculty-success";
			} else if ("STUDENT".equalsIgnoreCase(userRole)) {
				return "student-success";
			}
			return SUCCESS;
		} else {
			setErrorMessage("Invalid username or password. Please verify your credentials.");
			return ERROR;
		}
	}

	public String register() {
		if (role == null || role.trim().isEmpty()) role = "STUDENT";
		if (fullName == null || fullName.trim().isEmpty()) fullName = username;
		if (department == null || department.trim().isEmpty()) department = "General";

		if (UserDao.register(username, password, email, country, role, fullName, department)) {
			return SUCCESS;
		}
		return ERROR;
	}

	public void setSession(Map<String, Object> map) {
		sessionMap = (SessionMap<String, Object>) map;
	}

	public String logout() {
		if (sessionMap != null) {
			sessionMap.invalidate();
		}
		return SUCCESS;
	}
}
