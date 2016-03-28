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
<body ng-app="CardSetControllers">
<div class ="row">
	<div class="col-md-3">
		<%@ include file="portal-left-sidebar.jsp" %>
	</div>
	<div class="col-md-6">
    	<div class="panel panel-default">
        	<a href="create-card-set.jsp" class="btn btn-slategray">Add Flash Card Set</a>
        	<div class="panel-heading">
            	<h3 class="panel-title">Your Flash Card Sets</h3>
        	</div>
        	<div data-ng-controller="CardSetController" data-ng-init="getSets('<%= currUser.getId() %>')">
        	<div class="panel-body">  
        		<h3 class="panel-title">Software Engineering</h3> 
        		<br/>                 
            	<div class="flash-card-set-container">
                	<ul>
                		<li class="view-sets-text"><b>Description:</b> This is the card set for CSCI 401</li>
                		<li class="view-sets-text"><b>Number of Cards:</b> 36</li>
                		<li><h3><a href="#">Edit</a> | <a href="#">Delete </a> | <a href="#">Study</a></h3></li>
                	</ul>
                </div>
              
                <h3 class="panel-title">BIO 100</h3>
                <br/>
                	<div class="flash-card-set-container">
                		<ul>
                			<li class="view-sets-text"><b>Description:</b> This is the card set for BIO 100 (Lab)</li>
                			<li class="view-sets-text"><b>Number of Cards:</b> 12</li>
                			<li><h3><a href="#">Edit</a> | <a href="#">Delete </a> | <a href="#">Study</a></h3></li>
                		</ul>
            		</div>
        		</div>
    		</div>
		</div>
	</div>
</div>
<% } else {
	response.sendRedirect("index.jsp");	
}%>
}
<%@ include file="portal-footer.html" %>