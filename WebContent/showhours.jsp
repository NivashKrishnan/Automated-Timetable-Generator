<%
	String si = (String)request.getParameter("val");
	if(si != null && !si.trim().isEmpty()){
		try {
			int i = Integer.parseInt(si);	
			if(i > 0) {
%>
			<div style="background:#f8fafc; border-radius:10px; padding:16px 20px; border:1px solid #e2e8f0; margin-top:12px;">
				<div style="font-weight:700; font-size:13px; color:#0f172a; margin-bottom:12px;">
					<i class="fa fa-clock-o text-primary" style="margin-right:6px;"></i> Daily Period Start & End Timings
				</div>
<%
				for(int j = 0; j < i; j++){
%>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-xs-12 col-sm-2" style="padding-top:7px;">
						<span class="badge-pill badge-theory" style="font-size:12px; font-weight:700;">Period <%= (j+1) %></span>
					</div>
					<div class="col-xs-6 col-sm-5">
						<div class="input-group">
							<span class="input-group-addon" style="font-size:12px; font-weight:600; background:#f1f5f9;">Start</span>
							<input type="time" class="form-control" name="<%="start"+j %>" required>
						</div>
					</div>
					<div class="col-xs-6 col-sm-5">
						<div class="input-group">
							<span class="input-group-addon" style="font-size:12px; font-weight:600; background:#f1f5f9;">End</span>
							<input type="time" class="form-control" name="<%="end"+j %>" required>
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