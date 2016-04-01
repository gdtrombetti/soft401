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
    User currUser = (User)(session.getAttribute("currentSessionUser"));
    if(session.getAttribute("currentSessionUser") != null)
    {
   %>
<%@ include file="portal-header.jsp" %>

<div id="flavor">
<% 
if(currUser.getFavorite_topic().equals("CS")) {
	%>
	<script>
	document.getElementById("flavor").style.backgroundImage = "url('https://images6.alphacoders.com/426/426414.jpg')";
	</script>
	<%
}else if(currUser.getFavorite_topic().equals("Math")) {
	%>
	<script>
	document.getElementById("flavor").style.backgroundImage = "url('https://images2.alphacoders.com/969/96952.jpg')";
	</script>
	<%
}else if(currUser.getFavorite_topic().equals("Business")) {
	%>
	<script>
	document.getElementById("flavor").style.backgroundImage = "url('http://thumbs.dreamstime.com/z/blue-business-background-7938257.jpg')";
	</script>
	<%
}else if(currUser.getFavorite_topic().equals("Biology")) {
	%>
	<script>
	document.getElementById("flavor").style.backgroundImage = "url('http://il1.picdn.net/shutterstock/videos/2805538/thumb/8.jpg?i10c=img.resize(height:160)')";
	</script>
	<%
}else if(currUser.getFavorite_topic().equals("Art")) {
	%>
	<script>
	document.getFavoriteById("flavor").style.backgroundImage = "url('http://www.webdesignhot.com/wp-content/uploads/2011/05/Abstract-Design-Vector-Art-Background.jpg')";
	</script>
	<%
}else {
	%>
	<script>
	getFavoriteById("flavor").style.backgroundImage = "none";
	</script>
	<%
}
	%>


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
</div>
<%}
else{
	response.sendRedirect("index.jsp");
}%>
<%@ include file="portal-footer.html" %>
	
