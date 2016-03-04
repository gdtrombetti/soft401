<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="UserData.User"
   %>
   <% 
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 
    new java.util.Date();
    if(session.getAttribute("currentSessionUser") != null)
    {
   %>
<%@ include file="portal-header.jsp" %>

<div class ="row">
	<div class="col-md-3">
		<%@ include file="portal-left-sidebar.jsp" %>
	</div>
	<div class="col-md-6">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="panel-title">Welcome, User</h1>
					</div>		
				<div class="panel-body">
					<div class="portal-container">
						<h2 class="panel-title">Recent Sets</h2>
					</div>
				</div>
				</div>
			</div>	
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">Date/Time</div>
					</div>
					<div class="panel-body">
						<div class="portal-container">
							<h2 class="panel-title">Notifications</h2>
						</div>
					</div>
				</div>
			</div>
	
</div>
		<div class="col-md-3">
			<%@ include file="portal-right-sidebar.jsp" %>
		</div>
<div class="col-md-6">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">Statistics</div>
		</div>
			<div class="panel-body">
				<div class="portal-container">This is where the individualized stats will be located</div>
			</div>	
		
	</div>
</div>
		
</div>
<%}
else
	response.sendRedirect("index.jsp");%>
