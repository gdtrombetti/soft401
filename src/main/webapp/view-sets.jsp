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
<p>&nbsp;</p>
<p>&nbsp;</p>
<div ng-app="MyApp">
	<div class ="row">
		<div class="col-md-3">
			<%@ include file="portal-left-sidebar.jsp" %>
		</div>
		<div class="col-md-6">
    		<div class="panel panel-default">
	        		<a href="create-card-set.jsp" class="btn btn-slategray2">Add Flash Card Set</a>
	        		<div class="panel-heading">
	            		<h4 style="color: #65c8e5;" "class="panel-title">YOUR FLASH CARD SETS</h4>
	        		</div>
	        		<div data-ng-controller="CardSetController" data-ng-init="getSets('<%= currUser.getId() %>')">
	        			<div data-ng-repeat="set in sets">
		        			<div class="panel-body">  
		        				<h3 class="panel-title"><b>{{set.title}}</b></h3> 
		        				<br/>                 
		            			<div class="flash-card-set-container">
		                			<ul>
		                				<li class="view-sets-text"><b>Subject:</b> {{set.subject}}</li>
		                				<li class="view-sets-text"><b>Description:</b> {{set.description}}</li>
		                				<li class="view-sets-text"><b>Number of Cards:</b> {{set.count}}</li>
		                				
		                				<div data-ng-if="<%= currUser.getType() %> == 1">
		                					<li><h3><a class="anchor" data-ng-click="directToFlashCard(set.title, set.subject)">Add</a> | <a class="anchor" data-ng-click="removeFlashCardSet(set.title, '<%= currUser.getId() %>')" >Delete </a> | <a class="anchor" data-ng-click="directToStudyCard(set.title, set.subject)">Study</a> | <a class="anchor" data-ng-click="directToQuiz(set.title, set.id)" >Quiz </a> </h3></li>
		                				</div>
		                				<div data-ng-if="<%= currUser.getType() %> == 2">
		                					<li><h3><a class="anchor" data-ng-click="directToFlashCard(set.title, set.subject)">Add</a> | <a class="anchor" data-ng-click="removeFlashCardSet(set.title, '<%= currUser.getId() %>')" >Delete </a> | <a class="anchor" data-ng-click="directToStudyCard(set.title, set.subject)">Study</a> | <a class="anchor" data-ng-click="directToQuiz(set.title, set.id)" >Quiz </a> |<a class="anchor" data-ng-click="directToShare(set.title, set.id, <%= currUser.getId() %>)" > Share Card Set </a> </h3></li>
		                				</div>
		                			</ul>
		                		</div>
	    					</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<% } else {
	response.sendRedirect("index.jsp");	
}%>
<%@ include file="portal-footer.html" %>