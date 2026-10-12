<script type="text/javascript" src="vendor/bootstrap/js/custom.js"></script>
<%
	String si = (String)request.getParameter("val");
	if(si != null && !si.trim().isEmpty()){
		try {
			int i = Integer.parseInt(si);
			if(i > 0) {
%>
			<div style="background:#f8fafc; border-radius:10px; padding:18px 20px; border:1px solid #e2e8f0; margin-top:12px;">
				<div style="font-weight:700; font-size:13px; color:#0f172a; margin-bottom:14px;">
					<i class="fa fa-id-badge text-primary" style="margin-right:6px;"></i> Student Groups, Class Sections & Subject Hours
				</div>
<%
				for(int j = 0; j < i; j++){
%>
				<div style="background:#fff; border-radius:8px; padding:14px 16px; border:1px solid #e2e8f0; margin-bottom:12px;">
					<div class="row" style="align-items:center;">
						<div class="col-xs-12 col-sm-1" style="padding-top:7px;">
							<span class="badge-pill badge-theory" style="font-size:12px;">Batch <%= (j+1) %></span>
						</div>
						<div class="col-xs-12 col-sm-6">
							<div class="input-group">
								<span class="input-group-addon" style="font-size:12px; font-weight:600; background:#f1f5f9;"><i class="fa fa-graduation-cap"></i> Batch Name</span>
								<input type="text" class="form-control" name="studentgroup" placeholder="e.g. ECE(Ist-Year)" required>
							</div>
						</div>
						<div class="col-xs-12 col-sm-5">
							<div class="input-group">
								<span class="input-group-addon" style="font-size:12px; font-weight:600; background:#f1f5f9;"><i class="fa fa-list-ol"></i> No. Subjects</span>
								<input type="number" class="form-control" oninput="sendInfo4(<%=j %>)" id="<%="nosubject"+j %>" name="nosubject" placeholder="e.g. 5" min="1" max="10" required>
							</div>
						</div>
					</div>
					<div id="<%="sub"+j %>" style="margin-top:10px;"></div>
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