<%
	String si = (String)request.getParameter("val");
	if(si != null && !si.trim().isEmpty()){
		try {
			int i = Integer.parseInt(si);
			if(i > 0) {
%>
			<div style="background:#fff; border-radius:8px; padding:12px 14px; border:1px dashed #cbd5e1; margin-top:8px; margin-bottom:12px;">
				<div style="font-size:11.5px; font-weight:700; color:#64748b; text-transform:uppercase; margin-bottom:8px;">
					Subject Curriculum Load Allocation
				</div>
<%
				for(int j = 0; j < i; j++){
%>
				<div class="row" style="margin-bottom: 8px;">
					<div class="col-xs-12 col-sm-7">
						<div class="input-group">
							<span class="input-group-addon" style="font-size:11px; background:#f8fafc;">Subject <%= (j+1) %></span>
							<input type="text" class="form-control" name="stgrpsubject" placeholder="e.g. AP-1101" required>
						</div>
					</div>
					<div class="col-xs-12 col-sm-5">
						<div class="input-group">
							<span class="input-group-addon" style="font-size:11px; background:#f8fafc;"><i class="fa fa-clock-o"></i> Hrs/Wk</span>
							<input type="number" class="form-control" name="subjecttime" placeholder="Hrs" min="1" max="10" required>
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