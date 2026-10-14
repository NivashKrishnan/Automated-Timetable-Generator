<%@ page import="front.CollegeDao, java.util.*" %>
<%
	String si = (String)request.getParameter("val");
	if(si != null && !si.trim().isEmpty()){
		try {
			int i = Integer.parseInt(si);
			if(i > 0) {
				List<Map<String, String>> facList = CollegeDao.getFacultyList();
				List<Map<String, String>> subList = CollegeDao.getSubjectsList();
%>
			<div style="background:#f8fafc; border-radius:10px; padding:18px 20px; border:1px solid #e2e8f0; margin-top:12px;">
				<div style="font-weight:700; font-size:13px; color:#0f172a; margin-bottom:14px;">
					<i class="fa fa-users text-primary" style="margin-right:6px;"></i> Faculty Members & Allocated Course Subject
					<span style="font-weight:400; font-size:12px; color:#64748b; margin-left:8px;">(Select from registered faculty or type a custom name)</span>
				</div>

				<datalist id="registeredFacultyList">
					<% if(facList != null) { for(Map<String, String> f : facList) { %>
						<option value="<%= f.get("name") %>"><%= f.get("dept_name") %></option>
					<% }} %>
				</datalist>

				<datalist id="registeredSubjectList">
					<% if(subList != null) { for(Map<String, String> s : subList) { %>
						<option value="<%= s.get("code") %>"><%= s.get("name") %></option>
					<% }} %>
				</datalist>

<%
				for(int j = 0; j < i; j++){
%>
				<div class="row" style="margin-bottom: 12px; align-items:center;">
					<div class="col-xs-12 col-sm-1" style="padding-top:7px;">
						<span class="badge-pill badge-theory" style="font-size:12px;">#<%= (j+1) %></span>
					</div>
					<div class="col-xs-12 col-sm-6">
						<div class="input-group">
							<span class="input-group-addon" style="font-size:12px; font-weight:600; background:#f1f5f9;"><i class="fa fa-user"></i> Professor</span>
							<input type="text" class="form-control" name="teacher" list="registeredFacultyList" placeholder="Select or type custom faculty (e.g. O.N.Singh)" required>
						</div>
					</div>
					<div class="col-xs-12 col-sm-5">
						<div class="input-group">
							<span class="input-group-addon" style="font-size:12px; font-weight:600; background:#f1f5f9;"><i class="fa fa-book"></i> Subject Code</span>
							<input type="text" class="form-control" name="teachersubject" list="registeredSubjectList" placeholder="Select or type custom code (e.g. AP-1101)" required>
						</div>
					</div>
				</div>
<%
				}
%>
			</div>
<%
			}
		} catch(Exception ignored) {}
	}
%>