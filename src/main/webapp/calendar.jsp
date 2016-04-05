<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="UserData.User"
%>
 <% 
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 
    User curr = (User)(session.getAttribute("currentSessionUser"));
    if(session.getAttribute("currentSessionUser") != null)
    {
   %>

<%@ include file="portal-header.jsp" %>

<div class="row">
	<div class="col-md-3">
		<%@ include file="portal-left-sidebar.jsp" %>
	</div>
	<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title">
					<a class="btn pricing-btn" href="#">Today</a> 
					<a class="btn pricing-btn" href="#">Prev</a>
					<a class="btn pricing-btn" href="#">Next</a>
					<h3>February 2016</h3>
					<%@ include file="calendar-view.jsp"%>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1">
	</div>
</div>
 <% 
    } else {
 	response.sendRedirect("index.jsp");
 }
   %>