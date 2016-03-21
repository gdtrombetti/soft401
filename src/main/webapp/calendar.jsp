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
					<script> var currHref=window.location.href;</script> 
					<div class="favSection">
					<div class="favorited">
						<button onClick='addToQuicklink("<%= curr.getId() %>", currHref, "Calendar")'  type="submit"> 
							<img src="lib/assets/img/favorites.png" height="35">
						</button>
					</div>
					<div class="favorite">
						<button onClick='removeFromQuicklink("<%= curr.getId() %>", "Calendar")'  type="submit" > 
							<img src="lib/assets/img/favorited.png" height="35">
						</button>
					</div>
					</div>
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