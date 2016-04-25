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
<body ng-app="MyApp">

<div class="row">
	<div class="col-md-3">
	<%@ include file="portal-left-sidebar.jsp" %>
	</div>
	<div class="col-md-6">
			<h2 align="center">CREATE FLASHCARD SET</h2>
			<br/>
			<br/>
        	<form name="card_set" novalidate role="form" data-ng-controller="CardSetController">
        	<h2 class="panel-title">TITLE:</h2>
	       	<div class="form-group">
	         	<input type="title"  data-ng-model="title" class="form-control" placeholder="Title" id="title" required>
	         </div>
	        <h2 class="panel-title">SUBJECT:</h2>
             <div class="form-group">
				<input type="subject" data-ng-model="subject" class="form-control" placeholder="Subject" id="subject" required>
			</div>
			<h2 class="panel-title">DESCRIPTION:</h2>
			<div class="form-group">
			 
    <textarea id="text" cols="40" rows="5" my-maxlength="5" data-ng-model="description"></textarea>
    </div>
    <input type="hidden" name="" data-ng-init="userId=<%= currUser.getId() %>" data-ng-value="type"/>
			<button data-ng-click="AddSet()" class="btn btn-white-ish-lol">Create</button>
			<h2>{{set_message}}</h2>
		</form>
	</div>
	<div class="col-md-3"></div>
</div>	
	<% } else {
		response.sendRedirect("index.jsp");
	}%>
<%@ include file="portal-footer.html" %>	


       

	

 
 
