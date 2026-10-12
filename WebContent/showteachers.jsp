<%
	String si = (String)request.getParameter("val");
	if(si != null && !si.trim().isEmpty()){
		try {
			int i = Integer.parseInt(si);
			if(i > 0) {
%>
			<div style="background:#f8fafc; border-radius:10px; padding:18px 20px; border:1px solid #e2e8f0; margin-top:12px;">
				<div style="font-weight:700; font-size:13px; color:#0f172a; margin-bottom:14px;">
					<i class="fa fa-users text-primary" style="margin-right:6px;"></i> Faculty Members & Allocated Course Subject
				</div>
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
							<input type="text" class="form-control" name="teacher" placeholder="e.g. O.N.Singh" required>
						</div>
					</div>
					<div class="col-xs-12 col-sm-5">
						<div class="input-group">
							<span class="input-group-addon" style="font-size:12px; font-weight:600; background:#f1f5f9;"><i class="fa fa-book"></i> Subject Code</span>
							<input type="text" class="form-control" name="teachersubject" placeholder="e.g. AP-1101" required>
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